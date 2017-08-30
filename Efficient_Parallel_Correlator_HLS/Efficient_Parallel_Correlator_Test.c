#include <stdio.h>

#include "correlator.h"

void main()
{
   in_data_t Gol_a[PARALLEL_LEN];
   in_data_t Gol_b[PARALLEL_LEN];
   out_data_t Cor_a[PARALLEL_LEN];
   out_data_t Cor_b[PARALLEL_LEN];
   int i,j,k,retval=0;
   unsigned err_cnt = 0, check_dots = 0;
   FILE *fp;
   FILE *fp0;
   FILE *fp1;

   fp=fopen("in.dat","r");
   fp0=fopen("result_a.dat","w");
   fp1=fopen("result_b.dat","w");
   for(i=0;i<16;i++)
   {
	   for (j=0;j<8;j++)
	   {
			float tmp;
			fscanf(fp,"%f",&tmp);
			printf("%f ",tmp);
			Gol_a[j]=tmp;
			Gol_b[j]=tmp;
	   }
	   printf("\n");
	   Efficient_Cor(Gol_a,Gol_b,Cor_a,Cor_b);
	   for(k=0;k<8;k++)
	   {
		   fprintf(fp0, "%f \n", Cor_a[k]);
		   fprintf(fp1, "%f \n", Cor_b[k]);
	   }
   }
   fclose(fp);
   fclose(fp0);
   fclose(fp1);
   
}
