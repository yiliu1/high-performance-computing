#include <stdio.h>
#include <stdlib.h>
#include <math.h>
#include <immintrin.h>
#define MR 4
#define NR 8
//The slow base version
void microkernel_c(double* At, double *B, double *C, int n) {
    //First initialize C to zero
    for(int i = 0; i < MR; i++) {
        for(int j = 0; j < NR; j++) {
            C[NR*i + j] = 0.0;
        }
    }
    for(int p = 0; p < n; p++) { // p is the index of iterations
        for(int i = 0; i < MR; i++) {
            for(int j = 0; j < NR; j++) {
                C[NR*i + j] += At[MR*p + i] * B[NR*p + j];//here At should be A somehow
            }
        }
    }
}
void microkernel_avx(double* At, double *B, double *C, int n){
    for(int i = 0; i < MR; i++){
        for(int j = 0; j < NR; j++){
            C[NR*i + j] = 0.0;//4x8 matrix
        }
    }
    //now worked and need to make it accurate!
    //use shuffle and permute
    //load data
    __m256 t0= _mm256_loadu_pd(C+4*0);
    __m256 t1= _mm256_loadu_pd(C+4*1);
    __m256 t2= _mm256_loadu_pd(C+4*2);
    __m256 t3= _mm256_loadu_pd(C+4*3);
    __m256 t4= _mm256_loadu_pd(C+4*4);
    __m256 t5= _mm256_loadu_pd(C+4*5);
    __m256 t6= _mm256_loadu_pd(C+4*6);
    __m256 t7= _mm256_loadu_pd(C+4*7);
    //loading
    for(int p = 0; p < n; p++){
        
        __m256 a0= _mm256_loadu_pd(At+p*MR);
        //A0,A1,A2,A3
        __m256 b0= _mm256_loadu_pd(B+p*NR);
        //B0,B1,B2,B3
        __m256 b1= _mm256_loadu_pd(B+p*NR+4);
        //permute on b0
        __m256 h0= _mm256_permute4x64_pd(a0,_MM_SHUFFLE(0,0,0,0));
        __m256 h1= _mm256_permute4x64_pd(a0,_MM_SHUFFLE(1,1,1,1));
        __m256 h2= _mm256_permute4x64_pd(a0,_MM_SHUFFLE(2,2,2,2));
        __m256 h3= _mm256_permute4x64_pd(a0,_MM_SHUFFLE(3,3,3,3));
        
        //__m256 b5= _mm256_permute4x64_pd(b1,_MM_SHUFFLE(1,0,3,2));
        //FMA
        t0=_mm256_fmadd_pd(h0,b0,t0);//c(0,0),c(0,1),c(0,2),c(0,3)
        t1=_mm256_fmadd_pd(h0,b1,t1);//c(0,4),c(0,5),c(0,6),c(0,7)
        t2=_mm256_fmadd_pd(h1,b0,t2);
        t3=_mm256_fmadd_pd(h1,b1,t3);
        t4=_mm256_fmadd_pd(h2,b0,t4);
        t5=_mm256_fmadd_pd(h2,b1,t5);
        t6=_mm256_fmadd_pd(h3,b0,t6);
        t7=_mm256_fmadd_pd(h3,b1,t7);//c(3,4),c(3,5),c(3,6),c(3,7)
    }
    //arange the matrix C
    _mm256_storeu_pd(C+4*0,t0);// 
    _mm256_storeu_pd(C+4*1,t1);
    _mm256_storeu_pd(C+4*2,t2);
    _mm256_storeu_pd(C+4*3,t3);
    _mm256_storeu_pd(C+4*4,t4);
    _mm256_storeu_pd(C+4*5,t5);
    _mm256_storeu_pd(C+4*6,t6);
    _mm256_storeu_pd(C+4*7,t7);
        /* Another way doing this permutation
        //B4,B5,B6,B7
        //Permute b0,b1
        __m256 b2= _mm256_permute2f128_pd(b0,b1,_MM_SHUFFLE(1,0,2,0));
        //B2,B3,B4,B5
        __m256 b3= _mm256_permute2f128_pd(b1,b0,_MM_SHUFFLE(1,0,2,0));
        //B6,B7,B0,B1
        //shuffle b0,b1
        __m256 b4= _mm256_shuffle_pd(b0,b1,_MM_SHUFFLE(1,1,0,0));
        //B1,B4,B3,B6
        __m256 b5= _mm256_shuffle_pd(b1,b0,_MM_SHUFFLE(1,1,0,0));
        //B5,B0,B7,B2
        //shuffle b2,b3
        __m256 b6= _mm256_shuffle_pd(b2,b3,_MM_SHUFFLE(1,1,0,0));
        //B3,B6,B5,B0
        __m256 b7= _mm256_shuffle_pd(b3,b2,_MM_SHUFFLE(1,1,0,0));
        //B7,B2,B1,B4
        //shuffle and permute b0 and b1
        t0=_mm256_fmadd_pd(a0,b0,t0);//c(0,0),c(1,1),c(2,2),c(3,3)
        t1=_mm256_fmadd_pd(a0,b1,t1);//c(0,4),c(1,5),c(2,6),c(3,7)
        t2=_mm256_fmadd_pd(a0,b2,t2);//c(0,2),c(1,3),c(2,4),c(3,5)
        t3=_mm256_fmadd_pd(a0,b3,t3);//c(0,6),c(1,7),c(2,0),c(3,1)
        t4=_mm256_fmadd_pd(a0,b4,t4);//c(0,1),c(1,4),c(2,3),c(3,6)
        t5=_mm256_fmadd_pd(a0,b5,t5);//c(0,5),c(1,0),c(2,7),c(3,2)
        t6=_mm256_fmadd_pd(a0,b6,t6);//c(0,3),c(1,6),c(2,5),c(3,0)
        t7=_mm256_fmadd_pd(a0,b7,t7);//c(0,7),c(1,2),c(2,1),c(3,4)
        //__m256 t0= _mm256_mul_pd(a0,b0);
        */
}
