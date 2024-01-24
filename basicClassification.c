#include "NumClass.h"

int factorial(int n) {
    if (n == 0 || n == 1) {
        return 1;
    } else {
        return n * factorial(n - 1);
    }
}

int isStrong(int num) {
    int originalNum = num;
    int sum = 0;

    while (num > 0) {
        int digit = num % 10;
        sum += factorial(digit);
        num /= 10;
    }

    return (sum == originalNum);
}


int isPrime(int x){
    if (x < 1) {
        return FALSE;  // 0 is not prime numbers
    }
    if (x == 1) {
        return TRUE;  //  1 is prime numbers
    }

    for (int i = 2; i * i <= x; i++) {
        if (x % i == 0) {
            return FALSE;  // Found a divisor, not a prime number
        }
    }

    return TRUE;  // No divisors found, it's a prime number
}