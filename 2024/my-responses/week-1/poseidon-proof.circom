pragma circom 2.1.6;

include "circomlib/poseidon.circom";
master/circuits/bigint.circom";

template PoseidonProof () {
    signal input preimage;
    signal input hash;

    component hasher = Poseidon(1);
    hasher.inputs[0] <== preimage;
    hash === hasher.out;
}

component main = PoseidonProof();

/* INPUT = {
    "preimage": "12345",
    "hash": "4267533774488295900887461483015112262021273608761099826938271132511348470966"
} */
