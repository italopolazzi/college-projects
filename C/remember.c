#include <stdio.h>
#include <stdlib.h>
#include <string.h>

struct Person {
    char name[30];
    int age;
};

int fib(int num);

int main(){
	struct Person p;
	strcpy(p.name, "Ítalo Polazzi Ferreira");

	p.age = 19;
	
	printf("Name: %s\nAge: %d", p.name, p.age);

	/*
	printf("Input your number: ");
	int n, *p_n;
	p_n = &n;
	scanf("%d", p_n);

	printf("Fibonacci result: %d", fib(*p_n));
	*/

	return 0;
}

int fib(int num){
	if(num == 0) return 0;
	else if(num == 1) return 1;
	else return (fib(num-1) + fib(num-2));
}
