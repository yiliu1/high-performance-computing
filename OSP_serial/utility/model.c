/*
 *  model.c
 *
 *  Created by Panagiotis Hadjidoukas (CSE Lab, D-MAVT, ETH Zurich). 
 *  Copyright 2017 ETH Zurich. All rights reserved.
 *
 */

#include <math.h>

//void model(double *g, double mygamma, double *theta, double *d, int N_samples, int N_sensors)
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
	for (int i = 0; i < N_samples; i++)
		for (int j = 0; j < N_sensors; j++)
			g[i*N_sensors+j] = 0.0;

	//fill in model predictions
	for (int i = 0; i < N_samples; i++)
		for (int k = 0; k < N_sensors; k++)
		{
			g[i*N_sensors+k] = mygamma*theta[i*2+1]/(2*M_PI*(pow((d[0]+k*d[1])-theta[i*2+0],2.0) + pow(theta[i*2+1],2)));

		}

	return;
}
