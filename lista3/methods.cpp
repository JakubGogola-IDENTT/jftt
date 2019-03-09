#include<iostream>
#include<cmath>

#include "methods.hpp"

int add(int a, int b) {
    return a + b;
}

int sub(int a, int b){ 
    return a - b;
}

int mult(int a, int b){ 
    return a * b;
}

int divide(int a, int b) {
    return floor((double) a / (double) b);
} 

int modulo(int a, int b){
    return a - divide(a, b) * b;
} 

int pwr(int a, int b){
    return pow(a, b);
}

int neg(int a){
    return -a;
}
