#include <stdio.h>
#include <stdlib.h>

void main(){
    union{
        unsigned int val;
        float fval;
    }a,b,sum, mul;

    a.val = 0x80001;
    b.val = 0x80001;

    //sum.fval = a.fval + b.fval;
    mul.fval = a.fval * b.fval;

    printf("a.fval: %e\n", a.fval);
    printf("b.fval: %e\n\n", b.fval);

    //printf("sum.fval: %f\n", sum.fval);
    //printf("sum.val: %08x\n", sum.val);
    printf("mul.fval: %e\n", mul.fval);
    printf("mul.val: %08x\n", mul.val);
}