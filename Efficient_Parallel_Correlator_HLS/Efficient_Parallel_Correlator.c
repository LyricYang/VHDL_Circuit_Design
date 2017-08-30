#include "correlator.h"

const w_t W[CORRELATOR_LEN] = {0,0,0,0,1,0,0};
static coeff_t dff_1D = 0.0f;
static coeff_t dff_2D[2] = {0.0f,0.0f};
static coeff_t dff_4D[4] = {0.0f,0.0f,0.0f,0.0f};
static coeff_t dff_8D[PARALLEL_LEN] = {0.0f};
static coeff_t dff_16D[PARALLEL_LEN][2] = {0.0f};
static coeff_t dff_32D[PARALLEL_LEN][4] = {0.0f};
static coeff_t dff_64D[PARALLEL_LEN][8] = {0.0f};

void Stage_8_1D(in_data_t buf_a[PARALLEL_LEN],in_data_t buf_b[PARALLEL_LEN],w_t w, out_data_t buf_cor_a[PARALLEL_LEN],out_data_t buf_cor_b[PARALLEL_LEN])
{

	int i;
	if(w == 0)
	{
		buf_cor_a[0] = dff_1D - buf_a[0];
		buf_cor_b[0] = -1*dff_1D - buf_a[0];
		dff_1D = buf_b[PARALLEL_LEN-1];
		Stage_8_1D_N_LOOP:
		for(i=0;i<PARALLEL_LEN-1;i++)
		{
			buf_cor_a[i+1] = buf_b[i] - buf_a[i+1];
			buf_cor_b[i+1] = -1*buf_b[i] - buf_a[i+1];
		}
	}
	else
	{
		buf_cor_a[0] = buf_a[0] + dff_1D;
		buf_cor_b[0] = buf_a[0] - dff_1D;
		dff_1D = buf_b[PARALLEL_LEN-1];
		Stage_8_1D_P_LOOP:
		for(i=0;i<PARALLEL_LEN-1;i++)
		{
			buf_cor_a[i+1] = buf_a[i+1] + buf_b[i];
			buf_cor_b[i+1] = buf_a[i+1] - buf_b[i];
		}
	}
}


void Stage_8_2D(in_data_t buf_a[PARALLEL_LEN],in_data_t buf_b[PARALLEL_LEN],w_t w, out_data_t buf_cor_a[PARALLEL_LEN],out_data_t buf_cor_b[PARALLEL_LEN])
{

	int i;
	if(w == 0)
	{	
		
		buf_cor_a[0] = dff_2D[0] - buf_a[0];
		buf_cor_b[0] = -1*dff_2D[0] - buf_a[0];
		dff_2D[0] = buf_b[PARALLEL_LEN-2];
		buf_cor_a[1] = dff_2D[1] - buf_a[1];
		buf_cor_b[1] = -1*dff_2D[1] - buf_a[1];
		dff_2D[1] = buf_b[PARALLEL_LEN-1];
		Stage_8_2D_N_LOOP:
		for(i=0;i<PARALLEL_LEN-2;i++)
		{
			buf_cor_a[i+2] = buf_b[i] - buf_a[i+2];
			buf_cor_b[i+2] = -1*buf_b[i] - buf_a[i+2];
		}
	}
	else
	{
		buf_cor_a[0] = buf_a[0] + dff_2D[0];
		buf_cor_b[0] = buf_a[0] - dff_2D[0];
		dff_2D[0] = buf_b[PARALLEL_LEN-2];
		buf_cor_a[1] = buf_a[1] + dff_2D[1];
		buf_cor_b[1] = buf_a[1] - dff_2D[1];
		dff_2D[1] = buf_b[PARALLEL_LEN-1];
		Stage_8_2D_P_LOOP:
		for(i=0;i<PARALLEL_LEN-2;i++)
		{
			buf_cor_a[i+2] = buf_a[i+2] + buf_b[i];
			buf_cor_b[i+2] = buf_a[i+2] - buf_b[i];
		}
	}
}
	
	
void Stage_8_4D(in_data_t buf_a[PARALLEL_LEN],in_data_t buf_b[PARALLEL_LEN],w_t w, out_data_t buf_cor_a[PARALLEL_LEN],out_data_t buf_cor_b[PARALLEL_LEN])
{

	int i,j;
	if(w == 0)
	{	
		Stage_8_4D_N_DFF_LOOP:
		for(j=0;j<4;j++)
		{
			buf_cor_a[j] = dff_4D[j] - buf_a[j];
			buf_cor_b[j] = -1*dff_4D[j] - buf_a[j];
			dff_4D[j] = buf_b[PARALLEL_LEN-4+j];
		}
		Stage_8_4D_N_LOOP:
		for(i=0;i<PARALLEL_LEN-4;i++)
		{
			buf_cor_a[i+4] = buf_b[i] - buf_a[i+4];
			buf_cor_b[i+4] = -1*buf_b[i] - buf_a[i+4];
		}
	}
	else
	{
		Stage_8_4D_P_DFF_LOOP:
		for(j=0;j<4;j++)
		{
			buf_cor_a[j] = buf_a[j] + dff_4D[j];
			buf_cor_b[j] = buf_a[j] - dff_4D[j];
			dff_4D[j] = buf_b[PARALLEL_LEN-4+j];
		}
		Stage_8_4D_P_LOOP:
		for(i=0;i<PARALLEL_LEN-4;i++)
		{
			buf_cor_a[i+4] = buf_a[i+4] + buf_b[i];
			buf_cor_b[i+4] = buf_a[i+4] - buf_b[i];
		}
	}
}


void Stage_8_8D(in_data_t buf_a[PARALLEL_LEN],in_data_t buf_b[PARALLEL_LEN],w_t w, out_data_t buf_cor_a[PARALLEL_LEN],out_data_t buf_cor_b[PARALLEL_LEN])
{
	int i;
	if(w == 0)
	{
		Stage_8_8D_N_DFF_LOOP:
		for(i=0;i<PARALLEL_LEN;i++)
		{
			buf_cor_a[i] = dff_8D[i] - buf_a[i];
			buf_cor_b[i] = -1*dff_8D[i] - buf_a[i];
			dff_8D[i]=buf_b[i];
		}
	}
	else
	{
		Stage_8_8D_P_DFF_LOOP:
		for(i=0;i<PARALLEL_LEN;i++)
		{
			buf_cor_a[i] = buf_a[i] + dff_8D[i];
			buf_cor_b[i] = buf_a[i] - dff_8D[i];
			dff_8D[i]=buf_b[i];
		}
	}
}


void Stage_8_16D(in_data_t buf_a[PARALLEL_LEN],in_data_t buf_b[PARALLEL_LEN],w_t w, out_data_t buf_cor_a[PARALLEL_LEN],out_data_t buf_cor_b[PARALLEL_LEN])
{

	int i,k;
	if(w == 0)
	{
		Stage_8_16D_N_DFF_LOOP:
		for(i=0;i<PARALLEL_LEN;i++)
		{
			buf_cor_a[i] = dff_16D[i][1] - buf_a[i];
			buf_cor_b[i] = -1*dff_16D[i][1] - buf_a[i];
			Shift_Accum_16D_N_Loop: 
			for (k=1;k>=0;k--)
			{
				if (k==0) 
				{
					dff_16D[i][0]=buf_b[i];
				}
				else 
				{
					dff_16D[i][k]=dff_16D[i][k-1];
				}       
			}
		}
	}
	else
	{
		Stage_8_16D_P_DFF_LOOP:
		for(i=0;i<PARALLEL_LEN;i++)
		{
			buf_cor_a[i] = buf_a[i] + dff_16D[i][1];
			buf_cor_b[i] = buf_a[i] - dff_16D[i][1];
			Shift_Accum_16D_P_Loop: 
			for (k=1;k>=0;k--)
			{
				if (k==0) 
				{
					dff_16D[i][0]=buf_b[i];
				}
				else 
				{
					dff_16D[i][k]=dff_16D[i][k-1];
				}       
			}
		}
	}
}


void Stage_8_32D(in_data_t buf_a[PARALLEL_LEN],in_data_t buf_b[PARALLEL_LEN],w_t w, out_data_t buf_cor_a[PARALLEL_LEN],out_data_t buf_cor_b[PARALLEL_LEN])
{

	int i,k;
	if(w == 0)
	{
		Stage_8_32D_N_DFF_LOOP:
		for(i=0;i<PARALLEL_LEN;i++)
		{
			buf_cor_a[i] = dff_32D[i][3] - buf_a[i];
			buf_cor_b[i] = -1*dff_32D[i][3] - buf_a[i];
			Shift_Accum_32D_N_Loop: 
			for (k=3;k>=0;k--)
			{
				if (k==0) 
				{
					dff_32D[i][0]=buf_b[i];
				}
				else 
				{
					dff_32D[i][k]=dff_32D[i][k-1];
				}       
			}
		}
	}
	else
	{
		Stage_8_32D_P_DFF_LOOP:
		for(i=0;i<PARALLEL_LEN;i++)
		{
			buf_cor_a[i] = buf_a[i] + dff_32D[i][3];
			buf_cor_b[i] = buf_a[i] - dff_32D[i][3];
			Shift_Accum_32D_P_Loop: 
			for (k=3;k>=0;k--)
			{
				if (k==0) 
				{
					dff_32D[i][0]=buf_b[i];
				}
				else 
				{
					dff_32D[i][k]=dff_32D[i][k-1];
				}       
			}
		}
	}
}


void Stage_8_64D(in_data_t buf_a[PARALLEL_LEN],in_data_t buf_b[PARALLEL_LEN],w_t w, out_data_t buf_cor_a[PARALLEL_LEN],out_data_t buf_cor_b[PARALLEL_LEN])
{

	int i,k;
	if(w == 0)
	{
		Stage_8_64D_N_DFF_LOOP:
		for(i=0;i<PARALLEL_LEN;i++)
		{
			buf_cor_a[i] = dff_64D[i][7] - buf_a[i];
			buf_cor_b[i] = -1*dff_64D[i][7] - buf_a[i];
			Shift_Accum_64D_N_Loop: 
			for (k=7;k>=0;k--)
			{
				if (k==0) 
				{
					dff_64D[i][0]=buf_b[i];
				}
				else 
				{
					dff_64D[i][k]=dff_64D[i][k-1];
				}       
			}
		}
	}
	else
	{
		Stage_8_64D_P_DFF_LOOP:
		for(i=0;i<PARALLEL_LEN;i++)
		{
			buf_cor_a[i] = buf_a[i] + dff_64D[i][7];
			buf_cor_b[i] = buf_a[i] - dff_64D[i][7];
			Shift_Accum_64D_P_Loop: 
			for (k=7;k>=0;k--)
			{
				if (k==0) 
				{
					dff_64D[i][0]=buf_b[i];
				}
				else 
				{
					dff_64D[i][k]=dff_64D[i][k-1];
				}       
			}
		}
	}
}


void Efficient_Cor(in_data_t Gol_a[PARALLEL_LEN],in_data_t Gol_b[PARALLEL_LEN],out_data_t Gor_a[PARALLEL_LEN],out_data_t Gor_b[PARALLEL_LEN])
{
	out_data_t buf_cor_1D_a[PARALLEL_LEN]={0.0f};
	out_data_t buf_cor_1D_b[PARALLEL_LEN]={0.0f};
	out_data_t buf_cor_2D_a[PARALLEL_LEN]={0.0f};
	out_data_t buf_cor_2D_b[PARALLEL_LEN]={0.0f};
	out_data_t buf_cor_4D_a[PARALLEL_LEN]={0.0f};
	out_data_t buf_cor_4D_b[PARALLEL_LEN]={0.0f};
	out_data_t buf_cor_8D_a[PARALLEL_LEN]={0.0f};
	out_data_t buf_cor_8D_b[PARALLEL_LEN]={0.0f};
	out_data_t buf_cor_16D_a[PARALLEL_LEN]={0.0f};
	out_data_t buf_cor_16D_b[PARALLEL_LEN]={0.0f};
	out_data_t buf_cor_32D_a[PARALLEL_LEN]={0.0f};
	out_data_t buf_cor_32D_b[PARALLEL_LEN]={0.0f};
	Stage_8_1D(Gol_a,Gol_b,W[0],buf_cor_1D_a,buf_cor_1D_b);
	int i,m;
	for(i=0;i<8;i++)
	{
		printf("%f ",buf_cor_1D_a[i]);
	}
	printf("\n");
	for(m=0;m<8;m++)
	{
		printf("%f ",buf_cor_1D_b[m]);
	}
	printf("\n");


	Stage_8_8D(buf_cor_1D_a,buf_cor_1D_b,W[1], buf_cor_8D_a,buf_cor_8D_b);
	int j,n;
	for(j=0;j<8;j++)
	{
		printf("%f ",buf_cor_8D_a[j]);
	}
	printf("\n");
	for(n=0;n<8;n++)
	{
		printf("%f ",buf_cor_8D_b[n]);
	}
	printf("\n");



	Stage_8_2D(buf_cor_8D_a,buf_cor_8D_b,W[2], buf_cor_2D_a,buf_cor_2D_b);
	int a,b;
	for(a=0;a<8;a++)
	{
		printf("%f ",buf_cor_2D_a[a]);
	}
	printf("\n");
	for(b=0;b<8;b++)
	{
		printf("%f ",buf_cor_2D_b[b]);
	}
	printf("\n");


	Stage_8_4D(buf_cor_2D_a,buf_cor_2D_b,W[3], buf_cor_4D_a,buf_cor_4D_b);
	int c,d;
	for(c=0;c<8;c++)
	{
		printf("%f ",buf_cor_4D_a[c]);
	}
	printf("\n");
	for(d=0;d<8;d++)
	{
		printf("%f ",buf_cor_4D_b[d]);
	}
	printf("\n");




	Stage_8_16D(buf_cor_4D_a,buf_cor_4D_b,W[4], buf_cor_16D_a,buf_cor_16D_b);
	int e,f;
	for(e=0;e<8;e++)
	{
		printf("%f ",buf_cor_16D_a[e]);
	}
	printf("\n");
	for(f=0;f<8;f++)
	{
		printf("%f ",buf_cor_16D_b[f]);
	}
	printf("\n");




	Stage_8_32D(buf_cor_16D_a,buf_cor_16D_b,W[5], buf_cor_32D_a,buf_cor_32D_b);
	int g,h;
	for(g=0;g<8;g++)
	{
		printf("%f ",buf_cor_32D_a[g]);
	}
	printf("\n");
	for(h=0;h<8;h++)
	{
		printf("%f ",buf_cor_32D_b[h]);
	}
	printf("\n");




	Stage_8_64D(buf_cor_32D_a,buf_cor_32D_b,W[6], Gor_a,Gor_b);
	int k,l;
	for(k=0;k<8;k++)
	{
		printf("%f ",Gor_a[k]);
	}
	printf("\n");
	for(l=0;l<8;l++)
	{
		printf("%f ",Gor_b[l]);
	}
	printf("\n");
	printf("\n");
}

