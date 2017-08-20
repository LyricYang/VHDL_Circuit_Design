typedef int data_type;
#define N 5

void MatrixMultiply(data_type AA[N*N],data_type bb[N],data_type cc[N])
{
    int i,j;
    for(i = 0;i<N;i++)
    {
        data_type sum = 0;
        MatrixMultiply_label0:for(j = 0;j<N;j++)
        {
            sum += AA[i*N+j]*bb[j];
        }
        cc[i] = sum;
    }
}
