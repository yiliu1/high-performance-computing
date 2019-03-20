all: extended_cmaes

extended_cmaes: extended_cmaes.c cmaes.c utility/fitfun_extended.c utility/extended_utility.c utility/model.c utility/auxil.c utility/model.cu
	nvcc -O3 -Xcompiler  -fopenmp -o extended_cmaes extended_cmaes.c cmaes.c utility/model.cu -lgsl -lgslcblas -lm -lcuda -lgomp


plot:
	gnuplot < plot500ex.gp

clean:
	rm -f extended_cmaes
