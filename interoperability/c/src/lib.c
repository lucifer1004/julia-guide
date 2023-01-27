#include "math.h"

int FLAG = 0;

int fibonacci(int n) {
    if (FLAG < n) {
        FLAG = n;
    }

    if (n < 2)
        return n;
    
    int a = 0, b = 1, c;
    for (int i = 2; i <= n; i++) {
        c = a + b;
        a = b;
        b = c;
    }

    return b;
}

void map(double *arr, int size, double (*f)(double)) {
    for (int i = 0; i < size; i++) {
        arr[i] = f(arr[i]);
    }
}
