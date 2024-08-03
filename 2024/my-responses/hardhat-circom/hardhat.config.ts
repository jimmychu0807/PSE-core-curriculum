import { HardhatUserConfig } from "hardhat/config";
import "@nomicfoundation/hardhat-toolbox-viem";
import "hardhat-circom";

const config: HardhatUserConfig = {
  solidity: "0.8.24",
  circom: {
    inputBasePath: "./circuits",
    outputBasePath: "./circuits/artifacts",
    // ptau download addr:
    // https://github.com/iden3/snarkjs
    ptau: "https://storage.googleapis.com/zkevm/ptau/powersOfTau28_hez_final_20.ptau",
    circuits: [{
      name: "merkletree",
      protocol: "plonk",
    }]
  }
};

export default config;
