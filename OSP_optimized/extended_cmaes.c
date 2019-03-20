/*
 *  extended_cmaes.c
 *
 *  Created by Panagiotis Hadjidoukas (CSE Lab, D-MAVT, ETH Zurich).
 *  Copyright 2017 ETH Zurich. All rights reserved.
 *
 */
#define _XOPEN_SOURCE 500
#define _BSD_SOURCE
#include <omp.h>
#include <stdio.h>
#include <stdlib.h> /* free() */
#include "cmaes_interface.h"
#if defined(_USE_TORC_)
#include <torc.h>
#else
#include <sys/time.h>
double torc_gettime()
{
        struct timeval t;
        gettimeofday(&t, NULL);
        return (double)t.tv_sec + (double)t.tv_usec*1.0E-6;
}

#define torc_register_task(x)
#define torc_init(a,b,c)
#define torc_finalize()
#define torc_enable_stealing()
#define torc_disable_stealing()
#define torc_waitall()
#endif
#include <unistd.h>
#include <math.h>
#define CMAES_VERBOSE 1
#define _STEALING_
/*#define _RESTART*/
#define IODUMP 0
#include "utility/fitfun_extended.c" 

/* the objective (fitness) function to be minimized */
void taskfun(double *x, int *pn, double *res, int *info)
{
	int n = *pn;
	int gen, chain, step, task;
	gen = info[0]; chain = info[1]; step = info[2]; task = info[3];
	double t0 = torc_gettime();
	double f = +fitfun(x, n, (void *)NULL, info);	/* CMA-ES needs this minus sign */
	double t1 = torc_gettime();
#if CMAES_VERBOSE
	printf("task (%d,%d,%d,%d): %f %f = %f in %.3f secs\n", gen, chain, step, task, x[0], x[1], f, t1-t0);
#endif
	*res = f;
	return;
}



double lower_bound[] = {-5, 0};
double upper_bound[] = {10, 5};


int is_feasible0(double *pop, int dim)
{
	int i, good;
	for (i = 0; i < dim; i++) {
		good = (lower_bound[i] <= pop[i]) && (pop[i] <= upper_bound[i]);
		if (!good) {
			return 0;
		}
	}

	return 1;
}

/* the optimization loop */
int main(int argn, char **args)
{
	int i; 
	/* peh - start */
	double gt0, gt1, gt2, gt3,gt4,gt5;
	/* peh - end */

	torc_register_task(taskfun);

	/* Initialize everything into the struct evo, 0 means default */
	torc_init(argn, args, MODE_MS);



	gt4 = torc_gettime();
	fitfun_init();
        gsl_rand_init(1);
    gt5 = torc_gettime();

	const int N_cmaes = 1;	//%number of CMA-ES runs with different samples

	double bestever_x[N_cmaes][2];
	double bestever_f[N_cmaes];


	for (int c = 0; c < N_cmaes; c++)
	{

	gt0 = torc_gettime();
	fitfun_init_zetas();

	int N = 2;//2 dimension
	double startp[2];
	double xll[2];
	double xrl[2];
	int lambda = 32;
	double inrgstddev[2];
	int maxfuncalls =3200;
	int fevals;
	double optp[2], optv;
	int iter;

	for (int i = 0; i < N; i++) xll[i] = lower_bound[i];
	for (int i = 0; i < N; i++) xrl[i] = upper_bound[i];

	for (int i = 0; i < N; i++) {
		startp[i] = xll[i] + 0.5*(xrl[i]-xll[i]); //start parameter
		inrgstddev[i] = 0.25*(xrl[i]-xll[i]); 
	}

	long iseed = time(0);
	gt1 = torc_gettime();

	int ret = cma_optimize(N, startp, xll, xrl, lambda, inrgstddev, iseed, maxfuncalls, optp, &fevals, &optv, &iter);
	printf("termination reason =%d\n",ret);
	gt2 = torc_gettime();


	gt3 = torc_gettime();

	printf("Total elapsed time = %.3lf  seconds\n", gt3-gt0);
	printf("Initialization time = %.3lf  seconds\n", gt5-gt4);
	printf("Processing time = %.3lf  seconds\n", gt2-gt1);
	printf("Finalization time = %.3lf  seconds\n", gt3-gt2);

	bestever_x[c][0] = optp[0];
	bestever_x[c][1] = optp[1];
	bestever_f[c] = optv;

	}// end for (int c = 0; c < N_cmaes; c++)



	int i_best = 0;
	double f_best = bestever_f[0];
	for (int c = 0; c < N_cmaes; c++)
	{
		if (bestever_f[c] < f_best) 
		{
			f_best = bestever_f[c];
			i_best = c;
		}
		printf("CMAES %d:  %f %f -> %f\n", c, bestever_x[c][0], bestever_x[c][1], bestever_f[c]);
	}
    

///////////////////////////////%% plotting//////////////////
	{
	double optp[2];
	optp[0] = bestever_x[i_best][0];
	optp[1] = bestever_x[i_best][1];

	double x[N_sensors];
	//%translate min into normal sensor coordinates
	x[0] = optp[0];	//minVal(1);
	for (int i = 1; i < N_sensors; i++)
		x[i] = optp[0] + i*optp[1]; 

	//%all sensors are placed on the x-axis
	double y[N_sensors];
	memset(y, 0, N_sensors*sizeof(double));
	//%plot sampling area, sensors at optimal locations and samples

	//rectangle('Position',[x0_l y0_l,x0_u-x0_l, y0_u-y0_l]);
	//hold on;
	//scatter(x,y);
	FILE *fp;
	fp = fopen("extendedVortex500Samples_sensors.txt", "w");
	for (i = 0; i < N_sensors; i++)
	{
		fprintf(fp, "%f %f\n", x[i], y[i]);
	}
	fclose(fp);

	//scatter(theta(:,1),theta(:,2));
	//legend('sensors', 'samples');
	//savefig('simpleVortex500Samples')
	double *theta = utility_data.theta;
	fp = fopen("extendedVortex500Samples_theta.txt", "w");
	for (i = 0; i < N_samples; i++)
	{
		fprintf(fp, "%f %f\n", theta[i*2+0], theta[i*2+1]);
	}
	fclose(fp);

	}
  /////////////////////End plotting//////////////////


	torc_finalize();

	fitfun_finalize();


	return 0;
}

//######################################END MAIN #########################

static int is_feasible(double *x, double *xll, double *xrl, int n){
	int i, good;
	for (i=0; i<n; i++){
		good = (xll[i] <= x[i]) && (x[i] <= xrl[i]);
		if (!good) {
			return 0;
		}
	}
	return 1;
}

#define TERM_CONVERGE	0
#define TERM_MAXFEVALS	1
#define TERM_MAXITERS	2
#define TERM_OTHER	-1

int  cma_optimize(int N, double startp[], double *xll, double *xrl, int lambda, double *inrgstddev, long iseed, int maxfuncalls, double optp[], int *fevals, double *optv, int *iter) {
	cmaes_t evo; /* an CMA-ES type struct or "object" */
	double *arFunvals, *const*pop, *xfinal;  //inner variables
	int i, term = TERM_OTHER;//it's -1
	int dim, step;

	*fevals = 0;
    int fsum=*fevals;
	/* Initialize everything into the struct evo, 0 means default */

	arFunvals = cmaes_init(&evo, N, startp, inrgstddev, iseed, lambda, "none");
	evo.sp.stopMaxFunEvals = maxfuncalls; //set termination limit
	dim = cmaes_Get(&evo, "dim");
	lambda = cmaes_Get(&evo, "lambda");

	/* Iterate until stop criterion holds */
	step = 0;


	while(!cmaes_TestForTermination(&evo))
	{
		/* generate lambda new search points, sample population */
                pop = cmaes_SamplePopulation(&evo); /* do not change content of pop */

		/*	Here you may resample each solution point pop[i] until it
			becomes feasible, e.g. for box constraints (variable
			boundaries). function is_feasible(...) needs to be
			user-defined.
			Assumptions: the feasible domain is convex, the optimum is
			not on (or very close to) the domain boundary, initialX is
			feasible and initialStandardDeviations are sufficiently small
			to prevent quasi-infinite looping.
		*/

		for (i = 0; i < cmaes_Get(&evo, "popsize"); ++i)
		{
			while (!is_feasible(pop[i], xll, xrl, dim)){
				cmaes_ReSampleSingle(&evo, i);
			}
		}


       
#pragma omp parallel for reduction(+:fsum)
		/* evaluate the new search points using fitfun from above */
		for (i = 0; i < lambda; ++i) {
			//arFunvals[i] = fitfun(pop[i], (int) dim);
			int info[4];
			info[0] = info[1] = 0; info[2] = step; info[3] = i;
			taskfun(pop[i], &N, &arFunvals[i], info);
		//#pragma omp atomic
			fsum++;  //can return fevals
		}
        

        *fevals=fsum;
		/* update the search distribution used for cmaes_SampleDistribution() */
		cmaes_UpdateDistribution(&evo, arFunvals);


#if CMAES_VERBOSE
                {
                const double *xbever = cmaes_GetPtr(&evo, "xbestever");
                double fbever = cmaes_Get(&evo, "fbestever");

                printf("BEST @ %5d: ", step);
                for (i = 0; i < dim; i++)
                        printf("%25.16lf ", xbever[i]);
                printf("%25.16lf\n", fbever);
                }
#endif

		step++;
	}





	if (strstr(cmaes_TestForTermination(&evo), "MaxIter") != NULL) {
		term = TERM_MAXITERS;
	} else if (strstr(cmaes_TestForTermination(&evo), "MaxFunEvals") != NULL) {
		term = TERM_MAXFEVALS;
	} else if (strstr(cmaes_TestForTermination(&evo), "TolFun") != NULL) {
                term = TERM_CONVERGE;
        } else if (strstr(cmaes_TestForTermination(&evo), "TolX") != NULL) {
		term = TERM_CONVERGE;
	}

	/* get best estimator for the optimum, xmean */
	xfinal = cmaes_GetNew(&evo, "xbestever"); /* "xbestever" might be used as well */

	*optv = cmaes_Get(&evo, "fbestever");

	*iter = (int)cmaes_Get(&evo, "iteration"); //return iter

	for(i=0; i<dim; i++){
		optp[i] = xfinal[i];
	}

	cmaes_exit(&evo); /* release memory */

	/* do something with final solution and finally release memory */

	free(xfinal);
	return term;
}
