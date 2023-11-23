/*	CHANNEL.C
=====================================================================================

Contains:
  -> Procedures for simulating different tipes of channels


Written by: Marco Alexandre Cravo Gomes 
			University of Coimbra - Electrical Engineering and Computer Department
			
			email: <marco@deec.uc.pt>
			url:   www.deec.uc.pt/~marco
			
Date: February 2003
=====================================================================================*/

//==============================================//
// I N C L U D E S								//
//==============================================//
//---------------------- ANSI C

//---------------------- OTHER FILES
#include "channel.h"
#include "compilation_directives.h"

#ifdef _WINDOWS

#include "normal.h"
#define  GAUSSIAN_GENERATOR()  gaussrand()

#else

#include "rand.h"
#define  GAUSSIAN_GENERATOR()  rand_gaussian()

#endif

/*************************************************************************************************************/
/*																											 */
/*  void gaussian_channel()																					 */		
/*																											 */
/*************************************************************************************************************/
void gaussian_channel(float *received_word, char *transmited_code_word, float sigma, int N){

	int i;

#ifdef DATA_EQUAL_ZERO
	
	// ----------        FOR CONVENIENCE, MAKE DATA EQUAL TO ZERO
	for (i=0; i<N; i++) received_word[i] = 1 + sigma * (float) GAUSSIAN_GENERATOR();

#else
    
	for (i=0; i<N; i++) received_word[i] = -2 * transmited_code_word[i] + 1 + sigma * (float) GAUSSIAN_GENERATOR();

#endif /* DATA_EQUAL_ZERO */


}// end channel()
