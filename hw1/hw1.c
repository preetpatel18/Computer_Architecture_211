/*
 * Author: Preet Patel
 * Netid: pcp70
 * Aid: I used online resources such as Chatgpt and YouTube to figure out how SSH, Vim works as it wasn't working on my terminal for some reason.
 * 
 */
#include <stdio.h>

int main(int argc, char** argv) {
    if (argc > 1) {
        printf("Hello %s\n", argv[1]);
    } else {
        printf("Hello World\n");
    }
    return 22;
}
