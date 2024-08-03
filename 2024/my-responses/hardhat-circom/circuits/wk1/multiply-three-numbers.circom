pragma circom 2.1.6;

template MultiplyProof () {
    signal input a;
    signal input b;
    signal input c;
    signal output result;

    signal i <== a * b;
    result <== i * c;
}

component main = MultiplyProof();
