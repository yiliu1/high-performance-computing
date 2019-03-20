


__global__ void GPU_U(int N_samples,int N_sensors,double *g_eval,double *e,double *U)
{    
	 double y_m[N_u*N_samples*N_sensors];
	 double g_m[N_u*N_samples*N_sensors];
	 double likelihood[N_u*N_samples];
     double evid_array[N_u*N_samples];
     double evid[N_u];

	 int ix= blockDim.x*blockIdx.x+threadIdx.x;//ix samples
	 int iy= blockDim.y*blockIdx.y+threadIdx.y;//iy sensors
     int iz= blockDim.z*blockIdx.z+threadIdx.z;//iz n_u

     if(iz<N_u && ix<N_samples && iy<N_sensors)
     {
      //y_m[iz*N_sensors*N_samples+ix*N_sensors+iy]=y[ix*N_sensors+iy];
     g_m[iz*N_sensors*N_samples+ix*N_sensors+iy]=g_eval[ix*N_sensors+iy];
     y_m[iz*N_sensors*N_samples+ix*N_sensors+iy]
     =g_m[iz*N_sensors*N_samples+ix*N_sensors+iy]+e[iz*N_sensors*N_samples+ix*N_sensors+iy];

     likelihood[iz*N_samples+ix]
     =mvnpdf(N_sensors,&y_m[iz*N_sensors*N_samples+ix*N_sensors],&g_m[iz*N_sensors*N_samples+ix*N_sensors],sigma);
    
     mvnpdf_v(N_samples,&evid_array[iz*N_samples],N_sensors,&y_m[iz*N_sensors*N_samples+ix*N_sensors],&g_m[iz*N_sensors*N_samples+0],sigma);

     for (int k = 0; k < N_samples; k++)
	 {
			evid[iz] += evid_array[iz*N_samples+k];
	 }
	 evid[iz]/= N_samples;


	 for (int k = 0; k < N_samples; k++)
	 {
	 	U[iz] +=log(likelihood[iz*N_samples+k])-log(evid[iz])
	 }

     }

}//end global void 
///////copy data from CPU  to  GPU :
    double *d_geval;
    double *d_U;
    double *d_e; ///GPU  pointer
    cudaMalloc(&d_geval,N_samples*N_sensors*sizeof(double));
	cudaMalloc(&d_U,N_u*sizeof(double));
	cudaMalloc(&d_e,N_u*N_samples*N_sensors*sizeof(double));

	cudaMemcpy(d_geval,g_eval,N_samples*N_sensors*sizeof(double),cudaMemcpyHostToDevice);
	cudaMemcpy(d_U,U,N_u*sizeof(double),cudaMemcpyHostToDevice);
	cudaMemcpy(d_e,e,N_u*N_samples*N_sensors*sizeof(double),cudaMemcpyHostToDevice);
    
    dim3 blocks(5,20,1);
    dim3 threads(2,100,5);
	GPU_U<<<blocks,threads>>>(N_samples,N_sensors,d_geval,d_e,d_U);
    
    cudaMemcpy(U,d_U,N_u*sizeof(double),cudaMemcpyDeviceToHost);

    cudaFree(d_geval);
    cudaFree(d_e);
    cudaFree(d_U);







