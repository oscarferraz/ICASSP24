/*	LDPC_ENCODE.C
=====================================================================================

Contains:
  -> Procedures for generating valid codewords


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
#include "ldpc_encode.h"
#include "compilation_directives.h"



/*************************************************************************************************************/
/*																											 */
/*  void encode()																							 */		
/*																											 */
/*************************************************************************************************************/
void encode(char   *transmited_code_word, int N){

#ifdef DATA_EQUAL_ZERO

	int i;
	// ----------        FOR CONVENIENCE, MAKE DATA EQUAL TO ZERO
	for (i=0; i<N; i++) transmited_code_word[i] = 0;

#endif /* DATA_EQUAL_ZERO */

}// end encode()

