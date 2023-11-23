/* RESULTS.C
=====================================================================================

Contains:
  -> Routines for calculating:
        BER	      - bit error rate
		UND_BER   - undetected bit error rate
		BLER      - block error rate
		UND_BLER  - undetected block error rate
		AVER_ITER - average iterations 
  
 
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
#include <stdio.h>
#include <stdlib.h>
//---------------------- OTHER FILES
#include "results.h"
#include "compilation_directives.h"






/*************************************************************************************************************/
/*																											 */
/*  void reset_counters()																					 */		
/*																											 */
/*************************************************************************************************************/
void reset_counters(struct total_results *tr){

	tr->count_iter = tr->bit_errors = tr->und_bit_errors = tr->block_errors = tr->und_block_errors = 0;
	tr->elapsed_time = 0;

}// end reset_counters()




/*************************************************************************************************************/
/*																											 */
/*  void count_errors()																						 */		
/*																											 */
/*************************************************************************************************************/
void count_errors(char *transmited_code_word, 
				  char *decoded_word, 
				  struct total_results *tr,
				  char valid_decoded_word)
{


	int i, aux=0;
	
	
#ifdef DATA_EQUAL_ZERO
	
	for(i=0; i<tr->N; i++) aux += (int) decoded_word[i];
	
#else

	for(i=0; i<tr->N; i++) aux += (decoded_word[i] != transmited_word[i]);

#endif

	tr->bit_errors += aux;
	if(!valid_decoded_word)
	    tr->block_errors+=1;
	else if(aux){
		tr->und_bit_errors += aux;
		tr->und_block_errors +=1;
		tr->block_errors +=1;
	}

}// end count_errors()




/*************************************************************************************************************/
/*																											 */
/*  void calculate_averages()																					 */		
/*																											 */
/*************************************************************************************************************/
void calculate_averages(struct total_results *tr, 
						struct average_results *avr)
{

	float num_total_bits;
		
	num_total_bits = (float) tr->N * tr->num_sim;
	avr->ber = (float) tr->bit_errors / (float) num_total_bits;
	avr->und_ber = (float) tr->und_bit_errors / (float) num_total_bits;
	avr->bler = (float) tr->block_errors / (float) tr->num_sim;
	avr->und_bler = (float) tr->und_block_errors / (float) tr->num_sim;
	avr->av_iter = (float) tr->count_iter / (float) tr->num_sim;
	avr->av_time_word = tr->elapsed_time / (float)  tr->num_sim;
	avr->av_time_iter = avr->av_time_word / avr->av_iter;

	printf("\nNumero Total de Bits %f", num_total_bits);
	printf("\nNumero Total de Bit Errors %f", tr->bit_errors);
	printf("\nNumero Total de Undetected Bit Errors %f", tr->und_bit_errors);
	printf("\nNumero Total de Block Errors %f", tr->block_errors);
	printf("\nNumero Total de Undetected Block Errors %f", tr->und_block_errors);
	printf("\nTempo de Descodificacao %f sec\n", tr->elapsed_time);

}// end calculate_averages() 


/*************************************************************************************************************/
/*																											 */
/*  void save_results()																					 */		
/*																											 */
/*************************************************************************************************************/
void save_results(char *input_filename, 
				  char *output_file, 
				  char *simulation_type,
				  short int n,
				  short int k,
				  float init_snr,
				  float final_snr,
				  float snr_increment,
				  float snr,
				  int max_iter,
				  int num_sim,
				  struct average_results *avr)
{

  FILE *fp;
  static char file_already_created=0;

  if (!file_already_created){
    if ((fp = fopen(output_file,"wt")) != NULL)
	{
	  fprintf(fp,"RESULTS OF %s DECODING OF CODE %s\n\n", simulation_type, input_filename);
	  fprintf(fp,"Code Dimensions: N= %hd K=%hd\n\n", n, k);
	  fprintf(fp,"Simulation Parameters:\n");
	  fprintf(fp,"Initial SNR = %f\n", init_snr);	
	  fprintf(fp,"Final SNR = %f\n", final_snr);
	  fprintf(fp,"SNR Increment = %f\n", snr_increment);
	  fprintf(fp,"Maximum number of Iterations = %d\n", max_iter);
	  fprintf(fp,"Number of Simulations = %d\n\nRESULTS:\n\n", num_sim);
	  fprintf(fp,"SNR\tBER\t\tUND_BER\t\tBLER\t\tUND_BLER\tAVER_ITERATIONS\tAVER_TIME_WORD\tAVER_TIME_ITER\n");
	  fprintf(fp,"%.3f\t%e\t%e\t%e\t%e\t%e\t%e\t%e\n", snr, avr->ber, avr->und_ber, avr->bler, avr->und_bler, avr->av_iter, avr->av_time_word, avr->av_time_iter);
	  fclose(fp);
	  
	}else{
      printf("Couldn't open file to save results...\n");
      exit(0);
	}
	file_already_created+=1;

  }else{

    if ((fp = fopen(output_file,"at")) != NULL)
	{
	  fprintf(fp,"%.3f\t%e\t%e\t%e\t%e\t%e\t%e\t%e\n", snr, avr->ber, avr->und_ber, avr->bler, avr->und_bler, avr->av_iter, avr->av_time_word, avr->av_time_iter);
	  fclose(fp);
	}else{
      printf("Couldn't open file to save results...\n");
      exit(0);
	}
  }


}// end save_results()
