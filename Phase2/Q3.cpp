#include <iostream>

// Function prototypes
int fun1(int t0);
int fun2(int t0, int t1, int t2);

int main() {
    // Simulate memory as an array
    int memory[100] = {0};
    memory[0] = 10;   // DM[5000]
    memory[1] = 20;   // DM[5004]
    memory[2] = 30;   // DM[5008]

    // Load values from memory
    int t0 = memory[0];
    int t1 = memory[1];
    int t2 = memory[2];

    // Perform arithmetic
    int t3 = t0 + t1 + t2;
    memory[0] = t3; // Store result back to DM[5000]

    // Call fun1
    t0 = memory[0];
    t1 = fun1(t0);

    // Move t1 to t2
    t2 = t1;

    // Set t1 to 10
    t1 = 10;

    // Call fun2
    t3 = fun2(t0, t1, t2);

    // Store result to DM[5040]
    memory[40] = t3;

    std::cout << "Stored value at memory[5040]: " << memory[40] << std::endl;
    return 0;
}

// Define fun1
int fun1(int t0) {
    int t2 = 40;
    int t1 = 0;

    // Check if t0 is less than 40
    if (t0 < t2) {
        t1 = t0 - t2;
    } else {
        t1 = 0;
    }

    return t1;
}

// Define fun2
int fun2(int t0, int t1, int t2) {
    // Perform multiplications and addition
    int t3 = t0 * t1;
    int t4 = t2 * t1;
    t3 = t3 + t4;

    return t3;
}
