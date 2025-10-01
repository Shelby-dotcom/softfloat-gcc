#include <stdio.h>
#include <stdbool.h>
#include <stdint.h>

#include "softfloat.h" 
#include "softfloat_types.h"

int main() {
    uint8_t rounding_mode;   
    uint64_t operands_i[2];
    bool in_valid_i;
    uint64_t result_o;
    uint8_t status_o;

    float32_t f_operand1, f_operand2, f_res;
    f_operand1.v = (uint32_t)operands_i[0];
    f_operand2.v = (uint32_t)operands_i[1];
    softfloat_roundingMode = rounding_mode;
    softfloat_exceptionFlags = 0;
    if (in_valid_i)
    {
        f_res = f32_div(f_operand1, f_operand2); // DN, DV
        result_o = f_res.v;
    } else {
        result_o = 0;
    }
    status_o = softfloat_exceptionFlags & 0x1f;
    printf("Done Running Example!\n");


    return 0;
}