#include <stdio.h>
#include <stdlib.h>

#define SIZE 100

void mem_alloc(unsigned char **data, int size);
unsigned char *mem_alloc2(int size);

int main(void)
{
	int i;
	unsigned char *buffer;


	//mem_alloc(&buffer, SIZE);
	buffer = mem_alloc2(SIZE);
	// for(i=0; i<SIZE; i++)
	// 	buffer[i]=89;

	for(i=0; i<SIZE; i++)
	{
		printf("%d: %d\n", i, buffer[i]);
	}

	return 1;
}

unsigned char *mem_alloc2(int size)
{
	unsigned char *data;
	data = (unsigned char *)malloc(size);
	return data;
}

void mem_alloc(unsigned char **data, int size)
{
	int i;

	*data = (unsigned char *)malloc(size);

	 for(i=0; i<size; i++)
	 	 (*data)[i] = 13;

	// for(i=0; i<size; i++)
	// 	printf("%d: %d\n", i, *data[i]);
}