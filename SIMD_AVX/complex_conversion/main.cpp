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
#include <time.h>
#include <math.h>
#include <string.h>
#include "tsc_x86.h"

using namespace std;

#define CYCLES_REQUIRED 1e7
#define REP 100
#define EPS (1e-3)

/* prototype of the function you need to optimize */
typedef void(*comp_func)(const double *, double*, int);

//headers
double get_perf_score(comp_func f);
void register_functions();
double perf_test(comp_func f, string desc, int flops);

//You can delcare your functions here
void complex_conversion_c(const double *complex_a, double *complex_b, int n);
void complex_conversion_avx(const double *complex_a, double *complex_b, int n);
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
    *a = static_cast<double *>(malloc(m * n * sizeof(double))); //TODO: align this to 32
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
    add_function(&complex_conversion_c, "C Version", 5);
    add_function(&complex_conversion_avx, "AVX Version", 5);
    // Add your functions here. Don't modify the number of flops parameter.
    // add_function(&your_function, "function: Optimization X", flops per iteration);
}

double checksum(const double *complex_a, const double *complex_b, int n) {
    double norm = 0.0;
    for(int i = 0; i < n; i++) {
        double p = complex_b[2*i];
        double q = complex_b[2*i+1];
        
        double x = complex_a[2*i];
        double y = complex_a[2*i+1];
        
        double b = sqrt(std::abs(q/(p*p + 1.0)));
        double a = copysign(p*b, q);
        b = copysign(b, p*a);

        norm += (a - x) * (a - x);
        norm += (b - y) * (b - y);
    }
    return norm;
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
    int n = 2048;
    double *complex_a, * complex_b;
    build(&complex_a, 2*n, 1);
    build(&complex_b, 2*n, 1);

    for (i = 0; i < numFuncs; i++)
    {
        rands(complex_b, 2*n, 1);
        comp_func f = userFuncs[i];
        f(complex_a, complex_b, n);
        double error = checksum(complex_a, complex_b, n);
        if (error > EPS)
            cout << "ERROR: the results for function " << i << " are incorrect." << std::endl;
    }

    destroy(complex_a);
    destroy(complex_b);

    for (i = 0; i < numFuncs; i++)
    {
        perf = perf_test(userFuncs[i], funcNames[i], funcFlops[i]);
        cout << endl << "Running: " << funcNames[i] << endl;
        cout << perf << " flops per cycle" << endl;
    }

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

    int n = 2048;
    double *complex_a, *complex_b;
    build(&complex_a, 2*n, 1);
    build(&complex_b, 2*n, 1);


    // Warm-up phase: we determine a number of executions that allows
    // the code to be executed for at least CYCLES_REQUIRED cycles.
    // This helps excluding timing overhead when measuring small runtimes.
    do {
        num_runs = num_runs * multiplier;
        start = start_tsc();
        for (size_t i = 0; i < num_runs; i++) {
            f(complex_a, complex_b, n);
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
            f(complex_a, complex_b, n);
        }
        end = stop_tsc(start);

        cycles = ((double)end) / num_runs;

        cyclesList.push_back(cycles);
    }

    destroy(complex_a);
    destroy(complex_b);
    cyclesList.sort();
    cycles = cyclesList.front();    
    return  (1.0 * flops * n) / cycles;
}


