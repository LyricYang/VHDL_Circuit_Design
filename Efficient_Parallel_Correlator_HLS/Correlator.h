#ifndef CORRELATOR_H_
#define CORRELATOR_H_
#endif

#include <math.h>
#include <stdint.h>

#ifndef PARALLEL_LEN
#define PARALLEL_LEN 8
#endif

#ifndef CORRELATOR_LEN
#define CORRELATOR_LEN 7
#endif


typedef float		in_data_t;
typedef float		out_data_t;
typedef float       coeff_t;
typedef int         w_t;

void Efficient_Cor(in_data_t Gol_a[PARALLEL_LEN],in_data_t Gol_b[PARALLEL_LEN],out_data_t Gor_a[PARALLEL_LEN],out_data_t Gor_b[PARALLEL_LEN]);
