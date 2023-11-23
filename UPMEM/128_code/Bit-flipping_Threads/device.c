#include <stdio.h>
#include <stdlib.h>
#include <mram.h>
#include <perfcounter.h>
#include <limits.h>
#include <defs.h>
#include <barrier.h>

#include "types_min_sum.h"

#define N 256
#define M 128
#define EDGES 1024

#define CN_PER_THREADS M/NR_TASKLETS
#define VN_PER_THREADS N/NR_TASKLETS

BARRIER_INIT(my_barrier, NR_TASKLETS);

__dma_aligned unsigned char LUT_VN[EDGES]={0,1,36,88,110,1,2,37,89,111,2,3,38,90,112,3,4,39,91,113,4,5,40,92,114,5,6,41,93,115,6,7,42,94,116,7,8,43,95,117,8,9,44,64,118,9,10,45,65,119,10,11,46,66,120,11,12,47,67,121,12,13,48,68,122,13,14,49,69,123,14,15,50,70,124,15,16,51,71,125,16,17,52,72,126,17,18,53,73,127,18,19,54,74,96,19,20,55,75,97,20,21,56,76,98,21,22,57,77,99,22,23,58,78,100,23,24,59,79,101,24,25,60,80,102,25,26,61,81,103,26,27,62,82,104,27,28,63,83,105,28,29,32,84,106,29,30,33,85,107,30,31,34,86,108,0,31,35,87,109,17,32,34,64,98,18,33,35,65,99,19,34,36,66,100,20,35,37,67,101,21,36,38,68,102,22,37,39,69,103,23,38,40,70,104,24,39,41,71,105,25,40,42,72,106,26,41,43,73,107,27,42,44,74,108,28,43,45,75,109,29,44,46,76,110,30,45,47,77,111,31,46,48,78,112,0,47,49,79,113,1,48,50,80,114,2,49,51,81,115,3,50,52,82,116,4,51,53,83,117,5,52,54,84,118,6,53,55,85,119,7,54,56,86,120,8,55,57,87,121,9,56,58,88,122,10,57,59,89,123,11,58,60,90,124,12,59,61,91,125,13,60,62,92,126,14,61,63,93,127,15,32,62,94,96,16,33,63,95,97,7,35,64,68,96,8,36,65,69,97,9,37,66,70,98,10,38,67,71,99,11,39,68,72,100,12,40,69,73,101,13,41,70,74,102,14,42,71,75,103,15,43,72,76,104,16,44,73,77,105,17,45,74,78,106,18,46,75,79,107,19,47,76,80,108,20,48,77,81,109,21,49,78,82,110,22,50,79,83,111,23,51,80,84,112,24,52,81,85,113,25,53,82,86,114,26,54,83,87,115,27,55,84,88,116,28,56,85,89,117,29,57,86,90,118,30,58,87,91,119,31,59,88,92,120,0,60,89,93,121,1,61,90,94,122,2,62,91,95,123,3,63,64,92,124,4,32,65,93,125,5,33,66,94,126,6,34,67,95,127,0,40,95,96,98,1,41,64,97,99,2,42,65,98,100,3,43,66,99,101,4,44,67,100,102,5,45,68,101,103,6,46,69,102,104,7,47,70,103,105,8,48,71,104,106,9,49,72,105,107,10,50,73,106,108,11,51,74,107,109,12,52,75,108,110,13,53,76,109,111,14,54,77,110,112,15,55,78,111,113,16,56,79,112,114,17,57,80,113,115,18,58,81,114,116,19,59,82,115,117,20,60,83,116,118,21,61,84,117,119,22,62,85,118,120,23,63,86,119,121,24,32,87,120,122,25,33,88,121,123,26,34,89,122,124,27,35,90,123,125,28,36,91,124,126,29,37,92,125,127,30,38,93,96,126,31,39,94,97,127,32,67,103,33,68,104,34,69,105,35,70,106,36,71,107,37,72,108,38,73,109,39,74,110,40,75,111,41,76,112,42,77,113,43,78,114,44,79,115,45,80,116,46,81,117,47,82,118,48,83,119,49,84,120,50,85,121,51,86,122,52,87,123,53,88,124,54,89,125,55,90,126,56,91,127,57,92,96,58,93,97,59,94,98,60,95,99,61,64,100,62,65,101,63,66,102,12,64,102,13,65,103,14,66,104,15,67,105,16,68,106,17,69,107,18,70,108,19,71,109,20,72,110,21,73,111,22,74,112,23,75,113,24,76,114,25,77,115,26,78,116,27,79,117,28,80,118,29,81,119,30,82,120,31,83,121,0,84,122,1,85,123,2,86,124,3,87,125,4,88,126,5,89,127,6,90,96,7,91,97,8,92,98,9,93,99,10,94,100,11,95,101,20,63,96,21,32,97,22,33,98,23,34,99,24,35,100,25,36,101,26,37,102,27,38,103,28,39,104,29,40,105,30,41,106,31,42,107,0,43,108,1,44,109,2,45,110,3,46,111,4,47,112,5,48,113,6,49,114,7,50,115,8,51,116,9,52,117,10,53,118,11,54,119,12,55,120,13,56,121,14,57,122,15,58,123,16,59,124,17,60,125,18,61,126,19,62,127,0,44,75,1,45,76,2,46,77,3,47,78,4,48,79,5,49,80,6,50,81,7,51,82,8,52,83,9,53,84,10,54,85,11,55,86,12,56,87,13,57,88,14,58,89,15,59,90,16,60,91,17,61,92,18,62,93,19,63,94,20,32,95,21,33,64,22,34,65,23,35,66,24,36,67,25,37,68,26,38,69,27,39,70,28,40,71,29,41,72,30,42,73,31,43,74};
__dma_aligned unsigned char LUT_CN[EDGES]={0,31,47,89,96,180,204,224,0,1,48,90,97,181,205,225,1,2,49,91,98,182,206,226,2,3,50,92,99,183,207,227,3,4,51,93,100,184,208,228,4,5,52,94,101,185,209,229,5,6,53,95,102,186,210,230,6,7,54,64,103,187,211,231,7,8,55,65,104,188,212,232,8,9,56,66,105,189,213,233,9,10,57,67,106,190,214,234,10,11,58,68,107,191,215,235,11,12,59,69,108,160,216,236,12,13,60,70,109,161,217,237,13,14,61,71,110,162,218,238,14,15,62,72,111,163,219,239,15,16,63,73,112,164,220,240,16,17,32,74,113,165,221,241,17,18,33,75,114,166,222,242,18,19,34,76,115,167,223,243,19,20,35,77,116,168,192,244,20,21,36,78,117,169,193,245,21,22,37,79,118,170,194,246,22,23,38,80,119,171,195,247,23,24,39,81,120,172,196,248,24,25,40,82,121,173,197,249,25,26,41,83,122,174,198,250,26,27,42,84,123,175,199,251,27,28,43,85,124,176,200,252,28,29,44,86,125,177,201,253,29,30,45,87,126,178,202,254,30,31,46,88,127,179,203,255,28,32,62,93,120,128,193,244,29,33,63,94,121,129,194,245,30,32,34,95,122,130,195,246,31,33,35,64,123,131,196,247,0,34,36,65,124,132,197,248,1,35,37,66,125,133,198,249,2,36,38,67,126,134,199,250,3,37,39,68,127,135,200,251,4,38,40,69,96,136,201,252,5,39,41,70,97,137,202,253,6,40,42,71,98,138,203,254,7,41,43,72,99,139,204,255,8,42,44,73,100,140,205,224,9,43,45,74,101,141,206,225,10,44,46,75,102,142,207,226,11,45,47,76,103,143,208,227,12,46,48,77,104,144,209,228,13,47,49,78,105,145,210,229,14,48,50,79,106,146,211,230,15,49,51,80,107,147,212,231,16,50,52,81,108,148,213,232,17,51,53,82,109,149,214,233,18,52,54,83,110,150,215,234,19,53,55,84,111,151,216,235,20,54,56,85,112,152,217,236,21,55,57,86,113,153,218,237,22,56,58,87,114,154,219,238,23,57,59,88,115,155,220,239,24,58,60,89,116,156,221,240,25,59,61,90,117,157,222,241,26,60,62,91,118,158,223,242,27,61,63,92,119,159,192,243,8,32,64,92,97,157,160,245,9,33,65,93,98,158,161,246,10,34,66,94,99,159,162,247,11,35,67,95,100,128,163,248,12,36,64,68,101,129,164,249,13,37,65,69,102,130,165,250,14,38,66,70,103,131,166,251,15,39,67,71,104,132,167,252,16,40,68,72,105,133,168,253,17,41,69,73,106,134,169,254,18,42,70,74,107,135,170,255,19,43,71,75,108,136,171,224,20,44,72,76,109,137,172,225,21,45,73,77,110,138,173,226,22,46,74,78,111,139,174,227,23,47,75,79,112,140,175,228,24,48,76,80,113,141,176,229,25,49,77,81,114,142,177,230,26,50,78,82,115,143,178,231,27,51,79,83,116,144,179,232,28,52,80,84,117,145,180,233,29,53,81,85,118,146,181,234,30,54,82,86,119,147,182,235,31,55,83,87,120,148,183,236,0,56,84,88,121,149,184,237,1,57,85,89,122,150,185,238,2,58,86,90,123,151,186,239,3,59,87,91,124,152,187,240,4,60,88,92,125,153,188,241,5,61,89,93,126,154,189,242,6,62,90,94,127,155,190,243,7,63,91,95,96,156,191,244,18,62,64,96,126,153,186,192,19,63,65,97,127,154,187,193,20,32,66,96,98,155,188,194,21,33,67,97,99,156,189,195,22,34,68,98,100,157,190,196,23,35,69,99,101,158,191,197,24,36,70,100,102,159,160,198,25,37,71,101,103,128,161,199,26,38,72,102,104,129,162,200,27,39,73,103,105,130,163,201,28,40,74,104,106,131,164,202,29,41,75,105,107,132,165,203,30,42,76,106,108,133,166,204,31,43,77,107,109,134,167,205,0,44,78,108,110,135,168,206,1,45,79,109,111,136,169,207,2,46,80,110,112,137,170,208,3,47,81,111,113,138,171,209,4,48,82,112,114,139,172,210,5,49,83,113,115,140,173,211,6,50,84,114,116,141,174,212,7,51,85,115,117,142,175,213,8,52,86,116,118,143,176,214,9,53,87,117,119,144,177,215,10,54,88,118,120,145,178,216,11,55,89,119,121,146,179,217,12,56,90,120,122,147,180,218,13,57,91,121,123,148,181,219,14,58,92,122,124,149,182,220,15,59,93,123,125,150,183,221,16,60,94,124,126,151,184,222,17,61,95,125,127,152,185,223};
__dma_aligned short sindrome[M]={0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0};
__host char  L[N];
__host uint32_t nb_cycles;
__dma_aligned char wrong_equations[N];




char bar=5;
char teta=0;

int main(){

	perfcounter_config(COUNT_CYCLES, true);

	char max_iter=5;
	char true_codeword=0;
	char num_iter;
	short k;


	for(num_iter=0; num_iter<max_iter;num_iter++){ 
		
		if(me()==0 && teta && bar > 1){

			bar = bar - 1;
		}
	
		barrier_wait(&my_barrier);
		teta=1;
		
		//k=0;
		k=CN_PER_THREADS*me()*8;
		for(int i=CN_PER_THREADS*me(); i<CN_PER_THREADS+(CN_PER_THREADS*me());i++){ 
			short sum=0;
			for(int j=0; j<8;j++){ 
				sum=sum+L[LUT_CN[k+j]];
			}
			sindrome[i]=sum & 0x1;
			k=k+8;
			//printf("sum=%d\n", sum);
			//printf("sindrome[%d]=%d\n", i, sindrome[i]);
		}
		barrier_wait(&my_barrier);

		/* if(me()==0 && num_iter==1){
			for(int i=0; i<M;i++){ 
				printf("%d\n", sindrome[i]);
			}
		}
		barrier_wait(&my_barrier);  */
		

		//k=0;
		k=CN_PER_THREADS*me()*5;
		for(int i=CN_PER_THREADS*me(); i<CN_PER_THREADS+(CN_PER_THREADS*me());i++){ 
			short sum=0;
			for(int j=0; j<5;j++){ 
				sum=sum+sindrome[LUT_VN[k+j]];

			}
			wrong_equations[i]=sum;
			k=k+5;
			
		}
		barrier_wait(&my_barrier);

		k=(M*5)+CN_PER_THREADS*me()*3;
		for(int i=M+(CN_PER_THREADS*me()); i<M+CN_PER_THREADS+(CN_PER_THREADS*me());i++){ 
			short sum=0;
			for(int j=0; j<3;j++){ 
				sum=sum+sindrome[LUT_VN[k+j]];
			}
			wrong_equations[i]=sum;
			k=k+3;
			
		}
		barrier_wait(&my_barrier);

		/* if(me()==0 && num_iter==1){
			for(int i=0; i<N;i++){ 
				printf("%d\n", wrong_equations[i]);
			}
		}
		barrier_wait(&my_barrier);  */

		for(int i=VN_PER_THREADS*me(); i<VN_PER_THREADS+(VN_PER_THREADS*me());i++){ 
			
			if(wrong_equations[i]>=bar){
				if(L[i]==0){
					L[i]=1;
				}
				else{
					L[i]=0;
				}
				teta=false;
				
			}
			//printf("sindrome[%d]=%d\n", i, L[i]);
		}
		barrier_wait(&my_barrier);

		/* if(me()==0 && num_iter==4){
			for(int i=0; i<N;i++){ 
				printf("%d\n", L[i]);
			}
		}
		barrier_wait(&my_barrier); */  
	}

	nb_cycles = perfcounter_get();
	return 1;

}//end MIN_SUM()

