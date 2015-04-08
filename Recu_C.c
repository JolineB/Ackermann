#include <stdio.h>
#include <stdlib.h>

int ackermann(int m, int n);

int main(void){
	int m, n;
	m = 0;
	n = 0;

	for (m = 0; m <= 3; m++){
		for (n = 0; n <= 6; n++){
			printf("%d %d %d\n", m, n, ackermann(m,n));
		}
	}
	return 0;
}

int ackermann(int m, int n){
	if(m == 0)
		return n + 1;
	else if (n  == 0)
		return ackermann(m-1, 1);
	else
		return ackermann(m - 1, ackermann(m, n -1));
}
