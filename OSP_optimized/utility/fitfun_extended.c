/*
 *  fitfun_extended.c
 */

#include <stdio.h>
#include <stdlib.h>
#include "auxil.c"
#include <cuda.h>


//void model(double *g, double *d);

struct model_data_
{
	double mygamma;
        double *theta;
        int N_samples;
        int N_sensors;
} model_data;

#include "model.c"

struct utility_data_
{
	double *theta;
	double **z;	// this is different for each CMA
	double *sigma;
	double lamb;
	int corr_error;
        int N_samples;
        int N_sensors;
	int N_u;
} utility_data;

#include "extended_utility.c"

extern void model(double *g, double *d);


//set parameters
const double mygamma = 1.0;		//vortex strength
const int N_samples = 500;		//number of samples of \theta = (x,y) coords
const int N_sensors = 3;		//number of sensors to be placed
const double err_strength = 0.01;	//relative strength of error = uncertainty
int corr_error = 1;			//use correlated prediction error? = error correlated to distance between sensors. Sensors close by => penalty high (to avoid all sensors falling in same place)
const int N_cmaes = 1;
const int N_u = 10;

//// draw N_samples samples from prior for \theta
//prior area: borders = probable area where vortex can exist
double x0_l = 0.5;	//x_lower
double x0_u = 1.0;	//x_upper
double y0_l = 0.5;	//y_lower
double y0_u = 1.0;	//y_upper


void fitfun_init()
{   
	
	gsl_rand_init(0);

	//generate samples assuming a uniform prior distribution
	printf("Generate Samples...\n");
	//double theta[N_samples*2];	//theta = zeros(N_samples,2);
	double *theta =(double *) malloc(N_samples*2*sizeof(double));

	//theta(:,1) = random('unif', x0_l, x0_u, N_samples,1);
	//theta(:,2) = random('unif', y0_l, y0_u, N_samples,1);
	for (int i = 0; i < N_samples; i++)
	{
		theta[i*2+0] = x0_l + drand48()*(x0_u-x0_l);
		theta[i*2+1] = y0_l + drand48()*(y0_u-y0_l);
	}

	////build correlation matrix, first part (diagonal entries)
	//error has a magnitude dependent on mean(g(\theta,d)).
	//Sample for different d and compute mean
	printf("Estimate error strength by sampling...\n");
	int N_corr = 50;

	//d1 = linspace(-5,10,N_corr);     %sampling area = most probable area of sensor location
	//d2 = linspace(0,5,N_corr);
	double d1[N_corr];
	double d2[N_corr];

	double d1_min = -5;
	double d2_min = 0;
	double d1_max = 10;
	double d2_max = 5;


	for (int i = 0; i < N_corr; i++)
	{
		d1[i] = d1_min + i*((d1_max-d1_min)/(N_corr-1));
		d2[i] = d2_min + i*((d2_max-d2_min)/(N_corr-1));
	}

	double g_mean[N_sensors];
	for (int i = 0; i < N_sensors; i++)
		g_mean[i] = 0;

	////loop over samples in parallel for speedup
	double m[N_samples*N_sensors];

	model_data.mygamma = mygamma;
	model_data.theta = theta;
	model_data.N_samples =  N_samples;
	model_data.N_sensors = N_sensors;


	for (int i = 0; i < N_corr; i++)
	{
		for (int j = 0; j < N_corr; j++)
		{
			double d[2];
			d[0] = d1[i];
			d[1] = d2[j];

			//model(m, mygamma, theta, d, N_samples, N_sensors);
			model(m, d);

			double sum[N_sensors];
			for (int j = 0; j < N_sensors; j++)
			{
				sum[j] = 0;
				for (int k = 0; k < N_samples; k++)
					sum[j] += m[k*N_sensors + j];

				sum[j] /= N_samples;
				g_mean[j] += sum[j];
			}
		}
	}

	//g_mean = mean(g_mean)/(N_corr^2);
	double g_meanv = 0;
	for (int i = 0; i < N_sensors; i++)
	{
		g_meanv += g_mean[i];
	}
	g_meanv /= N_sensors;
	g_meanv /= (N_corr*N_corr);

	//g_mean=g_mean

	//build diagonal of correlation matrix sigma prop. to g_mean
	printf("Building diagonal of sigma...\n"); // sigma = corr matrix

	//sigma = eye(N_sensors)*g_mean*err_strength;
	//double sigma[N_sensors*N_sensors];
	double *sigma = (double *) malloc(N_sensors*N_sensors*sizeof(double));

	for (int i = 0; i < N_sensors; i++)
	for (int j = 0; j < N_sensors; j++)
	{
		if (i != j)
			sigma[i*N_sensors+j] = 0.0;
		else
			sigma[i*N_sensors+j] = 1.0*g_meanv*err_strength;
	}

	//define correlation length \lambda
	double lamb = (x0_u - x0_l)*0.1; // exponential penalty depending on lambda => to penalize too close placement

	//// prepare everything for CMA-ES
	printf("Prepare for CMA-ES...\n");

	//function handle to model
	//g = @(d) model(gamma,theta,d,N_sensors);

	//prediction error: sampled as normal distributed with zero
	//mean and variance one

	//z = mvnrnd(zeros(N_samples, N_sensors),eye(N_sensors)); // built in - multivariate rng	// peh: from pi4u
	//double z[N_samples*N_sensors];
	double **z;
	z  = (double **) calloc(1, N_u*sizeof(double *));
	for (int n = 0; n < N_u; n++)
		z[n]  = (double *)calloc(1, N_samples*N_sensors*sizeof(double));


	double zeros[N_sensors];
	double eye[N_sensors*N_sensors];

	memset(zeros, 0, N_sensors*sizeof(double));
	memset(eye, 0, N_sensors*N_sensors*sizeof(double));
	for (int i = 0; i < N_sensors; i++)
		eye[i*N_sensors+i] = 1.0;


	for (int n = 0; n < N_u; n++)
	{
	for (int i = 0; i < N_samples; i++)
	{
		mvnrnd(zeros, eye, &z[n][i*N_sensors+0], N_sensors);
	}
	}

	utility_data.theta = theta;
	utility_data.z = z;
	utility_data.sigma = sigma;
	utility_data.lamb = lamb;
	utility_data.corr_error = corr_error;
	utility_data.N_samples = N_samples;
	utility_data.N_sensors = N_sensors;
	utility_data.N_u = N_u;

	return; 
}



void fitfun_init_zetas()
{
	int N_samples = utility_data.N_samples;
	int N_sensors = utility_data.N_sensors;
	int N_u = utility_data.N_u;
	double **z = utility_data.z;

	double zeros[N_sensors];
	double eye[N_sensors*N_sensors];

	memset(zeros, 0, N_sensors*sizeof(double));
	memset(eye, 0, N_sensors*N_sensors*sizeof(double));
	for (int i = 0; i < N_sensors; i++)
		eye[i*N_sensors+i] = 1.0;


	for (int n = 0; n < N_u; n++)
	{

	for (int i = 0; i < N_samples; i++)
	{
		mvnrnd(zeros, eye, &z[n][i*N_sensors+0], N_sensors);
	}

	}
}


void fitfun_finalize()
{
	gsl_rand_finalize();
	free(utility_data.theta);	// = model_data.theta
	free(utility_data.sigma);
	for (int n = 0; n < utility_data.N_u; n++)
		free(utility_data.z[n]);
	free(utility_data.z);
}



double fitfun(double *d, int n, void *out, int *info)
{
#if VERBOSE
	double t0 = gettime();
#endif

	double uv = -extended_utility(d);//here there is minus sign

#if VERBOSE
	printf("-extended_utility(%f,%f) = %f\n", d[0], d[1], uv);
	double t1 = gettime();
	printf("time = %f s\n", t1-t0);
#endif
	return uv;
}


#if 0
int main(int argc, char *argv[])
{
	//parameter for CMA-ES
	//function handle for utility function
	//u = @(d) -simple_utility(g, d, theta, z, sigma, lamb, corr_error);

	fitfun_init();

	double matd[5][2] = {
            {0.2249,    4.0448},
            {1.8946,    3.1306},
            {-1.9453,    0.4684},
            {9.6329,    1.8367},
            {3.6443,    1.2297}};


	double t0 = gettime();
	for (int i = 0; i < 5; i++)
	{
		double uv = fitfun(matd[i], 2);
		printf("fitfun(%f,%f) = %f\n", matd[i][0], matd[i][1], uv);
	}
	double t1 = gettime();
	printf("time = %f s\n", t1-t0);

	fitfun_finalize();

	return 0;
}
#endif
