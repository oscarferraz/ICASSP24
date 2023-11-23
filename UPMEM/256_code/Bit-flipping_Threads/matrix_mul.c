#include <alloc.h>
#include <mram.h>
#include <stdint.h>
#include <perfcounter.h>

#define SIZE 22
/*__mram uint32_t  mram_array1[SIZE][SIZE];
__mram uint32_t  mram_array2[SIZE][SIZE];

__dma_aligned uint32_t  wram_array1[SIZE][SIZE];
__dma_aligned uint32_t  wram_array2[SIZE][SIZE];

__host uint32_t nb_cycles;

uint32_t output[SIZE][SIZE];
uint32_t temp=0;

int main() {

  for (int i = 0; i < SIZE; ++i) {
    for (int j = 0; j < SIZE; ++j) {
        mram_array1[i][j] = 2;
        mram_array2[i][j] = 6;
    }
  }
  perfcounter_config(COUNT_INSTRUCTIONS, true);
  mram_read(mram_array1, wram_array1, sizeof(wram_array1));
  mram_read(mram_array2, wram_array2, sizeof(wram_array2));

  for (int i = 0; i < SIZE; ++i) {
    for (int j = 0; j < SIZE; ++j) {
        for (int k = 0; k < SIZE; ++k) {
            temp += wram_array1[i][k]*wram_array2[k][j];
        }
        output[i][j]=temp;
        temp=0;
    }
  }
  nb_cycles = perfcounter_get();

    for (int i = SIZE-5; i < SIZE; ++i) {
        for (int j = SIZE-5; j < SIZE; ++j) {
            printf("output[%d][%d]=%d\n", i, j,  output[i][j]);
        }
    }


  return 0;
}*/

__mram uint32_t  mram_array1[SIZE][SIZE];
__mram uint32_t  mram_array2[SIZE][SIZE];


__host uint32_t nb_cycles;

uint32_t output[SIZE][SIZE];
uint32_t temp=0;

int main() {

  for (int i = 0; i < SIZE; ++i) {
    for (int j = 0; j < SIZE; ++j) {
        mram_array1[i][j] = 2;
        mram_array2[i][j] = 6;
    }
  }
  perfcounter_config(COUNT_INSTRUCTIONS, true);


  for (int i = 0; i < SIZE; ++i) {
    for (int j = 0; j < SIZE; ++j) {
        for (int k = 0; k < SIZE; ++k) {
            temp += mram_array1[i][k]*mram_array2[k][j]; me();
        }
        output[i][j]=temp;
        temp=0;
    }
  }
  nb_cycles = perfcounter_get();

    for (int i = SIZE-5; i < SIZE; ++i) {
        for (int j = SIZE-5; j < SIZE; ++j) {
            printf("output[%d][%d]=%d\n", i, j,  output[i][j]);
        }
    }


  return 0;
}