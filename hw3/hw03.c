
#include <stdio.h>
#include <stdlib.h>
#include <ctype.h>
#include "stack.h"


int main(int argc, char** argv){
    if (argc < 2) { // ERROR 244: NO FILENAME
        return 244;
    }

    FILE *fp = fopen(argv[1], "r");
    if(fp == NULL) { // ERROR 243: FILE NOT FOUND
        return 243;
    }

     Stack s = newStack(8);

     int ch;

    while ((ch = fgetc(fp)) != EOF) {
        if (isdigit((unsigned char)ch)) { // If Digit, Push it in Stach
            push(&s, ch - '0');
        } else if(ch == '+' || ch == '-' || ch == '*' || ch == '/'){
            // Need at least 2 numbers
            if (len(s) < 2) { // ERROR 242: STACK RAN OUT OF VALUES
                freeStack(s);
                fclose(fp);
                return 242;
            }
            int b = pop(&s);
            int a = pop(&s);
            int result = 0;

            if (ch == '+') {
                result = a + b;
            }
            else if (ch == '-') {
                result = a - b;
            }
            else if (ch == '*') {
                result = a * b;
            }
            else if (ch == '/') {
                result = a / b;
            }
            push(&s, result);
        }
    }

    fclose(fp);

    if (len(s) == 0){// ERROR 242: STACK RAN OUT OF VALUES
        freeStack(s);
        return 242;
    }

    if(len(s) > 1){ // ERROR 241: STACK HAS EXCESS VALUES
        freeStack(s);
        return 241;
    }

    int res = pop(&s);
    freeStack(s);

    return res;
}