/*===================================================================================
	MIN_SUM.C
=====================================================================================

Contains:
  -> Procedures for simulating MIN-SUM algorithms

Written by: Oscar Ferraz from the code of Marco Alexandre Cravo Gomes 
			University of Coimbra - Electrical Engineering and Computer Department
			
			email: <oscar.ferraz@co.it.pt>
			
Date: March 2023
=====================================================================================*/



//==============================================//
// I N C L U D E S								//
//==============================================//
//---------------------- ANSI C
#include <stdio.h>
#include <stdlib.h>
#include <math.h>
#include <float.h>
#include <string.h>
#include <time.h>
#include <assert.h>
#include <dpu.h>
#include <dpu_log.h>
#include <errno.h>

//---------------------- OTHER FILES
#include "types_min_sum.h"
#include "Common/ldpc_encode.h"
#include "Common/channel.h"
#include "Common/compilation_directives.h"
#include "Common/results.h"

#ifndef DPU_BINARY
#define DPU_BINARY "./device"
#endif

#include "Common/normal.h"
#define  RANDOMIZE_SEED		   srand		   

short int cn_5[64][5]={{1, 10,  27,  45,  49},
{2,  11,  28,  46,  50  },
{3,  12,  29,  47,  51  },
{4,  13,  30,  48,  52  },
{5,  14,  31,  33,  53  },
{6,  15,  32,  34,  54  },
{7,  16,  17,  35,  55  },
{1,  8,   18,  36,  56  },
{2,  9,   19,  37,  57  },
{3,  10,  20,  38,  58  },
{4,  11,  21,  39,  59  },
{5,  12,  22,  40,  60  },
{6,  13,  23,  41,  61  },
{7,  14,  24,  42,  62  },
{8,  15,  25,  43,  63  },
{9,  16,  26,  44,  64  },
{15, 17,  18,  48,  64  },
{16, 18,  19,  33,  49  },
{1,  19,  20,  34,  50  },
{2,  20,  21,  35,  51  },
{3,  21,  22,  36,  52  },
{4,  22,  23,  37,  53  },
{5,  23,  24,  38,  54  },
{6,  24,  25,  39,  55  },
{7,  25,  26,  40,  56  },
{8,  26,  27,  41,  57  },
{9,  27,  28,  42,  58  },
{10, 28,  29,  43,  59  },
{11, 29,  30,  44,  60  },
{12, 30,  31,  45,  61  },
{13, 31,  32,  46,  62  },
{14, 17,  32,  47,  63  },
{3,  17,  33,  34,  56  },
{4,  18,  34,  35,  57  },
{5,  19,  35,  36,  58  },
{6,  20,  36,  37,  59  },
{7,  21,  37,  38,  60  },
{8,  22,  38,  39,  61  },
{9,  23,  39,  40,  62  },
{10, 24,  40,  41,  63  },
{11, 25,  41,  42,  64  },
{12, 26,  42,  43,  49  },
{13, 27,  43,  44,  50  },
{14, 28,  44,  45,  51  },
{15, 29,  45,  46,  52  },
{16, 30,  46,  47,  53  },
{1,  31,  47,  48,  54  },
{2,  32,  33,  48,  55  },
{11, 32,  35,  49,  52  },
{12, 17,  36,  50,  53  },
{13, 18,  37,  51,  54  },
{14, 19,  38,  52,  55  },
{15, 20,  39,  53,  56  },
{16, 21,  40,  54,  57  },
{1,  22,  41,  55,  58  },
{2,  23,  42,  56,  59  },
{3,  24,  43,  57,  60  },
{4,  25,  44,  58,  61  },
{5,  26,  45,  59,  62  },
{6,  27,  46,  60,  63  },
{7,  28,  47,  61,  64  },
{8,  29,  48,  49,  62  },
{9,  30,  33,  50,  63  },
{10, 31,  34,  51,  64 }};


short int cn_3[64][3]={{17,  38,  51},
{18,  39,  52},
{19,  40,  53},
{20,  41,  54},
{21,  42,  55},
{22,  43,  56},
{23,  44,  57},
{24,  45,  58},
{25,  46,  59},
{26,  47,  60},
{27,  48,  61},
{28,  33,  62},
{29,  34,  63},
{30,  35,  64},
{31,  36,  49},
{32,  37,  50},
{1,  33,  64},
{2,  34,  49},
{3,  35,  50},
{4,  36,  51},
{5,  37,  52},
{6,  38,  53},
{7,  39,  54},
{8,  40,  55},
{9,  41,  56},
{10,  42,  57},
{11,  43,  58},
{12,  44,  59},
{13,  45,  60},
{14,  46,  61},
{15,  47,  62},
{16,  48,  63},
{4,  17,  49},
{5,  18,  50},
{6,  19,  51},
{7,  20,  52},
{8,  21,  53},
{9,  22,  54},
{10,  23,  55},
{11,  24,  56},
{12,  25,  57},
{13,  26,  58},
{14,  27,  59},
{15,  28,  60},
{16,  29,  61},
{1,  30,  62},
{2,  31,  63},
{3,  32,  64},
{1,  26,  46},
{2,  27,  47},
{3,  28,  48},
{4,  29,  33},
{5,  30,  34},
{6,  31,  35},
{7,  32,  36},
{8,  17,  37},
{9,  18,  38},
{10,  19,  39},
{11,  20,  40},
{12,  21,  41},
{13,  22,  42},
{14,  23,  43},
{15,  24,  44},
{16,  25,  45}};



//==============================================//
// G L O B A L      V A R I A B L E S			//
//==============================================//
short int N, M;				      // --> Number of Colums and rows of the parity check matrice H defined in the aliast format
short int max_bit_node_degree;	  // --> Maximum bit node degree
short int max_check_node_degree;  // --> Maximum check node degree
struct node_bit *bitnode;		  // --> bitnode[i] - means the bit node i of the LDPC code
struct node_check *checknode;	  // --> checknode[j] - means the check node j of the LDPC code
struct edge_check_to_bit *Lrji;	  // --> Message sent from CN j to BN i
struct edge_bit_to_check *Lqij;	  // --> Message sent from BN i to CN j
char  *LPi;					  // --> Probabilities of initialization of the SPA decoding algorithm Pr(ci=1|yi) 
float  *LQi;					  // --> Pseudo-probabilities a posteriori of decoded simbols 
char   *transmited_code_word;	  // --> word transmited by the LDPC encoder
float  *received_word;			  // --> word received by the decoder in order to be decoded
//char   *decoded_word;
char   decoded_word[256];				  // --> word decoded by the LDPC decoder
float  snr_rms;
char   normalized_min_sum;
char   universal_min_sum;		  // --> decoding is made independent of the channel caracteristics
float  normalization_factor;	  // --> decoding uses normalization factors
struct timespec start, end;		  

//==============================================//
// F U N C T I O N S     P R O T O T Y P E S	//
//==============================================//
void initialize_MIN_SUM(char *filename);
void finalize_MIN_SUM(void);
int MIN_SUM(int max_iter, char *valid_decoded_word);
int min_sum_simulation(short int n, short int k, 
		  		       char filename[], 
				       int max_iter, 
				       float init_snr, 
					   float final_snr, 
					   float snr_increment, 
					   int num_sim, 
					   char output_file[], 
					   int seed);



/*************************************************************************************************************/
/*																											 */
/*  M A I N   P R O G R A M																					 */		
/*																											 */
/*************************************************************************************************************/
int main(){

	
	
	/*-------------------------------------------  VARIABLES ----*/
	/*===========================================================*/
	char simulation_type[10];									// --> type of simulation to be done
	char filename[]="/home/oferraz/upmem/LDPC_128_64.alist";	// --> name of the file containing the H matrix defined in the aliast format
	char output_file[]="output.out";										// --> file where the results of simulstion will be saved
	short int k=64;												// --> dimensions of H matrix (N->n� colums M -> n� rows)
	short int n=128;											// --> dimensions of H matrix (N->n� colums M -> n� rows)
	int	  max_iter=1;												// --> number maximum of iterations of the iterative decoding algorithm								
	int   num_sim=1;												// --> number of simulations to be done
	float init_snr=0.5;
	float final_snr=0.5;
	float snr_increment=0.5;					// --> SNR's to be tested (minimum, maximum, and increment)
	int   seed=0;													// --> seed for initialization of the random generator used during the simulations
	
		
	universal_min_sum = 0;
	normalized_min_sum = 1;
	normalization_factor=1;

	min_sum_simulation(n, k, filename, max_iter, init_snr, final_snr, snr_increment, num_sim, output_file, seed);


} //end main()


/*****************************************************************************************************************/
/*																												 */
/*  M I N - S U M    S I M U L A T I O N																		 */
/*																												 */
/*  Description:																								 */
/*    - C code for testing the Min-Sum Algorithm with and without correction factor       						 */
/*																												 */
/*****************************************************************************************************************/
int min_sum_simulation(short int n, short int k, 
		  		       char filename[], 
				       int max_iter, 
				       float init_snr, 
					   float final_snr, 
					   float snr_increment, 
					   int num_sim, 
					   char output_file[], 
					   int seed)
{
	float						rate;	// --> code rate
	float						 snr;	// --> signal noise ratio
	struct total_results  counters;	// --> variable containing counters of:
										//        - bit_errors
										//        - und_bit_errors	
										//        - block_errors
										//        - und_block_errors
										//        - count_iter
										//        - codeword_lenght
										//        - num_simul
										//        (for more details read "results.h")	  
	struct average_results aver_res;	// --> variable containing the averages:
										//        - ber	
										//        - und_ber
										//        - bler
										//        - und_bler
										//        - av_iter
										//            (for more details read "results.h")	  
	float					   sigma;	// --> noise standard desviation
	char			  dec_word_valid[8];	// --> flag indicating if the decoded word was a valid codeword
	int						   i;   // --> auxiliar variable
	time_t	  init_decoding_time;   // --> initial instant of decoding
	time_t	  final_decoding_time;  // --> final instant of decoding

	


	counters.N = n;
	counters.num_sim = num_sim;
	rate = (float) k / (float) n;	

	if( (LPi =(char *) malloc(256*sizeof(char))) == NULL ){
		printf("Memory allocation faillure for LPi in MIN-SUM...\n");
		exit(0);
	}	
	
	//initialize_MIN_SUM(filename);

	short int bitnode_degree[N];
	short int checknode_degree[M];
	short int Lrji_index[512];
	short int Lqij_index[512];
	float Lrji_values[512];



	/*for(i=0;i<512;i++){
		printf("Lrji[%d].index=%d\n", i,  Lrji[i].index);
		//Lrji_value[i]=Lrji[i].value;
	}*/

	/*for (i=0;i<N;i++){
		for(int aux=0;aux<bitnode[i].degree;aux++){
			fscanf(fp,"%hd", &index);
			bitnode[i].first[aux].index=index-1;
			bitnode[i].first[aux].pointer=checknode[index-1].first;
			(checknode[index-1].first)->pointer=&(bitnode[i].first[aux]);
			(checknode[index-1].first)->index=i;
			checknode[index-1].first+=1;
		}
	}*/

	


	/*printf("bitnode_degree[%d]=%d\n", 0,  bitnode_degree[0]);
	printf("bitnode_degree[%d]=%d\n", 1,  bitnode_degree[1]);
	printf("bitnode_degree[%d]=%d\n", 2,  bitnode_degree[2]);*/
			


#ifndef _TESTING_PROCEDURE

  // ------------------------------------------------------------------- //
  //                  S I M U L A T I O N   L O O P						 //
  // ------------------------------------------------------------------- //

  
	snr = init_snr;

	RANDOMIZE_SEED(seed);
	struct dpu_set_t set, dpu;
	uint32_t nr_ranks;


	// allocates a set of UPMEM DPU ranks
	DPU_CHECK(dpu_alloc(1, NULL, &set), errno);

	// reads and loads the binary executable into the allocated DPU set
	DPU_CHECK(dpu_load(set, DPU_BINARY, NULL), errno);
  
	for (snr=init_snr; snr<=final_snr; snr+=snr_increment){

		// -----------------------------------------	   RESET COUNTERS
		reset_counters(&counters);

		
		
		// -----------------------------------------     SNR CALCULATION
		//	
		//		 Eb		      1							   2
		//   SNR=	---- = -------------------    snr_rms = --------
		//		 No	    2 * rate * sigma2				 sigma2
		//
		// --------------------------------------------------------------
		snr_rms = 4 * rate * (float) pow(10, snr / 10); 
		sigma = (float) sqrt(2 / snr_rms);

		

	  
		for(i=0; i<num_sim; i++){
			
			// ---------------------------------------        ENCODING
			encode(transmited_code_word, N);

			// -------------     BPSK MAPPING: "0" --> +1,  "1" --> -1
			//					 NOISE INSERTION
			gaussian_channel(received_word, transmited_code_word, sigma, N);

			/* for (i=0; i<N ;i++){
				LPi[i] = received_word[i]*snr_rms;
			} */

			LPi[0]=0;
			LPi[1]=0;
			LPi[2]=0;
			LPi[3]=0;
			LPi[4]=0;
			LPi[5]=0;
			LPi[6]=1;
			LPi[7]=0;
			LPi[8]=0;
			LPi[9]=0;
			LPi[10]=0;
			LPi[11]=0;
			LPi[12]=0;
			LPi[13]=0;
			LPi[14]=1;
			LPi[15]=0;
			LPi[16]=1;
			LPi[17]=0;
			LPi[18]=0;
			LPi[19]=0;
			LPi[20]=1;
			LPi[21]=1;
			LPi[22]=1;
			LPi[23]=1;
			LPi[24]=0;
			LPi[25]=1;
			LPi[26]=1;
			LPi[27]=0;
			LPi[28]=1;
			LPi[29]=0;
			LPi[30]=0;
			LPi[31]=0;
			LPi[32]=0;
			LPi[33]=1;
			LPi[34]=0;
			LPi[35]=0;
			LPi[36]=1;
			LPi[37]=0;
			LPi[38]=1;
			LPi[39]=0;
			LPi[40]=0;
			LPi[41]=0;
			LPi[42]=0;
			LPi[43]=0;
			LPi[44]=0;
			LPi[45]=0;
			LPi[46]=1;
			LPi[47]=0;
			LPi[48]=0;
			LPi[49]=0;
			LPi[50]=1;
			LPi[51]=0;
			LPi[52]=0;
			LPi[53]=0;
			LPi[54]=1;
			LPi[55]=0;
			LPi[56]=0;
			LPi[57]=0;
			LPi[58]=0;
			LPi[59]=0;
			LPi[60]=0;
			LPi[61]=0;
			LPi[62]=0;
			LPi[63]=0;
			LPi[64]=0;
			LPi[65]=1;
			LPi[66]=0;
			LPi[67]=0;
			LPi[68]=0;
			LPi[69]=0;
			LPi[70]=0;
			LPi[71]=1;
			LPi[72]=0;
			LPi[73]=0;
			LPi[74]=0;
			LPi[75]=0;
			LPi[76]=0;
			LPi[77]=0;
			LPi[78]=0;
			LPi[79]=1;
			LPi[80]=1;
			LPi[81]=1;
			LPi[82]=0;
			LPi[83]=0;
			LPi[84]=0;
			LPi[85]=0;
			LPi[86]=0;
			LPi[87]=1;
			LPi[88]=0;
			LPi[89]=0;
			LPi[90]=0;
			LPi[91]=1;
			LPi[92]=1;
			LPi[93]=0;
			LPi[94]=0;
			LPi[95]=1;
			LPi[96]=0;
			LPi[97]=0;
			LPi[98]=0;
			LPi[99]=0;
			LPi[100]=0;
			LPi[101]=1;
			LPi[102]=0;
			LPi[103]=1;
			LPi[104]=1;
			LPi[105]=0;
			LPi[106]=0;
			LPi[107]=0;
			LPi[108]=0;
			LPi[109]=0;
			LPi[110]=0;
			LPi[111]=0;
			LPi[112]=0;
			LPi[113]=0;
			LPi[114]=0;
			LPi[115]=0;
			LPi[116]=0;
			LPi[117]=1;
			LPi[118]=1;
			LPi[119]=0;
			LPi[120]=1;
			LPi[121]=0;
			LPi[122]=0;
			LPi[123]=0;
			LPi[124]=0;
			LPi[125]=0;
			LPi[126]=1;
			LPi[127]=1;
			LPi[128]=0;
			LPi[129]=0;
			LPi[130]=1;
			LPi[131]=0;
			LPi[132]=0;
			LPi[133]=0;
			LPi[134]=1;
			LPi[135]=0;
			LPi[136]=1;
			LPi[137]=0;
			LPi[138]=1;
			LPi[139]=0;
			LPi[140]=0;
			LPi[141]=0;
			LPi[142]=0;
			LPi[143]=0;
			LPi[144]=1;
			LPi[145]=1;
			LPi[146]=0;
			LPi[147]=0;
			LPi[148]=0;
			LPi[149]=0;
			LPi[150]=0;
			LPi[151]=1;
			LPi[152]=0;
			LPi[153]=0;
			LPi[154]=0;
			LPi[155]=0;
			LPi[156]=0;
			LPi[157]=0;
			LPi[158]=0;
			LPi[159]=1;
			LPi[160]=0;
			LPi[161]=1;
			LPi[162]=0;
			LPi[163]=1;
			LPi[164]=0;
			LPi[165]=0;
			LPi[166]=0;
			LPi[167]=0;
			LPi[168]=0;
			LPi[169]=1;
			LPi[170]=1;
			LPi[171]=0;
			LPi[172]=0;
			LPi[173]=1;
			LPi[174]=0;
			LPi[175]=0;
			LPi[176]=0;
			LPi[177]=1;
			LPi[178]=0;
			LPi[179]=1;
			LPi[180]=0;
			LPi[181]=0;
			LPi[182]=1;
			LPi[183]=0;
			LPi[184]=0;
			LPi[185]=0;
			LPi[186]=0;
			LPi[187]=0;
			LPi[188]=1;
			LPi[189]=0;
			LPi[190]=0;
			LPi[191]=0;
			LPi[192]=0;
			LPi[193]=0;
			LPi[194]=0;
			LPi[195]=0;
			LPi[196]=0;
			LPi[197]=1;
			LPi[198]=0;
			LPi[199]=0;
			LPi[200]=0;
			LPi[201]=1;
			LPi[202]=0;
			LPi[203]=1;
			LPi[204]=0;
			LPi[205]=0;
			LPi[206]=1;
			LPi[207]=0;
			LPi[208]=0;
			LPi[209]=0;
			LPi[210]=0;
			LPi[211]=0;
			LPi[212]=0;
			LPi[213]=1;
			LPi[214]=0;
			LPi[215]=0;
			LPi[216]=0;
			LPi[217]=0;
			LPi[218]=0;
			LPi[219]=0;
			LPi[220]=0;
			LPi[221]=0;
			LPi[222]=1;
			LPi[223]=0;
			LPi[224]=0;
			LPi[225]=0;
			LPi[226]=1;
			LPi[227]=0;
			LPi[228]=0;
			LPi[229]=1;
			LPi[230]=1;
			LPi[231]=0;
			LPi[232]=0;
			LPi[233]=0;
			LPi[234]=0;
			LPi[235]=0;
			LPi[236]=0;
			LPi[237]=1;
			LPi[238]=0;
			LPi[239]=0;
			LPi[240]=0;
			LPi[241]=0;
			LPi[242]=0;
			LPi[243]=0;
			LPi[244]=0;
			LPi[245]=0;
			LPi[246]=0;
			LPi[247]=1;
			LPi[248]=0;
			LPi[249]=1;
			LPi[250]=0;
			LPi[251]=0;
			LPi[252]=1;
			LPi[253]=0;
			LPi[254]=0;
			LPi[255]=1;			




			DPU_CHECK(dpu_copy_to(set, "L", 0, LPi, 256*sizeof(char)), errno);
			//DPU_CHECK(dpu_copy_to(set, "bitnode_degree", 0, bitnode_degree, N*sizeof(short int)), errno);
			//DPU_CHECK(dpu_copy_to(set, "checknode_degree", 0, checknode_degree, M*sizeof(short int)), errno);
			//DPU_CHECK(dpu_copy_to(set, "Lrji_index", 0, Lrji_index, 512*sizeof(short int)), errno);
			//DPU_CHECK(dpu_copy_to(set, "Lqij_index", 0, Lqij_index, 512*sizeof(short int)), errno);
			//DPU_CHECK(dpu_broadcast_to(set, "bitnode", 32*sizeof(struct node_bit), bitnode, 32*sizeof(struct node_bit), DPU_XFER_DEFAULT) , errno);;

			//DPU_CHECK(dpu_copy_to(set, "checknode", 0, checknode, M*sizeof(struct node_check)), errno);
			
			//printf("size of =%zu\n",sizeof(struct node_bit));
			//printf("bitnode[%d].first=%x\n", 0,  bitnode[0].first);

			clock_gettime(CLOCK_MONOTONIC, &start);

			DPU_CHECK(dpu_launch(set, DPU_SYNCHRONOUS), errno);
		
			clock_gettime(CLOCK_MONOTONIC, &end);
			printf("Elapsed Time=%lf ms\n",(end.tv_sec-start.tv_sec)*1e3+(end.tv_nsec-start.tv_nsec)*1e-6);
			//starts the execution of the program
			
			uint32_t nb_cycles;
			//iterates over the individual DPUs from the allocated set
			DPU_FOREACH(set, dpu) {
				//DPU_CHECK(dpu_copy_from(dpu, "valid_decoded_word", 0, &dec_word_valid, 8*sizeof(char)), errno);
				DPU_CHECK(dpu_copy_from(dpu, "L", 0, &decoded_word, 256*sizeof(char)), errno);
				DPU_CHECK(dpu_copy_from(dpu, "nb_cycles", 0, &nb_cycles, sizeof(uint32_t)), errno);
				//DPU_CHECK(dpu_copy_from(dpu, "Lrji_values", 0, &Lrji_values, 2*sizeof(float)), errno);

				//fetches the DPU stdout buffer and display it on the host stdout
				//DPU_CHECK(dpu_log_read(dpu, stdout), errno);
			}

			DPU_CHECK(dpu_free(set), errno);
			printf("%lf %d\n",(end.tv_sec-start.tv_sec)*1e3+(end.tv_nsec-start.tv_nsec)*1e-6, nb_cycles);

			printf("DPU cycles: %u\n", nb_cycles);


			/*clock_gettime(CLOCK_MONOTONIC, &start);
			DPU_CHECK(dpu_launch(set, DPU_SYNCHRONOUS), errno);
			clock_gettime(CLOCK_MONOTONIC, &end);
			printf("Elapsed Time=%lf ms\n",(end.tv_sec-start.tv_sec)*1e3+(end.tv_nsec-start.tv_nsec)*1e-6);*/

			/*printf("DPU cycles: %u\n", nb_cycles);
			printf("DPU time: %.2e secs.\n", (double)nb_cycles / CLOCKS_PER_SEC );

			printf("Host elapsed time: %.2e secs.\n", end - start);*/

			

			for (i=0; i<256 ;i++){
				printf("%d\n",  decoded_word[i] );
			} 


			/*for (i=0; i<512 ;i++){
				printf("Lrji[%d]=%f\n", i, Lrji_values[i]  );
			}*/

			printf("dec_word_valid=%d\n", dec_word_valid[0] );

			// -------------     DECODING
			/*time(&init_decoding_time);
			clock_gettime(CLOCK_MONOTONIC, &start);

			counters.count_iter += MIN_SUM(max_iter, &dec_word_valid);
			clock_gettime(CLOCK_MONOTONIC, &end);
			printf("Elapsed Time=%lf ms\n",(end.tv_sec-start.tv_sec)*1e3+(end.tv_nsec-start.tv_nsec)*1e-6);
			time(&final_decoding_time);
			counters.elapsed_time += difftime(final_decoding_time, init_decoding_time);*/

			// -----------       COUNT THE NUMBER OF BIT AND BLOCK ERRORS DETECTED AND UNDETECTED
			// count_errors(transmited_code_word, decoded_word, &counters, dec_word_valid[0]);
			
	  	}

		//When the execution completes, the allocated DPU set must be free
			
		
		// -------------       AVERAGES CALCULATION AND SAVE RESULTS
		// calculate_averages(&counters, &aver_res);
		// save_results(filename, output_file, "SPA", n, k, init_snr, final_snr, snr_increment, snr, max_iter, num_sim, &aver_res);

	}
	
	
  
  
#else

   received_word[0] = (float) 0.2;
   received_word[1] = (float) 0.2;
   received_word[2] = (float) -0.9;
   received_word[3] = (float) 0.6;
   received_word[4] = (float) 0.5;
   received_word[5] = (float) -1.1;
   received_word[6] = (float) -0.4;
   received_word[7] = (float) -1.2;
   snr_rms=4;

   MIN_SUM(max_iter, &dec_word_valid);


#endif

  
//    finalize_MIN_SUM();
   return 0;


} // end min_sum_simulation()


/*************************************************************************************************************/
/*																											 */
/*  I N I T I A L I Z E            																		     */		
/*                                 																			 */
/*																											 */
/*  Description: procedure that reads the aliast format in which the parity check matrix of the				 */
/*               LDPC code is described and reserve memory space for the variables involved in				 */
/*				 the decoding algorithm																		 */
/*************************************************************************************************************/
void initialize_MIN_SUM(char *filename){

  FILE *fp;
  register short int i, j, aux, count=0;
  short int index;

  //---------------------------------------------------------------- READ THE ALIAST FORMAT
  //													IN WHICH THE LDPC CODE IS DESCRIBED
	if ((fp = fopen(filename,"r")) != NULL){
		//read H dimensions and maximum bit node and check node degree
		//------------------------------------------------------------
		fscanf(fp, "%hd %hd", &N, &M);
		//N=128;
		//M=64;
	
		fscanf(fp, "%hd %hd", &max_bit_node_degree, &max_check_node_degree);     
		//max_bit_node_degree=5;
		//max_check_node_degree=8; 
	
		//reservation of space for "bitnode" and "checknode" variables
		//-------------------------------------------------------------
		if( (bitnode =(struct node_bit *) malloc(N*sizeof(struct node_bit))) == NULL ){
			printf("unable to allocate memory for bitnodes ...\n");
			exit(0);
		}
		if( (checknode =(struct node_check *) malloc(M*sizeof(struct node_check))) == NULL ){
			printf("unable to allocate memory for checknodes ...\n");
			exit(0);
		}

		//printf("size=%zu\n", sizeof(struct node_bit));
		//printf("size short int=%zu\n", sizeof(short int));
		//printf("size float=%zu\n", sizeof(float));
		// read from file bitnode degree 
		//------------------------------
		for(i=0;i<N;i++){
			fscanf(fp, "%hd", &(bitnode[i].degree));
			count+=bitnode[i].degree;
		}
		
		/*for(i=0;i<64;i++){
			bitnode[i].degree=5;
			count+=bitnode[i].degree;
		}

		for(i=64;i<128;i++){
			bitnode[i].degree=3;
			count+=bitnode[i].degree; //conferir count
		}*/
	
	
		//reservation of space for "Lrji" and "Lqij" variables
		//--------------------------------------------------
		if( (Lrji =(struct edge_check_to_bit *) malloc(count*sizeof(struct edge_check_to_bit))) == NULL ){
			printf("Memory allocation faillure for Lrji in MIN-SUM...\n");
			exit(0);
		}
		if( (Lqij =(struct edge_bit_to_check *) malloc(count*sizeof(struct edge_bit_to_check))) == NULL ){
			printf("Memory allocation faillure for Lqij in MIN-SUM...\n");
			exit(0);
		}
		
		// Initialization of pointer "bitnode[i].first"
		//---------------------------------------------
		aux=0;
		for (i=0;i<N; i++){
			bitnode[i].first=&Lrji[aux];
			aux+=bitnode[i].degree;
		}


		// read from file checknode degree and initialize pointer "checknode[j].first"
		//-------------------------------------------------------------------------------
		aux=0;
		for(j=0;j<M;j++){
			fscanf(fp, "%hd", &(checknode[j].degree));
			checknode[j].first=&Lqij[aux];
			aux+=checknode[j].degree;		  
		}

		/*for(j=0;j<M;j++){
			checknode[j].degree=8;
			checknode[j].first=&Lqij[aux];
			aux+=checknode[j].degree;		  
		}*/

	
		// Read the index of checknodes (index of rows) that are used in computation of Lqij(message sent from 
		// bitnode i to check node j) and make "Lrji.pointer" point to the correct place of "Lqij vector" where
		// Lqij should be palced and vice-versa.
		//---------------------------------------------------------------------------------------------------
		for (i=0;i<N;i++){
			for(aux=0;aux<bitnode[i].degree;aux++){
				fscanf(fp,"%hd", &index);
				bitnode[i].first[aux].index=index-1;
				bitnode[i].first[aux].pointer=checknode[index-1].first;
				(checknode[index-1].first)->pointer=&(bitnode[i].first[aux]);
				(checknode[index-1].first)->index=i;
				checknode[index-1].first+=1;
			}
		}

		/*for (i=0;i<64;i++){
			for(aux=0;aux<bitnode[i].degree;aux++){
				index=cn_5[i][aux];
				bitnode[i].first[aux].index=index-1;
				bitnode[i].first[aux].pointer=checknode[index-1].first;
				(checknode[index-1].first)->pointer=&(bitnode[i].first[aux]);
				(checknode[index-1].first)->index=i;
				checknode[index-1].first+=1;
			}
		}

		for (i=64;i<N;i++){
			for(aux=0;aux<bitnode[i].degree;aux++){
				index=cn_3[i-64][aux];
				bitnode[i].first[aux].index=index-1;
				bitnode[i].first[aux].pointer=checknode[index-1].first;
				(checknode[index-1].first)->pointer=&(bitnode[i].first[aux]);
				(checknode[index-1].first)->index=i;
				checknode[index-1].first+=1;
			}
		}*/


		// Re-initialization of pointer "checknode[j].first" and
		// initialization of minimum and second minimum
		//--------------------------------------------------------
		aux=0;
		for (j=0;j<M; j++){
			checknode[j].first=&Lqij[aux];
			aux+=checknode[j].degree;		  
			checknode[j].abs_minimum=FLT_MAX;
			checknode[j].abs_second_minimum=FLT_MAX;
			checknode[j].sign=1; 
		}

	
		//reservation of memory space for transmited_code_word, received_word and decoded_word
		//--------------------------------------------------------------------------------
		if( (transmited_code_word =(char *) malloc(N*sizeof(char))) == NULL ){
			printf("memory allocation faillure for transmited_code_word in MIN-SUM...\n");
			exit(0);
		}
		
		if( (received_word =(float *) malloc(N*sizeof(float))) == NULL ){
			printf("memory allocation faillure for received_word in MIN-SUM...\n");
			exit(0);
		}

		/*if( (decoded_word =(char *) malloc(N*sizeof(char))) == NULL ){
			printf("memory allocation faillure for decode_word in MIN-SUM...\n");
			exit(0);
		}*/

		//reservation of memory space for LPi and LQi
		//-------------------------------------------
		if( (LQi =(float *) malloc(N*sizeof(float))) == NULL ){
			printf("memory allocation faillure for LQi in MIN-SUM...\n");
			exit(0);
		}

		if( (LPi =(float *) malloc(N*sizeof(float))) == NULL ){
			printf("Memory allocation faillure for LPi in MIN-SUM...\n");
			exit(0);
		}

	}else{
		printf("incorrect input file name ...\n");
		exit(0);
	}

	fclose(fp);


}//end initialize_MIN_SUM()

/*************************************************************************************************************/
/*																											 */
/*  F I N A L I Z E                																		     */		
/*                                 																			 */
/*																											 */
/*  Description: procedure that frees the memory that was allocated for the siumulation decoding procedure.  */
/*************************************************************************************************************/
void finalize_MIN_SUM(void)
{

	if(bitnode != NULL) free(bitnode);
	if(checknode != NULL) free(checknode);
	if(Lrji != NULL) free(Lrji);
	if(Lqij != NULL) free(Lqij);
	if(LPi != NULL) free(LPi);
	if(LQi != NULL) free(LQi);
	if(transmited_code_word != NULL) free(transmited_code_word);
	if(received_word != NULL) free(received_word);
	//if(decoded_word != NULL) free(decoded_word);	

} // end finalize_MIN_SUM()


/* >>>>>>>>>>>>>>>>>>>>>>>>> MIN SUM DECODING ALGORITHIMS IN LINEAR DOMAIN <<<<<<<<<<<<<<<<<<< */
/* ------------------------------------------------------------------------------------------- */













/*****************************************************************************************************************/
/*																												 */
/*  M I N - S U M    ( LOGARITHMIC SUM PRODUCT ALGORITHM )														 */		
/*																												 */
/*	Source: Implementation following the algorithm described in:												 */
/*																												 */
/*			Xiao-Yu, Evangelos Eleftheriou, Dieter-Michael Arnold and Ajay Dholakia, "Efficient Implementations  */
/*			of the Sum-Product Algorithm for Decoding LDPC Codes", in Proc. Globecom2001, San Antonio, Tx, USA,	 */
/*			pp 1036-1036E, 2001																					 */
/*																												 */
/*			Farhad Zarkeshvari, Amir H. Banihashemi, "On Implementation of Min-Sum Algorithm for Decoding Low    */
/*			Density Parity Check (LDPC) Codes", IEEE Globecom 2002, Taipei, Taiwan, November 17-21, 2002		 */
/*																												 */
/*			William Ryan, "An Introduction to Low-Density Parity Check Codes", Willian Ryan, University of		 */
/*			Aizona, April 2001																					 */
/*																												 */
/*																												 */
/*  NOTE: In the article it is defined:																			 */
/*							rji0			    qij0			   1 - Pi			  Qi0						 */
/*				Lrji = log ------	Lqij = log ------	LPi = log --------	LQi = log -----						 */
/*							rji1			    qij1			 	 Pi				  Qi1						 */
/*																												 */
/*																												 */
/*****************************************************************************************************************/
int MIN_SUM(int max_iter, char *valid_decoded_word){


	
	register int i, j, aux_int, num_iter=0;
	struct edge_check_to_bit *p;
	struct edge_bit_to_check *q;
	struct node_check *CN;
	struct node_bit *BN;	
	char true_codeword=0;
	float abs_LPi, aux_float;
	char sign_LPi;
	float abs_LQij;
	char sign_LQij;

	
  
  // Initialization of Check Node Structure
  //---------------------------------------
  for(j=0; j<M; j++){
	 checknode[j].abs_minimum = FLT_MAX;
	 checknode[j].abs_second_minimum = FLT_MAX;
	 checknode[j].sign = 1;
  }

  // Initialization - calculation of LPi
  //------------------------------------
  for (i=0; i<N ;i++){
	    
	  LPi[i] = universal_min_sum ? received_word[i] : received_word[i]*snr_rms;
	  
	  // make Lqij=LPi
	  //--------------
	  p=bitnode[i].first;	
	  abs_LPi= (float) fabs(LPi[i]);
	  
	  sign_LPi = LPi[i]<0 ? -1 : 1;

	  for (aux_int=0; aux_int<bitnode[i].degree; aux_int++){ 
		  
		  CN=&checknode[p->index];
		  p->pointer->sign=sign_LPi; 
		  
		  if(abs_LPi < CN->abs_minimum){

				CN->abs_second_minimum = CN->abs_minimum;
				CN->abs_minimum = abs_LPi;
				CN->index_of_minimum = i;				
		  
		  }else if(abs_LPi < CN->abs_second_minimum){
		  
				CN->abs_second_minimum = abs_LPi;
						  
		  }
		  CN->sign *= sign_LPi;
		  p++;
	  }
  }//end Initialization Step

  

  
  //while((!true_codeword)&&(num_iter < max_iter)){  
while(num_iter < max_iter){  



	// ------------------------------------    HORIZONTAL STEP
	// Calculation of Lrji
	//-------------------
	CN = checknode;
	for (j=0; j<M; j++, CN++){
		
		q = CN->first;
		aux_float = CN->abs_minimum * CN->sign / normalization_factor;
		
		for(i=0; i < CN->degree; i++, q++){		  
			
			q->pointer->value = (q->index != CN->index_of_minimum) ? aux_float * q->sign : CN->abs_second_minimum * CN->sign * q->sign / normalization_factor;
		}

		CN->abs_minimum=FLT_MAX;
		CN->abs_second_minimum=FLT_MAX;
		CN->sign=1;

	}// end horizontal step	  

	// ------------------------------------    VERTICAL STEP
	// Calculation of Lqij and LQi
	//----------------------------

	BN = bitnode;
	for (i=0; i<N; i++, BN++){
		
		p = BN->first;
			
		// Calculation of LQi
		//-------------------
		LQi[i] = LPi[i];
		for(aux_int=0; aux_int < BN->degree; aux_int++){
			LQi[i] += p->value;
			p++;
		}

		// Calculation of Lqij
		//--------------------
		p = BN->first;
		for(aux_int=0; aux_int < BN->degree; aux_int++){
			
			aux_float = LQi[i] - p->value;
			abs_LQij = (float) fabs(aux_float);
			
			sign_LQij = (aux_float<0) ? -1 : 1;
			
			CN=&checknode[p->index];
			p->pointer->sign=sign_LQij;
			
			if(abs_LQij < CN->abs_minimum){

				CN->abs_second_minimum = CN->abs_minimum;
				CN->abs_minimum = abs_LQij;
				CN->index_of_minimum = i;				
			
			}else if(abs_LQij < CN->abs_second_minimum){
			
				CN->abs_second_minimum = abs_LQij;				
			}
			p++;
			CN->sign *= sign_LQij;

		}
		
		decoded_word[i] = (LQi[i] < 0) ? 1 : 0; 

	} // end vertical step


	// Check if the decoded_word is a valid code_word
	//-----------------------------------------------
	/*true_codeword=1;
	for (j=0; (j<M) && true_codeword; j++){
		q=checknode[j].first;
		true_codeword=1;
		for(aux_int=0; aux_int<checknode[j].degree; aux_int++){
			true_codeword=(true_codeword + decoded_word[q->index]);
			q++;
		}
		true_codeword=true_codeword % 2;
	}*/

	num_iter+=1;



}// end while
 
 
  

*valid_decoded_word=true_codeword;
return num_iter;

}//end MIN_SUM()

/*double nth_root(double num, int n) {
    double x0, x1;
    double eps = 0.000000001;

	x0=(1/(double)n)*((double)n-1+num);
	x1=(1/(double)n)*(((double)(n-1))*x0+(num/pow_double(x0,n-1)));

    while ((x0-x1 > eps) || (-(x0-x1) > eps)){
        x0=x1;
		x1=(1/(double)n)*(((double)(n-1))*x0+(num/pow_double(x0,n-1)));
    }

    return x1;
}

double pow_double(double a, int x) {

	double b=1;
    for(int i=0; i<x; i++){
		b*=a;
	}

    return b;
}

int pow(int a, int x) {

	int b=1;
    for(int i=0; i<x; i++){
		b*=a;
	}

    return b;
}

double sqrt(double num) {
    double x = num;
    double y = 1.0;
    double eps = 0.000000001;

    while ((x - y > eps) || (-(x - y)) > eps) {
        x = (x + y) / 2;
        y = num / x;
    }

    return x;
}*/
