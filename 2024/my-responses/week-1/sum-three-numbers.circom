pragma circom 2.1.6;

// include "circomlib/poseidon.circom";
// include "https://github.com/0xPARC/circom-secp256k1/blob/master/circuits/bigint.circom";

template AdditionProof () {
    signal input a;
    signal input b;
    signal input c;
    signal output sum;

    signal i <== a * b;
    sum <== i * c;
}

component main = AdditionProof();

/* INPUT = {
    "a": "5",
    "b": "77"
} */
