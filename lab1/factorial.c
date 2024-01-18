#include <stdio.h>

bool prime(int n) {
	for(int i = 2; i*i < n; i++) if(n%i==0) return 0;
	return 1;
}

int main() {
	int n;
	printf("Please input a number: ");
	scanf("%d", &n);
	printf("The result of factorial(n) is %d", factorial(n));
	return 0;
}
