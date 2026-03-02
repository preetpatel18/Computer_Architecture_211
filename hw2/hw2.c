/*
 * Author: Preet Patel
 * Netid: pcp70
 * Aid: I used YouTube Videos to understand how >> and << Shift. 
 * Links: https://www.youtube.com/watch?v=BGeOwlIGRGI
 */

#include <stdio.h>
#include <stdlib.h>

// Usigned Char* Data - &(variable) - Gives you a decimal at Data[i].


// Printing Binary From Decimal Format
void show_binary(unsigned char* data, size_t len){
	for(int i = len-1; i>=0; i--){
		for(int k = 7; k>=0; k--){
			printf("%i",(data[i] >> k) & 1);
    		}
		if(i!=0){
			printf(" ");
		}
	}
	printf("\n");
}
int main(int argc, char** argv) {
    if(argc < 3){
        return 1;
    }
    int userInput = atoi(argv[1]);
    int rotation = atoi(argv[2]);
    int res = 0;
    
    // Sign = 1 if Left - Sign = 0 if Right
    int sign = (rotation < 0);

    rotation = abs(rotation);
    // Make sure rotation is between 32 - Since 32 is a complete Round about.
    int r = rotation % 32;

    // Left
    if(sign == 1){
        res = (userInput<<r)|(userInput>>(32-r));
    }else{// Right
        res = (userInput>>r)|(userInput<<(32-r));
    }

    show_binary((unsigned char*)&res,sizeof(int));

    return 0;
}
