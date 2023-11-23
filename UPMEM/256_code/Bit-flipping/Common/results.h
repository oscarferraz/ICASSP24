/* RESULTS.H
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

#ifndef RESULTS_H

#define RESULTS_H 

//#include <time.h>

typedef struct average_results{

  float ber;			  // --> bit error rate
  float und_ber;		  // --> undetected bit error rate
  float bler;			  // --> block error rate
  float und_bler;		  // --> undetected block error rate
  float av_iter;		  // --> average number of iterations of the decoding algorithm	
  float av_time_word;	  // --> average elapsed time for decoding word
  float av_time_iter;	  // --> average elapsed time for decoding iteration

}_AVERAGE_RESULTS;

typedef struct total_results{

  float   bit_errors;		// --> number of bit errors ocurred during simulation
  float   und_bit_errors;	// --> number of bit errors ocurred during simulation not detected
  float   block_errors;	    // --> number of block errors ocurred during simulation
  float	  und_block_errors; // --> number of block errors ocurred during simulation not detected
  float   count_iter;		// --> total number of iterations realized during simulation
  double  elapsed_time;     // --> elapsed decoding time during simulation

  short int N;				// --> codewords lenght
  int	num_sim;			// --> total number of simulations (codewors)

}_TOTAL_RESULTS;



//==============================================//
// F U N C T I O N S     P R O T O T Y P E S	//
//==============================================//
void reset_counters(struct total_results *tr);

void count_errors(char *transmited_code_word, 
				  char *decoded_word, 
				  struct total_results *tr,
				  char valid_decoded_word);

void calculate_averages(struct total_results *tr, 
						struct average_results *avr);

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
				  struct average_results *avr);

#endif //RESULTS_H
