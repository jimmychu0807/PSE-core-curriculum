pragma circom 2.1.8;

include "../node_modules/circomlib/circuits/poseidon.circom";
include "../node_modules/circomlib/circuits/mux1.circom";

template CheckRoot(n) { // compute the root of a MerkleTree of n Levels 
  signal input leaves[2**n];
  signal output root;
  signal nodes[2**n];

  //[assignment] insert your code here to calculate the Merkle root from 2^n leaves
  component hasher2[2**n];

  var accum = 0;
  var currLayerOffset = 0;
  var nextLayerNum = 2**n;
  while (nextLayerNum > 1) {
    nextLayerNum /= 2;
    for (var i = 0; i < nextLayerNum; i++) {
      hasher2[accum + i] = Poseidon(2);
      hasher2[accum + i].inputs[0] <== accum == 0 ? leaves[2*i] : nodes[currLayerOffset + 2*i];
      hasher2[accum + i].inputs[1] <== accum == 0 ? leaves[2*i + 1] : nodes[currLayerOffset + 2*i + 1];
      nodes[accum + i] <== hasher2[accum + i].out;
    }
    currLayerOffset = accum;
    accum += nextLayerNum;
  }
  root <== nodes[currLayerOffset];
}

template MerkleTreeInclusionProof(n) {
  signal input leaf;
  signal input path_elements[n];
  signal input path_index[n]; // path index are 0's and 1's indicating whether the current element is on the left or right
  signal output root; // note that this is an OUTPUT signal

  //[assignment] insert your code here to compute the root from a leaf and elements along the path
  signal nodes[n + 1];
  component hasher2[n];
  component muxes[n];

  nodes[0] <== leaf;
  for (var i = 0; i < n; i++) {
    hasher2[i] = Poseidon(2);
    muxes[i] = Mux1();
    muxes[i].c[0] <== path_elements[i];
    muxes[i].c[1] <== nodes[i];
    muxes[i].s <== path_index[i];
    hasher2[i].inputs[0] <== muxes[i].out;
    hasher2[i].inputs[1] <== nodes[i] + path_elements[i] - muxes[i].out;
    nodes[i+1] <== hasher2[i].out;
  }
  root <== nodes[n];
}
