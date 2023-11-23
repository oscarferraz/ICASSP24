/* NORMAL.H
=====================================================================================
   Generate a normal random variable with mean 0 and standard deviation
   of 1.  To adjust to some other distribution, multiply by the standard
   deviation and add the mean.  Box-Muller method

  
	NOTE: rand() is a function that returns a uniformly distributed random
	number from 0 to RAND_MAX

	SOURCE:http://remus.rutgers.edu/~rhoads/Code/code.html
=====================================================================================*/

#ifndef NORMAL_H

#define NORMAL_H

double gaussrand();


#endif // NORMAL_H
