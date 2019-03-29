#include <stdio.h>
#include <stdlib.h>
#include <math.h>
#include <immintrin.h>
//The slow base version.
//Use AVX2 to optimize.
void complex_conversion_c(const double *complex_a, double *complex_b, int n){
    for(int i = 0; i < n; i++){
        double x = complex_a[2*i];
        double y = complex_a[2*i+1];
        double p = x/y;
        double q = copysign(x*x+y*y,x);
        complex_b[2*i] = p;
        complex_b[2*i+1]= q;
    }
}
//Use AVX intrinsics
void complex_conversion_avx(const double *complex_a, double *complex_b, int n){
	for (int i=0; i<n/8; i++){
		__m256 x0=_mm256_loadu_pd(complex_a+4*i);// load data
		__m256 y0=_mm256_loadu_pd(complex_a+4*i+4);
        //permute the order of data
        __m256 x1=_mm256_permute4x64_pd(x0,_MM_SHUFFLE(0,2,1,3));
        __m256 y1=_mm256_permute4x64_pd(y0,_MM_SHUFFLE(0,2,1,3));
		//use permute and shuffle
		__m256 x2=_mm256_permute2f128_pd(x1,y1,_MM_SHUFFLE(0,0,2,0));
		__m256 y2=_mm256_permute2f128_pd(x1,y1,_MM_SHUFFLE(1,0,3,0));
		// begin ops x2=a0,a1,a2,a3  y2=b0,b1,b2,b3
		__m256 p=_mm256_div_pd(x2,y2);//p=a/b
        // begin squares
        //begin sum of squares
		__m256 x3=_mm256_mul_pd(x2,x2);
		__m256 y3=_mm256_mul_pd(y2,y2);
		__m256 sum_square=_mm256_add_pd(x3,y3);
		//now sgn(a)
        __m256 zeros=_mm256_setzero_pd();// set all zeros 
		__m256 a_largerthan_0=_mm256_cmp_pd(x2,zeros, _MM_SHUFFLE(0,0,3,2));//14
		__m256 a_lessthan_0=_mm256_cmp_pd(x2,zeros,_MM_SHUFFLE(0,0,0,1));//1
		__m256 sgn=_mm256_sub_pd(a_largerthan_0,a_lessthan_0);
		//finish sgn and sum of squares
		__m256 q=_mm256_mul_pd(sgn,sum_square);
		//now push back, need shuffle later
		__m256 d0=_mm256_permute2f128_pd(p,q,_MM_SHUFFLE(0,0,2,0));
        __m256 d1=_mm256_permute2f128_pd(p,q,_MM_SHUFFLE(1,0,3,0));
        __m256 t0=_mm256_permute4x64_pd(d0,_MM_SHUFFLE(0,2,1,3));
        __m256 t1=_mm256_permute4x64_pd(d1,_MM_SHUFFLE(0,2,1,3));
        // store data
		_mm256_storeu_pd(complex_b+i*4,t0);
		_mm256_storeu_pd(complex_b+i*4+4,t1);
	}
}
