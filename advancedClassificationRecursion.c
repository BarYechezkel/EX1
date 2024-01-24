#include "NumClass.h"
// Calculate the pow recursively
int powRec(int n , int x) {
    if (x == 0) {
        return 1;
     }else {
        return n * powRec(n , x-1);
    }
}
// Calculate the length of the number recursively
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


// Recursive function for Palindrome
int isPalindromeRec(int x, int originalNum) {
    if (x == 0) {
        return originalNum;
    } else {
        return isPalindromeRec(x / 10, originalNum * 10 + x % 10);
    }
}

// Wrapper function to call the recursive function send to "isPalindromeRec"
int isPalindrome(int x) {
    return (x == isPalindromeRec(x, 0));
}