all: extended_cmaes

extended_cmaes: extended_cmaes.c cmaes.c utility/fitfun_extended.c utility/extended_utility.c utility/model.c utility/auxil.c 
	gcc -O3 -std=c99 -o extended_cmaes extended_cmaes.c cmaes.c -lgsl -lgslcblas -lm


plot:
	gnuplot < plot500ex.gp

clean:
	rm -f extended_cmaes
