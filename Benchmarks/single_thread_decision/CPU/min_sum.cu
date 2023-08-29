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
#include <errno.h>
#include <helper_cuda.h>
#include <cuda_runtime.h>  

#define N 128
#define M 64
#define EDGES 512
#define MAX_ITER 5



__constant__ unsigned char d_LUT_VN[EDGES];
__constant__ unsigned char d_LUT_CN[EDGES];

__global__ void GPU_min_sum_sindrome(unsigned short * d_sindrome, unsigned char * d_LPi);
__global__ void GPU_min_sum_equations_and_decision(unsigned short * d_sindrome, unsigned char * d_LPi, unsigned char * d_wrong_equations, unsigned char * d_teta, unsigned char * d_bar);


struct timespec start, end;	



//**************************************************************************************************
//Kernel
__global__ void GPU_min_sum_sindrome(unsigned short * d_sindrome, unsigned char * d_LPi){

    //unsigned char x=threadIdx.x+blockIdx.x*blockDim.x;
    
	short k;
       
    k=threadIdx.x*8;
    unsigned short sum=0;
    for(int j=0; j<8;j++){ 
        sum=sum+d_LPi[d_LUT_CN[k+j]];
    }
    d_sindrome[threadIdx.x]=sum & 0x1;
    //printf("sum=%d\n", sum);
    //printf("sindrome[%d]=%d\n", i, sindrome[i]);  
        

} 

//**************************************************************************************************
//Kernel
__global__ void GPU_min_sum_equations_and_decision(unsigned short * d_sindrome, unsigned char * d_LPi, unsigned char * d_wrong_equations, unsigned char * d_teta, unsigned char * d_bar){

    //unsigned char x=threadIdx.x+blockIdx.x*blockDim.x;
    
	short k;
        
    if(threadIdx.x<64){
        k=threadIdx.x*5;
        
        unsigned short sum=0;
        for(int j=0; j<5;j++){ 
            sum=sum+d_sindrome[d_LUT_VN[k+j]];
        }
        d_wrong_equations[threadIdx.x]=sum;
    }

    if(threadIdx.x>63){
        k=5*63+threadIdx.x*3;

        unsigned short sum=0;
        for(int j=0; j<3;j++){ 
            sum=sum+d_sindrome[d_LUT_VN[k+j]];
        }
        d_wrong_equations[threadIdx.x]=sum;
    }
    __syncthreads();

    
    if(d_wrong_equations[threadIdx.x]>=d_bar[0]){
        if(d_LPi[threadIdx.x]==0){
            d_LPi[threadIdx.x]=1;
        }
        else{
            d_LPi[threadIdx.x]=0;
        }
        d_teta[0]=0;
        
    }
    //printf("sindrome[%d]=%d\n", i, L[i]);

} 


/*************************************************************************************************************/
/*																											 */
/*  M A I N   P R O G R A M																					 */		
/*																											 */
/*************************************************************************************************************/
int  main(){

    unsigned char LUT_VN[EDGES]={0,9,26,44,48,1,10,27,45,49,2,11,28,46,50,3,12,29,47,51,4,13,30,32,52,5,14,31,33,53,6,15,16,34,54,0,7,17,35,55,1,8,18,36,56,2,9,19,37,57,3,10,20,38,58,4,11,21,39,59,5,12,22,40,60,6,13,23,41,61,7,14,24,42,62,8,15,25,43,63,14,16,17,47,63,15,17,18,32,48,0,18,19,33,49,1,19,20,34,50,2,20,21,35,51,3,21,22,36,52,4,22,23,37,53,5,23,24,38,54,6,24,25,39,55,7,25,26,40,56,8,26,27,41,57,9,27,28,42,58,10,28,29,43,59,11,29,30,44,60,12,30,31,45,61,13,16,31,46,62,2,16,32,33,55,3,17,33,34,56,4,18,34,35,57,5,19,35,36,58,6,20,36,37,59,7,21,37,38,60,8,22,38,39,61,9,23,39,40,62,10,24,40,41,63,11,25,41,42,48,12,26,42,43,49,13,27,43,44,50,14,28,44,45,51,15,29,45,46,52,0,30,46,47,53,1,31,32,47,54,10,31,34,48,51,11,16,35,49,52,12,17,36,50,53,13,18,37,51,54,14,19,38,52,55,15,20,39,53,56,0,21,40,54,57,1,22,41,55,58,2,23,42,56,59,3,24,43,57,60,4,25,44,58,61,5,26,45,59,62,6,27,46,60,63,7,28,47,48,61,8,29,32,49,62,9,30,33,50,63,16,37,50,17,38,51,18,39,52,19,40,53,20,41,54,21,42,55,22,43,56,23,44,57,24,45,58,25,46,59,26,47,60,27,32,61,28,33,62,29,34,63,30,35,48,31,36,49,0,32,63,1,33,48,2,34,49,3,35,50,4,36,51,5,37,52,6,38,53,7,39,54,8,40,55,9,41,56,10,42,57,11,43,58,12,44,59,13,45,60,14,46,61,15,47,62,3,16,48,4,17,49,5,18,50,6,19,51,7,20,52,8,21,53,9,22,54,10,23,55,11,24,56,12,25,57,13,26,58,14,27,59,15,28,60,0,29,61,1,30,62,2,31,63,0,25,45,1,26,46,2,27,47,3,28,32,4,29,33,5,30,34,6,31,35,7,16,36,8,17,37,9,18,38,10,19,39,11,20,40,12,21,41,13,22,42,14,23,43,15,24,44};
    unsigned char LUT_CN[EDGES]={0,7,18,46,54,80,109,112,1,8,19,47,55,81,110,113,2,9,20,32,56,82,111,114,3,10,21,33,57,83,96,115,4,11,22,34,58,84,97,116,5,12,23,35,59,85,98,117,6,13,24,36,60,86,99,118,7,14,25,37,61,87,100,119,8,15,26,38,62,88,101,120,0,9,27,39,63,89,102,121,1,10,28,40,48,90,103,122,2,11,29,41,49,91,104,123,3,12,30,42,50,92,105,124,4,13,31,43,51,93,106,125,5,14,16,44,52,94,107,126,6,15,17,45,53,95,108,127,6,16,31,32,49,64,96,119,7,16,17,33,50,65,97,120,8,17,18,34,51,66,98,121,9,18,19,35,52,67,99,122,10,19,20,36,53,68,100,123,11,20,21,37,54,69,101,124,12,21,22,38,55,70,102,125,13,22,23,39,56,71,103,126,14,23,24,40,57,72,104,127,15,24,25,41,58,73,105,112,0,25,26,42,59,74,106,113,1,26,27,43,60,75,107,114,2,27,28,44,61,76,108,115,3,28,29,45,62,77,109,116,4,29,30,46,63,78,110,117,5,30,31,47,48,79,111,118,4,17,32,47,62,75,80,115,5,18,32,33,63,76,81,116,6,19,33,34,48,77,82,117,7,20,34,35,49,78,83,118,8,21,35,36,50,79,84,119,9,22,36,37,51,64,85,120,10,23,37,38,52,65,86,121,11,24,38,39,53,66,87,122,12,25,39,40,54,67,88,123,13,26,40,41,55,68,89,124,14,27,41,42,56,69,90,125,15,28,42,43,57,70,91,126,0,29,43,44,58,71,92,127,1,30,44,45,59,72,93,112,2,31,45,46,60,73,94,113,3,16,46,47,61,74,95,114,0,17,41,48,61,78,81,96,1,18,42,49,62,79,82,97,2,19,43,50,63,64,83,98,3,20,44,48,51,65,84,99,4,21,45,49,52,66,85,100,5,22,46,50,53,67,86,101,6,23,47,51,54,68,87,102,7,24,32,52,55,69,88,103,8,25,33,53,56,70,89,104,9,26,34,54,57,71,90,105,10,27,35,55,58,72,91,106,11,28,36,56,59,73,92,107,12,29,37,57,60,74,93,108,13,30,38,58,61,75,94,109,14,31,39,59,62,76,95,110,15,16,40,60,63,77,80,111};


    cudaError_t err=cudaSuccess; 

    //======================================================================================================================================================================
    //kernel dimensions
    dim3 numBlocks(1,1,1);
    dim3 threadsPerBlock_sindrome(64,1,1);
    dim3 threadsPerBlock_equations_and_decision(128,1,1);

    //======================================================================================================================================================================
    //size of variables

    /* size_t size_local_sum=sizeof(unsigned int)*input_params.x_size*input_params.y_size*input_params.z_size;
    size_t size_scaled_predicted=sizeof(signed int)*input_params.x_size*input_params.y_size*input_params.z_size;
    size_t size_omega=sizeof(unsigned short)*input_params.x_size*input_params.y_size*input_params.z_size;
    size_t size_samples=(sizeof(unsigned short int)*input_params.x_size*input_params.y_size*input_params.z_size);
    size_t size_sign_scaled=(sizeof(unsigned short int)*input_params.x_size*input_params.y_size*input_params.z_size); */
    size_t size_LPi=(sizeof(unsigned char)*N); 
    size_t size_LUT=(sizeof(unsigned char)*EDGES); 
    size_t size_sindrome=(sizeof(unsigned short)*M); 
    size_t size_char=(sizeof(unsigned char)); 

    //==================================================================================================================LPi====================================================
    //variables declaration

    unsigned char *h_LPi=NULL;
    unsigned char *h_decoded_word=NULL;
    unsigned short *d_sindrome=NULL;
    unsigned char *d_wrong_equations=NULL;
    unsigned char *d_LPi=NULL;
    unsigned char *h_bar=NULL;
    unsigned char *h_teta=NULL;
    unsigned char *d_bar=NULL;
    unsigned char *d_teta=NULL;


    //======================================================================================================================================================================
    //allocate host memory

    err=cudaHostAlloc((void **)&h_LPi, size_LPi, cudaHostAllocDefault );
    if(err!=cudaSuccess){
        fprintf(stderr, "Failed to allocate host LPi(error code %d)!\n", cudaGetLastError());
        exit(EXIT_FAILURE);
    }

    err=cudaHostAlloc((void **)&h_decoded_word, size_LPi, cudaHostAllocDefault );
    if(err!=cudaSuccess){
        fprintf(stderr, "Failed to allocate host decoded_word(error code %d)!\n", cudaGetLastError());
        exit(EXIT_FAILURE);
    }

    err=cudaHostAlloc((void **)&h_bar, size_char, cudaHostAllocDefault );
    if(err!=cudaSuccess){
        fprintf(stderr, "Failed to allocate host h_bar(error code %d)!\n", cudaGetLastError());
        exit(EXIT_FAILURE);
    }

    err=cudaHostAlloc((void **)&h_teta, size_char, cudaHostAllocDefault );
    if(err!=cudaSuccess){
        fprintf(stderr, "Failed to allocate host decoded_word(error code %d)!\n", cudaGetLastError());
        exit(EXIT_FAILURE);
    }

    //======================================================================================================================================================================
    //Initialize host memory
    h_teta[0]=0;
    h_bar[0]=5;


    {
        h_LPi[0]=1;
        h_LPi[1]=0;
        h_LPi[2]=1;
        h_LPi[3]=1;
        h_LPi[4]=0;
        h_LPi[5]=0;
        h_LPi[6]=1;
        h_LPi[7]=1;
        h_LPi[8]=0;
        h_LPi[9]=0;
        h_LPi[10]=1;
        h_LPi[11]=0;
        h_LPi[12]=0;
        h_LPi[13]=1;
        h_LPi[14]=1;
        h_LPi[15]=0;
        h_LPi[16]=0;
        h_LPi[17]=0;
        h_LPi[18]=1;
        h_LPi[19]=0;
        h_LPi[20]=0;
        h_LPi[21]=1;
        h_LPi[22]=0;
        h_LPi[23]=0;
        h_LPi[24]=0;
        h_LPi[25]=1;
        h_LPi[26]=1;
        h_LPi[27]=1;
        h_LPi[28]=0;
        h_LPi[29]=0;
        h_LPi[30]=0;
        h_LPi[31]=1;
        h_LPi[32]=0;
        h_LPi[33]=0;
        h_LPi[34]=0;
        h_LPi[35]=0;
        h_LPi[36]=0;
        h_LPi[37]=1;
        h_LPi[38]=0;
        h_LPi[39]=0;
        h_LPi[40]=1;
        h_LPi[41]=1;
        h_LPi[42]=0;
        h_LPi[43]=0;
        h_LPi[44]=0;
        h_LPi[45]=0;
        h_LPi[46]=0;
        h_LPi[47]=0;
        h_LPi[48]=1;
        h_LPi[49]=1;
        h_LPi[50]=1;
        h_LPi[51]=0;
        h_LPi[52]=1;
        h_LPi[53]=1;
        h_LPi[54]=1;
        h_LPi[55]=0;
        h_LPi[56]=1;
        h_LPi[57]=0;
        h_LPi[58]=0;
        h_LPi[59]=0;
        h_LPi[60]=0;
        h_LPi[61]=1;
        h_LPi[62]=1;
        h_LPi[63]=0;
        h_LPi[64]=0;
        h_LPi[65]=0;
        h_LPi[66]=0;
        h_LPi[67]=0;
        h_LPi[68]=0;
        h_LPi[69]=0;
        h_LPi[70]=0;
        h_LPi[71]=1;
        h_LPi[72]=0;
        h_LPi[73]=0;
        h_LPi[74]=1;
        h_LPi[75]=0;
        h_LPi[76]=0;
        h_LPi[77]=0;
        h_LPi[78]=1;
        h_LPi[79]=0;
        h_LPi[80]=0;
        h_LPi[81]=0;
        h_LPi[82]=1;
        h_LPi[83]=0;
        h_LPi[84]=0;
        h_LPi[85]=0;
        h_LPi[86]=0;
        h_LPi[87]=1;
        h_LPi[88]=1;
        h_LPi[89]=1;
        h_LPi[90]=1;
        h_LPi[91]=1;
        h_LPi[92]=1;
        h_LPi[93]=1;
        h_LPi[94]=0;
        h_LPi[95]=0;
        h_LPi[96]=0;
        h_LPi[97]=0;
        h_LPi[98]=0;
        h_LPi[99]=0;
        h_LPi[100]=0;
        h_LPi[101]=0;
        h_LPi[102]=0;
        h_LPi[103]=1;
        h_LPi[104]=0;
        h_LPi[105]=0;
        h_LPi[106]=0;
        h_LPi[107]=0;
        h_LPi[108]=0;
        h_LPi[109]=1;
        h_LPi[110]=0;
        h_LPi[111]=0;
        h_LPi[112]=1;
        h_LPi[113]=1;
        h_LPi[114]=1;
        h_LPi[115]=0;
        h_LPi[116]=0;
        h_LPi[117]=0;
        h_LPi[118]=1;
        h_LPi[119]=1;
        h_LPi[120]=0;
        h_LPi[121]=0;
        h_LPi[122]=0;
        h_LPi[123]=0;
        h_LPi[124]=1;
        h_LPi[125]=0;
        h_LPi[126]=0;
        h_LPi[127]=1;
    }

    //======================================================================================================================================================================
    //allocate device memory

    err=cudaMalloc((void **)&d_sindrome, size_sindrome);
    if(err!=cudaSuccess){
        fprintf(stderr, "Failed to allocate device d_sindrome (error code %d)!\n", cudaGetLastError());
        exit(EXIT_FAILURE);
    }

    err=cudaMemset(d_sindrome, 0, size_sindrome);
    if(err!=cudaSuccess){
        fprintf(stderr, "Failed to set device d_sindrome (error code %d)!\n", cudaGetLastError());
        exit(EXIT_FAILURE);
    }

    err=cudaMalloc((void **)&d_LPi, size_LPi);
    if(err!=cudaSuccess){
        fprintf(stderr, "Failed to allocate device d_LPi (error code %d)!\n", cudaGetLastError());
        exit(EXIT_FAILURE);
    }

    err=cudaMalloc((void **)&d_wrong_equations, size_LPi);
    if(err!=cudaSuccess){
        fprintf(stderr, "Failed to allocate device d_wrong_equations (error code %d)!\n", cudaGetLastError());
        exit(EXIT_FAILURE);
    }

    err=cudaMalloc((void **)&d_teta, size_char);
    if(err!=cudaSuccess){
        fprintf(stderr, "Failed to allocate device teta (error code %d)!\n", cudaGetLastError());
        exit(EXIT_FAILURE);
    }

    err=cudaMalloc((void **)&d_bar, size_char);
    if(err!=cudaSuccess){
        fprintf(stderr, "Failed to allocate device bar (error code %d)!\n", cudaGetLastError());
        exit(EXIT_FAILURE);
    }



    //======================================================================================================================================================================
    //copy data to device

    clock_gettime(CLOCK_MONOTONIC, &start);
      
    err=cudaMemcpy(d_LPi, h_LPi, size_LPi, cudaMemcpyHostToDevice);
    if(err!=cudaSuccess){
        fprintf(stderr, "Failed to copy the LPi from host to device (error code %d)!\n", cudaGetLastError());
        exit(EXIT_FAILURE);
    }

    err=cudaMemcpyToSymbol(d_LUT_VN, &LUT_VN, size_LUT);
    if(err!=cudaSuccess){
        fprintf(stderr, "Failed to copy LUT_VN from host to constant (error code %d)!\n", cudaGetLastError());
        exit(EXIT_FAILURE);
    }

    err=cudaMemcpyToSymbol(d_LUT_CN, &LUT_CN, size_LUT);
    if(err!=cudaSuccess){
        fprintf(stderr, "Failed to copy LUT_CN from host to constant (error code %d)!\n", cudaGetLastError());
        exit(EXIT_FAILURE);
    }

    err=cudaMemcpy(d_bar, h_bar, size_char, cudaMemcpyHostToDevice);
    if(err!=cudaSuccess){
        fprintf(stderr, "Failed to copy bar from host to device (error code %d)!\n", cudaGetLastError());
        exit(EXIT_FAILURE);
    }

    err=cudaMemcpy(d_teta, h_teta, size_char, cudaMemcpyHostToDevice);
    if(err!=cudaSuccess){
        fprintf(stderr, "Failed to copy teta from host to device (error code %d)!\n", cudaGetLastError());
        exit(EXIT_FAILURE);
    }

    //======================================================================================================================================================================
    //execute the kernel
    for(int num_iter=0; num_iter<MAX_ITER;num_iter++){

        err=cudaMemcpy(h_teta , d_teta, size_char, cudaMemcpyDeviceToHost);
        if(err!=cudaSuccess){
            fprintf(stderr, "Failed to copy the d_teta from device to host (error code %d)!\n", cudaGetLastError());
            exit(EXIT_FAILURE);
        } 

        err=cudaMemcpy(h_bar , d_bar, size_char, cudaMemcpyDeviceToHost);
        if(err!=cudaSuccess){
            fprintf(stderr, "Failed to copy the bar from device to host (error code %d)!\n", cudaGetLastError());
            exit(EXIT_FAILURE);
        } 

        if(h_teta[0] && h_bar[0] > 1){

            h_bar[0] = h_bar[0] - 1;
        }
        h_teta[0]=1;

        err=cudaMemcpy(d_bar, h_bar, size_char, cudaMemcpyHostToDevice);
        if(err!=cudaSuccess){
            fprintf(stderr, "Failed to copy bar from host to device (error code %d)!\n", cudaGetLastError());
            exit(EXIT_FAILURE);
        }

        err=cudaMemcpy(d_teta, h_teta, size_char, cudaMemcpyHostToDevice);
        if(err!=cudaSuccess){
            fprintf(stderr, "Failed to copy teta from host to device (error code %d)!\n", cudaGetLastError());
            exit(EXIT_FAILURE);
        }
    
        

        GPU_min_sum_sindrome<<<numBlocks, threadsPerBlock_sindrome>>>(d_sindrome, d_LPi);
        if(err!=cudaSuccess){
            fprintf(stderr, "Failed to launch sindrome kernel (error code %d)!\n", cudaGetLastError());
            exit(EXIT_FAILURE);
        }

        GPU_min_sum_equations_and_decision<<<numBlocks, threadsPerBlock_equations_and_decision>>>(d_sindrome, d_LPi, d_wrong_equations, d_teta, d_bar);
        if(err!=cudaSuccess){
            fprintf(stderr, "Failed to launch equations_and_decision kernel (error code %d)!\n", cudaGetLastError());
            exit(EXIT_FAILURE);
        }
    }
    //======================================================================================================================================================================
    //copy the data from device to host
    err=cudaMemcpy(h_decoded_word , d_LPi, size_LPi, cudaMemcpyDeviceToHost);
    if(err!=cudaSuccess){
        fprintf(stderr, "Failed to copy the decoded_word from device to host (error code %d)!\n", cudaGetLastError());
        exit(EXIT_FAILURE);
    } 

    clock_gettime(CLOCK_MONOTONIC, &end);
    

    //======================================================================================================================================================================
    //free the device memory

    err=cudaFree(d_LPi);
    if(err!=cudaSuccess){
        fprintf(stderr, "Failed to free the d_LPi from the device (error code %d)!\n", cudaGetLastError());
        exit(EXIT_FAILURE);
    }

    err=cudaFree(d_sindrome);
    if(err!=cudaSuccess){
        fprintf(stderr, "Failed to free the d_sindrome from the device (error code %d)!\n", cudaGetLastError());
        exit(EXIT_FAILURE);
    }

    err=cudaFree(d_wrong_equations);
    if(err!=cudaSuccess){
        fprintf(stderr, "Failed to free the d_wrong_equations from the device (error code %d)!\n", cudaGetLastError());
        exit(EXIT_FAILURE);
    }

    err=cudaFree(d_teta);
    if(err!=cudaSuccess){
        fprintf(stderr, "Failed to free the d_teta from the device (error code %d)!\n", cudaGetLastError());
        exit(EXIT_FAILURE);
    }

    err=cudaFree(d_bar);
    if(err!=cudaSuccess){
        fprintf(stderr, "Failed to free the d_bar from the device (error code %d)!\n", cudaGetLastError());
        exit(EXIT_FAILURE);
    }
    

    //======================================================================================================================================================================
    //Print Results
    printf("Execution time=%lfms\n",(end.tv_sec-start.tv_sec)*1e3+(end.tv_nsec-start.tv_nsec)*1e-6);

    for (int i=0; i<128 ;i++){
        printf("%d\n",  h_decoded_word[i] );
    } 


    //======================================================================================================================================================================
    //free the host memory

    err=cudaFreeHost(h_LPi);
    if(err!=cudaSuccess){
        fprintf(stderr, "Failed to free the h_LPi from the host (error code %d)!\n", cudaGetLastError());
        exit(EXIT_FAILURE);
    }

    err=cudaFreeHost(h_decoded_word);
    if(err!=cudaSuccess){
        fprintf(stderr, "Failed to free the h_decoded_word from the host (error code %d)!\n", cudaGetLastError());
        exit(EXIT_FAILURE);
    }

    err=cudaFreeHost(h_teta);
    if(err!=cudaSuccess){
        fprintf(stderr, "Failed to free the h_teta from the host (error code %d)!\n", cudaGetLastError());
        exit(EXIT_FAILURE);
    }

    err=cudaFreeHost(h_bar);
    if(err!=cudaSuccess){
        fprintf(stderr, "Failed to free the h_bar from the host (error code %d)!\n", cudaGetLastError());
        exit(EXIT_FAILURE);
    }

    
		
   return 0;


} 


