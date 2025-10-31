/*
 * QUICKSORT
 *
 * by Ando Ki (andoki@gmail.com)
 *
 * This quick sort (QSORT) program is a recursive sorting algorithm that operates
 * by repeatedly partitioning an unsorted input list into a pair of unsorted sub-
 * lists, such taht all of the elements in one of the sublists are strictly
 * greater than the elements of the other.
 *
 */

#include "my_printf.h"

#define TRUE	1
#define FALSE	0
#define DEFAULT_SIZE	64

int size=DEFAULT_SIZE; /* size of data */
int DP[DEFAULT_SIZE]; /* data array pointer */

void
qsort_main(void) {
    void make_data(int*, int);
    void qsort(int*, int, int);
    void test(int*, int);
    void output(int*, int);

    my_printf("Quick Sort with %d items.\n", size);

    make_data(DP, size);
    //output(DP, size);

    qsort(DP, 0, size-1);
    test(DP, size);

    output(DP, size);
}

/*
 * sorts the elements data[p], ..., data[q]
 * into acending order
 *
 */
void
qsort(int* dp, int p, int q)
{
	int pivot;
	int partition(int*, int, int);

#ifdef DEBUG
	my_printf("qsort : (%d,%d)\n", p, q);
#endif
	if (p<q) {
		pivot = partition(dp, p, q);
		qsort(dp, p, pivot-1);
		qsort(dp, pivot+1, q);
	}
}

/*
 * within data[p], ..., data[q] the elements are
 * arranged in such a way that if initially t = data[p]
 * then after completion data[q] = t, for some pivot between
 * p and q, data[k] <=t for p <= k < pivot and
 * data[k] > t for pivot < k < q.
 *
 */
int
partition(int* dp, int p, int q)
{
	int pivot;
	void swap(int*, int, int);

	pivot = p;
	p++;
	while (p < q) {
		for (; dp[p] <= dp[pivot]; p++);
		for (; dp[pivot] < dp[q]; q--);
		if (p < q) swap(dp, p, q);
	}
	if (dp[pivot] > dp[q]) swap(dp, pivot, q);
	return(q);
}

/*
 * swap two elements which are pointed by p and q.
 *
 */
void
swap(int* dp, int p, int q)
{
	int tmp;

	tmp = dp[p];
	dp[p] = dp[q];
	dp[q] = tmp;
}

void
make_data(int* dp, int size)
{
	int i;
        extern int rand(void);

	for (i=0; i<size; i++) {
		//dp[i]=rand()%(size+1);
		dp[i]=rand()&0xFFFF;
	}
}

void
test(int* dp, int size)
{
   int i;
   int error;

   error = 0;
   for (i=0; i<size-1; i++) {
       if (dp[i]>dp[i+1]) error++;
   }
   if (error) my_printf("Error: %d items are mis-located!\n", error);
   else       my_printf("Test pass: %d items\n", size);
}

void
output(int* dp, int size)
{
	int i;

	my_printf("\nData Array ***\n");
	for (i=0; i<size; i++) {
		my_printf(" %5d", dp[i]);
		if ((i%10)==9) my_printf("\n");
	}
	my_printf("\n");
}

#define RAND_MAX 32767
unsigned long _Randseed = 1;

int rand(void)
{
  _Randseed = _Randseed * 1103515245 + 12345;
  return((int)((_Randseed>>16)&RAND_MAX));
}

void srand(unsigned int seed)
{
  _Randseed = seed;
}
