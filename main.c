#include "NumClass.h"
#include <stdio.h>
int main() {
    int a=0, b=0;

    //printf ("input 2 numbers");

    scanf("%d%d",&a,&b);

    int big = 0, small = 0;
    if (a>b){
        big=a;
        small=b;
    }else{
        big=b;
        small=a;
    }


    printf("The Armstrong numbers are:");
    for (int i=small; i<=big; i++){
         if (isArmstrong(i)){
            printf(" %d",i);
         }
    }

   

    printf("\nThe Palindromes are:");
    for (int i=small; i<=big; i++){
         if (isPalindrome(i)){
            printf(" %d",i);
        }
    }

       printf("\nThe Prime numbers are:");
    for (int i=small; i<=big; i++){
        if (isPrime(i)){
            printf(" %d",i);
        }
    }

     printf("\nThe Strong numbers are:");
    for (int i=small; i<=big; i++){
         if (isStrong(i)){
            printf(" %d",i);
        }
    }

     printf("\n");

     return 0;

}
