/**
*      _________   _____________________  ____  ______
*     / ____/   | / ___/_  __/ ____/ __ \/ __ \/ ____/
*    / /_  / /| | \__ \ / / / /   / / / / / / / __/
*   / __/ / ___ |___/ // / / /___/ /_/ / /_/ / /___
*  /_/   /_/  |_/____//_/  \____/\____/_____/_____/
*
*  http://www.acl.inf.ethz.ch/teaching/fastcode
*  How to Write Fast Numerical Code 263-2300 - ETH Zurich
*  Copyright (C) 2019 
*                   Tyler Smith        (smitht@inf.ethz.ch) 
*                   Alen Stojanov      (astojanov@inf.ethz.ch)
*                   Gagandeep Singh    (gsingh@inf.ethz.ch)
*                   Markus Pueschel    (pueschel@inf.ethz.ch)
*
*  This program is free software: you can redistribute it and/or modify
*  it under the terms of the GNU General Public License as published by
*  the Free Software Foundation, either version 3 of the License, or
*  (at your option) any later version.
*
*  This program is distributed in the hope that it will be useful,
*  but WITHOUT ANY WARRANTY; without even the implied warranty of
*  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
*  GNU General Public License for more details.
*
*  You should have received a copy of the GNU General Public License
*  along with this program. If not, see http://www.gnu.org/licenses/.
*/
//#include "stdafx.h"
#include <list>
#include <vector>
#include <string>
#include <iostream>
#include <random>

#include <stdio.h>
#include <stdlib.h>
#include <cstdlib>
#include <time.h>
#include <math.h>
#include <string.h>
#include "tsc_x86.h"

using namespace std;


#define MR 4
#define NR 8

#define CYCLES_REQUIRED 1e7
#define REP 100
#define EPS (1e-3)

/* prototype of the function you need to optimize */
typedef void(*comp_func)(double *, double *, double*, int);

//headers
double get_perf_score(comp_func f);
void register_functions();
double perf_test(comp_func f, string desc, int flops);
//void* aligned_alloc( std::size_t alignment, std::size_t size );
//You can delcare your functions here
void microkernel_c(double *w, double *x, double *y, int n);
void microkernel_avx(double *w, double *x, double *y, int n);

void add_function(comp_func f, string name, int flop);

/* Global vars, used to keep track of student functions */
vector<comp_func> userFuncs;
vector<string> funcNames;
vector<int> funcFlops;
int numFuncs = 0;


void rands(double * m, size_t row, size_t col)
{
    std::random_device rd;
    std::mt19937 gen{rd()};
    std::uniform_real_distribution<double> dist(-1.0, 1.0);
    for (size_t i = 0; i < row*col; ++i)  
        m[i] = dist(gen);
}

void build(double **a, int m, int n)
{
    *a = static_cast<double *>(std::malloc(m * n * sizeof(double))); //TODO: align this to 32
    rands(*a, m, n);
}

void destroy(double * m)
{
    free(m);
}

/*
* Called by the driver to register your functions
* Use add_function(func, description) to add your own functions
*/
void register_functions()
{
    add_function(&microkernel_c, "C Microkernel", 2*MR*NR);
    add_function(&microkernel_avx, "C microkernel_avx", 2*MR*NR);
    // Add your functions here. Don't modify the number of flops parameter.
    // add_function(&your_function, "function: Optimization X", flops per iteration);
}

void mvm(double *A, int rs_a, int cs_a, double *x, double *y, int m, int n) {
    for(int i = 0; i < m; i++) {
        y[i] = 0.0;
    }

    for(int i = 0; i < m; i++) {
        for(int j = 0; j < n; j++) {
            y[i] += A[i*rs_a + j*cs_a] * x[j];
        }
    }
}

double checksum(double *A, double *B, double *C, int n) {
    double *w;
    double *Cw;
    double *Bw;
    double *ABw;
    build(&w, NR, 1);
    build(&Cw, MR, 1);
    build(&Bw, n, 1);
    build(&ABw, MR, 1);

    mvm(C, NR, 1, w, Cw, MR, NR);
    mvm(B, NR, 1, w, Bw, n, NR);
    mvm(A, 1, MR, Bw, ABw, MR, n);

    double nrm_sqr = 0.0;
    for(int i = 0; i < MR; i++) {
        nrm_sqr += (Cw[i] - ABw[i]) * (Cw[i] - ABw[i]);
    }

    destroy(w);
    destroy(Cw);
    destroy(Bw);
    destroy(ABw);

    return nrm_sqr;
}

/*
* Main driver routine - calls register_funcs to get student functions, then
* tests all functions registered, and reports the best performance
*/
int main(int argc, char **argv)
{
    cout << "Starting program. ";
    double perf;
    int i;

    register_functions();

    if (numFuncs == 0)
    {
        cout << endl;
        cout << "No functions registered - nothing for driver to do" << endl;
        cout << "Register functions by calling register_func(f, name)" << endl;
        cout << "in register_funcs()" << endl;

        return 0;
    }
    cout << numFuncs << " functions registered." << endl;
   
    //Check validity of functions. 
    for (int n = 25; n<501;n=n+25){
        cout << endl << "Running n: " << n << endl;
        double *At, *B, *C;
        build(&At, MR, n);
        build(&B, n, NR);
        build(&C, MR, NR);
        destroy(At);
        destroy(B);
        destroy(C);
        for (i = 0; i < numFuncs; i++){
            perf = perf_test(userFuncs[i], funcNames[i], funcFlops[i]);
            cout << endl << "Running: " << funcNames[i] << endl;
            cout << perf << " flops per cycle" << endl;
        }

    }
    //double *At, *B, *C;
    //build(&At, MR, n);
    //build(&B, n, NR);
    //build(&C, MR, NR);

    //for (i = 0; i < numFuncs; i++)
    //{
    //    comp_func f = userFuncs[i];
     //   f(At, B, C, n);
     //   double error = checksum(At, B, C, n);
     //   if (error > EPS)
     //       cout << "ERROR: the results for function " << i << " are incorrect." << std::endl;
    //}

    //destroy(At);
    //destroy(B);
    //destroy(C);

    //for (i = 0; i < numFuncs; i++)
    //{
     //   perf = perf_test(userFuncs[i], funcNames[i], funcFlops[i]);
      //  cout << endl << "Running: " << funcNames[i] << endl;
       // cout << perf << " flops per cycle" << endl;
    //}


    return 0;
}


/*
* Registers a user function to be tested by the driver program. Registers a
* string description of the function as well
*/
void add_function(comp_func f, string name, int flops)
{
    userFuncs.push_back(f);
    funcNames.emplace_back(name);
    funcFlops.push_back(flops);

    numFuncs++;
}




/*
* Checks the given function for validity. If valid, then computes and
* reports and returns the number of cycles required per iteration
*/
double perf_test(comp_func f, string desc, int flops)
{
    double cycles = 0.;
    long num_runs = 100;
    double multiplier = 1;
    myInt64 start, end;

    double *At, *B, *C;
    int n = 256;

    build(&At, MR, n);
    build(&B, n, NR);
    build(&C, MR, NR);

    // Warm-up phase: we determine a number of executions that allows
    // the code to be executed for at least CYCLES_REQUIRED cycles.
    // This helps excluding timing overhead when measuring small runtimes.
    do {
        num_runs = num_runs * multiplier;
        start = start_tsc();
        for (size_t i = 0; i < num_runs; i++) {
            f(At,B,C,n);           
        }
        end = stop_tsc(start);

        cycles = (double)end;
        multiplier = (CYCLES_REQUIRED) / (cycles);
        
    } while (multiplier > 2);

    list<double> cyclesList;

    // Actual performance measurements repeated REP times.
    // We simply store all results and compute medians during post-processing.
    for (size_t j = 0; j < REP; j++) {

        start = start_tsc();
        for (size_t i = 0; i < num_runs; ++i) {
            f(At,B,C,n);           
        }
        end = stop_tsc(start);

        cycles = ((double)end) / num_runs;

        cyclesList.push_back(cycles);
    }

    destroy(At);
    destroy(B);
    destroy(C);
    cyclesList.sort();
    cycles = cyclesList.front();    
    return  (1.0 * flops * n) / cycles;
}


