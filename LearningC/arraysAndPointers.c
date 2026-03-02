#include <stdio.h>

//  Difference Between Signed and Unsigned int is that, signed is WITH negative Integers, and unsigned is non-negative integers.
//  float, double, bool, char, void.

/*
 * %d and %i print signed integers
 * %c is a single characters
 * %s is a String
 * #f is a floating point number
 * 	%.3f would print with 3 digits of precisions
 * %p is a pointer.
 */

// This function takes an Int and returns double that value.
int doubleInt(int a){
	return 2*a;
}

// Main Functions:
// Another version is int main(void) --> if we are not using any sort of arguments.
int main(int argc, char** argv){
	printf("The first argument is %s.\n", argv[1]);
	
	// Creating an Array of 4 Chars.
	unsigned char chars[4] = {1,2,4,5};
	// print them out.
	printf("char 1 is %i \n", chars[0]);

	// To Print out their memory Location:
	printf("char 1 is at %p\n",chars);
	printf("char 2 is at %p\n", chars+1);
	printf("char 3 is at %p\n", chars+2);
	printf("Char 4 is at %p\n", chars+3);

	unsigned char a,b,c,d;
	// Can do the same thing using &
	printf("char 1 is at %p\n", &a);
        printf("char 2 is at %p\n", &b);
        printf("char 3 is at %p\n", &c);
        printf("Char 4 is at %p\n", &d);
    	return 0;
}
