#include "NumClass.h"
int powRec(int n , int x) {
    if (x == 0) {
        return 1;
     }else {
        return n * powRec(n , x-1);
    }
}

int lengthRec(int x) {
    if (x == 0) {
        return 0;
    } else {
        return 1 + lengthRec(x / 10);
    }
}
int sumOfPowers(int x, int lenOfNumber) {
    if (x == 0) {
        return 0;
    } else {
        int digit = x % 10;
        return powRec(digit, lenOfNumber) + sumOfPowers(x / 10, lenOfNumber);
    }
}
// Function to check if a number is an Armstrong number recursively
int isArmstrongRec(int x, int lenOfNumber) {
    return (x == sumOfPowers(x, lenOfNumber));
}
int isArmstrong(int x){
  return isArmstrongRec(x , lengthRec(x));
}


int isPalindromeRec(int x, int divisor) {
    if (x < 10) {
        return 1; // Single-digit numbers are palindromes
    } else {
        int firstDigit = x / divisor;
        int lastDigit = x % 10;

        if (firstDigit != lastDigit) {
            return 0; // Not a palindrome if the first and last digits are different
        } else {
            return isPalindromeRec((x % divisor) / 10, divisor / 100);
        }
    }
}

// Wrapper function to initialize the divisor and call the recursive function
int isPalindrome(int x) {
    int divisor = 1;
    while (x / divisor >= 10) {
        divisor *= 10;
    }
    return isPalindromeRec(x, divisor);
}