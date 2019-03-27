/*
 *  extended_utility.c
 *
 *
 */
#include <cuda.h>
#include <string.h>

//void model(double *g, double *d);
extern void model(double *g, double *d);





double extended_utility(double *d)

{
	
	double Uo;	// output

	double *theta = utility_data.theta;
	double **z = utility_data.z;
	double *sigma = utility_data.sigma;
	double lamb = utility_data.lamb;
	int corr_error = utility_data.corr_error;
	int N_samples = utility_data.N_samples;
	int N_sensors = utility_data.N_sensors;
	int N_u = utility_data.N_u;
	//////////////////////////////////
	//////////////////////////////////

	//extract number of samples and sensors
	//N_samples = size(theta,1);
	//N_sensors = size(sigma,1);


	//// evaluate model for given design parameters
	double g_eval[N_samples*N_sensors];

	//g_eval = g(d);
	model(g_eval, d);

	//// build correlation matrix, second part (non-diagonal entries)
	// if correlated prediction error: fill other entries of sigma
	if(corr_error)
	{
		for (int i = 0; i < N_sensors; i++)
		{
			for (int j = 0; j < N_sensors; j++)
			{
				if(i != j && d[1] > 1e-8)
				{
					//%if different sensors at different places
					sigma[i*N_sensors+j] = sigma[0*N_sensors+0]*exp(-fabs((i-j)*d[1])/lamb);
				}
				else if (i != j)
				{
					//%if sensors are too close:
					//%avoid singular matrices: use small value for d(2)
					sigma[i*N_sensors+j] = sigma[0*N_sensors+0]*exp(-fabs((i-j)*1e-8)/lamb);
				}
			}
		}
	}


	//cholesky decomposition of sigma
	//A = chol(sigma);
	double A[N_sensors*N_sensors];
	
	gsl_matrix *work = gsl_matrix_alloc(N_sensors,N_sensors);
	memcpy(work->data,sigma,N_sensors*N_sensors*sizeof(double));
	gsl_linalg_cholesky_decomp(work);
	memcpy(A, work->data,N_sensors*N_sensors*sizeof(double));
	gsl_matrix_free(work);

	//build error from covariance matrix and normally distributed error
	//e = z*A;


	double e[N_u][N_samples*N_sensors];

///here not computing intensively////////////////////////

	for (int n=0; n<N_u; n++)
	{

	for (int i=0; i<N_samples; i++)
	{
		for (int j=0; j<N_sensors; j++)
		{
			e[n][i*N_sensors+j] = 0.0;
			for (int k=0; k<=j; k++)	// peh: note this
			{
				e[n][i*N_sensors+j] += z[n][i*N_sensors+k]*A[k*N_sensors+j];
			}
		}
	}

	}

////////////////////////////////////////////////////





	//// approximate utility function
	double U[N_u];
	for (int i = 0; i < N_u; i++) U[i] = 0.0;


//////////////offloading to  GPU :



	for (int n = 0; n < N_u; n++)
	{

	//construct data from evaluated model and error
	double y[N_samples*N_sensors];

	//y = g_eval + e;
	for (int i = 0; i < N_samples; i++)
		for (int j = 0; j < N_sensors; j++)
			y[i*N_sensors+j] = g_eval[i*N_sensors+j] + e[n][i*N_sensors+j];


	//compute likelihood
	//double likelihood = mvnpdf(y,g_eval,sigma); // built in - multivariate pdf
	double likelihood[N_samples];


	for (int i = 0; i < N_samples; i++)
	{
		double yi[N_sensors];
		double g_evali[N_sensors];

		for (int j = 0; j < N_sensors; j++)
		{
			yi[j] = y[i*N_sensors+j];
			g_evali[j] = g_eval[i*N_sensors+j];
		}


		likelihood[i] = mvnpdf(N_sensors, yi, g_evali, sigma); 
	}




	for (int i = 0; i < N_samples; i++)	//iterate through samples of \theta
	{
		//compute evidence
		//double evid_array = mvnpdf(y_i,g_eval, sigma);	// for each 
		double evid_array[N_samples];

		mvnpdf_v(N_samples, evid_array, N_sensors, &y[i*N_sensors+0], &g_eval[0*N_sensors], sigma); 

		//inner loop: take mean of all terms in the evidence
		//double evid = sum(evid_array);
		//evid = evid/N_samples;
		double evid = 0;

		for (int k = 0; k < N_samples; k++)
		{
			evid += evid_array[k];
		}
		evid /= N_samples;
    
		//outer loop: add logarithms
		U[n] = U[n] + log(likelihood[i])-log(evid);
	}




	}	// for n



////////end offloading to  GPU:






	Uo = 0.0;
	for (int n = 0; n < N_u; n++) Uo += U[n];
	Uo /= N_u;

	return Uo;
}
