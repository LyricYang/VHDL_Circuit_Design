#include <stdio.h>
typedef int data_type;
#define N 5
const data_type MatrixA[] = {
		#include "A.h"
		};
const data_type Vector_b[] = {
		#include "b.h"
		};
const data_type MatlabResult_c[] = {
		#include "c.h"
		};
data_type HLS_Result_c[N] = {0};
void CheckResult(data_type * matlab_result,data_type * your_result);
int main(void)
{
	printf("Checking Results:\r\n");
	MatrixMultiply(MatrixA,Vector_b,HLS_Result_c);
	CheckResult(MatlabResult_c,HLS_Result_c);
 	return 0;
}
void CheckResult(data_type * matlab_result,data_type * your_result)
{
	int i;
	for(i = 0;i<N;i++)
	{
		printf("Id x %d: Error = %d \r\n",i,matlab_result[i]-your_result[i]);
	}
}
