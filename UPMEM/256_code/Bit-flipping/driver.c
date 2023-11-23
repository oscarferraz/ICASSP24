#include <assert.h>
#include <dpu.h>
#include <dpu_log.h>
#include <stdio.h>
#include <time.h>

#ifndef DPU_BINARY
#define DPU_BINARY "./matrix_mul"
#endif

static inline double my_clock(void) {
  struct timespec t;
  clock_gettime(CLOCK_MONOTONIC_RAW, &t);
  return (1.0e-9 * t.tv_nsec + t.tv_sec);
}

int main(void) {
  struct dpu_set_t set, dpu;
  uint32_t nr_ranks;


  // allocates a set of UPMEM DPU ranks
  DPU_ASSERT(dpu_alloc(1, NULL, &set));

  // reads and loads the binary executable into the allocated DPU set
  DPU_ASSERT(dpu_load(set, DPU_BINARY, NULL));


  double start = my_clock();
  //starts the execution of the program
   DPU_ASSERT(dpu_launch(set, DPU_SYNCHRONOUS));
  double end = my_clock();
   

   uint32_t nb_cycles;
  //iterates over the individual DPUs from the allocated set
  DPU_FOREACH(set, dpu) {
    DPU_ASSERT(dpu_copy_from(dpu, "nb_cycles", 0, &nb_cycles, sizeof(uint32_t)));

    //fetches the DPU stdout buffer and display it on the host stdout
    DPU_ASSERT(dpu_log_read(dpu, stdout));
  }

   printf("DPU cycles: %u\n", nb_cycles);
  printf("DPU time: %.2e secs.\n", (double)nb_cycles / CLOCKS_PER_SEC );

  printf("Host elapsed time: %.2e secs.\n", end - start);

  //When the execution completes, the allocated DPU set must be free
  DPU_ASSERT(dpu_free(set));

  return 0;
}