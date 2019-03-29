/*
 *  model.c
 *
 *
 */


#include <math.h>
#include <cuda.h>

struct model_data_
{
	double mygamma;
        double *theta;
        int N_samples;
        int N_sensors;
} model_data;


extern "C"
__global__ void GPU_model(double *g, double *d,double *theta,double mygamma,int N_samples,int N_sensors)
{

	 int ix= blockDim.x*blockIdx.x+threadIdx.x;
	 int iy= blockDim.y*blockIdx.y+threadIdx.y;

	 if(ix<N_samples && iy<N_sensors)
	 {
      g[ix*N_sensors+iy] = 0.0;

      g[ix*N_sensors+iy] = mygamma*theta[ix*2+1]/(2*M_PI*(pow((d[0]+iy*d[1])-theta[ix*2+0],2.0) + pow(theta[ix*2+1],2)));

	 }
}


extern "C"
void model(double *g, double *d) 
{
	double mygamma = model_data.mygamma;
	double *theta = model_data.theta;
	int N_samples = model_data.N_samples;
	int N_sensors = model_data.N_sensors;
	//////////////////////////////////
	// model.m
	// This function provides the model function (= velocity measurements) for the 
	// vortex optimal sensor placement problem.
	// Input:
	// mygamma     : vortex strength
	// theta     : samples of model parameters
	// d         : vector of design parameters, d = [x_s, h]
	// N_sensors : number of sensors to be placed
	//
	// Author: Franziska Krummenacher, krummenf@student.ethz.ch
	// Spring/Summer 2016
	//////////////////////////////////

	//extract number of samples
	//N_samples = size(theta,1);

	//initialize output matrix
	//g = zeros(N_samples,N_sensors);

////allocate GPU  memory 

	double *d_g;
	double *d_d;
	double *d_theta;

	cudaMalloc(&d_g,N_samples*N_sensors*sizeof(double));
	cudaMalloc(&d_d,2*sizeof(double));
	cudaMalloc(&d_theta,2*N_samples*sizeof(double));
	//GPU memory copy
	cudaMemcpy(d_g,g,N_samples*N_sensors*sizeof(double),cudaMemcpyHostToDevice);
	cudaMemcpy(d_d,d,2*sizeof(double),cudaMemcpyHostToDevice);
	cudaMemcpy(d_theta,theta,2*N_samples*sizeof(double),cudaMemcpyHostToDevice);
	//kernel call 
    
    dim3 blocks(40,1);
    dim3 threads(100,5);
	GPU_model<<<blocks,threads>>>(d_g,d_d,d_theta,mygamma,N_samples,N_sensors);

    cudaMemcpy(g,d_g,N_samples*N_sensors*sizeof(double),cudaMemcpyDeviceToHost);

    cudaFree(d_g);
    cudaFree(d_d);
    cudaFree(d_theta);

	//for (int i = 0; i < N_samples; i++)
	//	for (int j = 0; j < N_sensors; j++)
	//		g[i*N_sensors+j] = 0.0;

	//fill in model predictions
	//for (int i = 0; i < N_samples; i++)
	//	for (int k = 0; k < N_sensors; k++)
	//	{
	//		g[i*N_sensors+k] = mygamma*theta[i*2+1]/(2*M_PI*(pow((d[0]+k*d[1])-theta[i*2+0],2.0) + pow(theta[i*2+1],2)));
	//	}

	return;
}
