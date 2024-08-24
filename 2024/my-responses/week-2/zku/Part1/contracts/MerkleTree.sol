//SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.0;

import { PoseidonT3 } from "./Poseidon.sol"; //an existing library to perform Poseidon hash on solidity
import "./verifier.sol"; //inherits with the MerkleTreeInclusionProof verifier contract

contract MerkleTree is Groth16Verifier {
  using PoseidonT3 for uint256[2];

  uint16 public constant TREE_LV = 3; // The root starts from lv 0, and grow downward.
  uint256[] public hashes; // the Merkle tree in flattened array form
  uint256 public index = 0; // the current index of the first unfilled leaf
  uint256 public root; // the current Merkle root

  // Errors
  error MerkleTreeIsFull();

  // Events

  constructor() {
    // [assignment] initialize a Merkle tree of 8 with blank leaves
    uint256 val = 0;
    uint256 leafNum = uint256(2 ** TREE_LV);
    for (uint256 nodeNum = leafNum; nodeNum > 0; nodeNum /= 2) {
      val = nodeNum == leafNum ? 0 : [val, val].poseidon();
      _pushMultiples(hashes, val, nodeNum);
    }
  }

  function _pushMultiples(uint256[] storage arr, uint256 el, uint256 times) private {
    for (uint256 i = 0; i < times; i++) {
      arr.push(el);
    }
  }

  function insertLeaf(uint256 hashedLeaf) public returns (uint256) {
    // [assignment] insert a hashed leaf into the Merkle tree
    uint256 maxLeafIdx = uint256((2 ** TREE_LV) - 1);
    if (index > maxLeafIdx) revert MerkleTreeIsFull();

    // uint256 nodeNum = uint256((2 ** (TREE_LV + 1)) - 1)
    uint256 remainder = index;
    uint256 newHash = hashedLeaf;
    uint256 accum = 0; // this is the index of the lefthand most node on that layer
    for (int16 lv = int16(TREE_LV); lv >= 0; --lv) {
      uint256 idx = accum + remainder;
      hashes[idx] = newHash;
      if (lv > 0) {
        // we don't need the following computation as we are at the root level already
        newHash = idx % 2 == 0
          ? [hashes[idx], hashes[idx+1]].poseidon()
          : [hashes[idx-1], hashes[idx]].poseidon();
        accum += (2 ** uint16(lv));
        remainder /= 2;
      }
    }

    return index++;
  }

  function verify(
    uint[2] memory a,
    uint[2][2] memory b,
    uint[2] memory c,
    uint[1] memory input
  ) public view returns (bool) {
    // [assignment] verify an inclusion proof and check that the proof root matches current root
  }
}
