#include "NumClass.h"

int lengthIter(int x){
    int sum = 0;
     while (x > 0) {
        sum += 1;
        x /= 10;
    }
    return sum;
}

int powIter(int number, int x) {
    int result = 1;
    for (int i = 0; i < x; i++) {
        result *= number;
    }
    return result;
}


int isArmstrong(int x){
    int lenOfNumber = lengthIter(x);
    int sum = 0;
    int temp = x;
     while (temp > 0) {
        int digit = temp % 10;
        sum = sum + powIter(digit ,lenOfNumber);
        temp /= 10;
    }
      return(sum == x);
}


int isPalindrome(int num){
    int originalNum = num;
    int reversedNum = 0;
    while (num > 0) {
        int digit = num % 10;
        reversedNum = reversedNum * 10 + digit;
        num /= 10;
    }
    return (originalNum == reversedNum);
}