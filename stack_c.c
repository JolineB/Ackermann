#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#include <sys/time.h>

#define STACKSIZE 1000000

/*Nonrecursive version of Ackermann's function, using just a stack*/

struct dataT
{
	int m;
};

struct stack
{
	int top;
	struct dataT items[STACKSIZE];
}st;

void createstack(void){
	st.top = -1;
}
int isFULL(){
	if(st.top >= STACKSIZE -1)
		return 1;
	else
		return 0;
}
int isEMPTY(){
	if(st.top == -1)
		return 1;
	else
		return 0;
}
int stack_size(void){
	return st.top;
}
int top(void){
	return st.items[st.top].m;
}
void push(int m){
	if(isFULL()){
		fputs("Error: stack overflow\n", stderr);
		abort();
	}
	else{
		st.top = st.top + 1;
		st.items[st.top].m = m;
	}
}
void pop(int * m){
	if(isEMPTY()){
		fputs("Error: stack undeerflow\n", stderr);
		abort();
	}
	else{
		*m = st.items[st.top].m;
		st.top = st.top -1;
	}
}
int ackermann(int m, int n){
	push(m);
	while(!isEMPTY()){
		pop(&m);
		if(m == 0)
			n = n + 1;
		else if (n == 0){
			n = 1;
			push(m -1);
		}
		else{
			n = n - 1;
			push(m - 1);
			push(m);
		}
	}
	return n;
}

int main(void){
	int r, m, n;
	struct timeval t1, t2, tv;

	createstack();
	printf("Enter m and n: ");
	scanf("%d%d", &m, &n);

	/*Start Timer
	*Produces 1 microsecond resolution (1,000,000 microseconds = 1 sec*/
	gettimeofday(&t1, NULL);

	r = ackermann(m,n);

	/*stop timer*/
	gettimeofday(&t2, NULL);

	printf("Result = %d\n", r);

	timersub(&t2, &t1, &tv);
	printf("%ld milliseconds\n", (1000000*tv.tv_sec+tv.tv_usec)/1000);

	return 0;
}

