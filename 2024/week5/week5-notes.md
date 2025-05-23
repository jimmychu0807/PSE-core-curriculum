# Programmable Cryptography

- [Beyond Zero-Knowledge: Programmable Cryptography](https://mirror.xyz/privacy-scaling-explorations.eth/xXcRj5QfvA_qhkiZCVg46Gn9uX8P_Ld-DXlqY51roPY)
- YT playlist of Programmable Cryptography: https://www.youtube.com/playlist?list=PL-ZQkds07L_oJA72_JCXK7_OnSNTevOks

Four golden lessons: https://www.nature.com/articles/426389a

- overall [programmable cryptography industry map](./assets/pc-marketmap.pdf)

## ZKP

### Aztec Network

- https://aztec.network
- raised about $100M
- haven't launched a testnet yet. Still in devnet dev
- it is zk, but privacy-focus, not using zk for Ethereum scalability
- There is a private state, and public state. Then there is a private function and public function. Private function is executed on the client side, and have commitment verified on-chain. If you want to guarantee uniqueness within a scope, it will release nullifier as well.
- There is a [aztec.js](https://docs.aztec.network/developers/tutorials/codealong/js_tutorials/aztecjs-getting-started) that generate typescript and be the API on comm with Aztec devnet.
- It also has the Private execution env (PXE) on the client side to execute function privately.

Aztec-nr as Aztec smart contract framework

#### Noir

- Using noir to write circuit that
- it is converted to ultraPlonk or ultraHonk, PLONK is more expensive at proving but optimzied for on-chain verification. Honk is faster and uses less RAM but costlier at verification.
- the verifier can run in browser, or run on aztec network, or a solidity verifier.

#### next step
- you could implement a guessing game, or a zk-voting app on aztec network & noir

## MPC
- related to the shamir secret sharing algorithm?
- [Secure Multi-Party Computation](https://mirror.xyz/privacy-scaling-explorations.eth/v_KNOV_NwQwKV0tb81uBS4m-rbs-qJGvCx7WvwP4sDg)
  - on 2-party computation and multi-party computation
  - It takes serveral different ideas together
    - arithmetic circuit
    - oblivious transfer
    - garbled circuit
  - Finally there is a secret sharing by splitting a secret into pieces

### PSE MPC framework

- check [MPC framework](https://mpc.pse.dev/)
- It depends on garbled circuit impl [emp-wasm-backend](https://github.com/voltrevo/emp-wasm-backend)
- here is using the [garbled circuit](https://github.com/voltrevo/emp-wasm-backend/blob/main/src/EmpCircuit.ts), that depends on [emp-wasm](https://github.com/voltrevo/emp-wasm)
- garbled circuit YT explanation: https://www.youtube.com/watch?v=FMZ-HARN0gI

## FHE

### Zama

- [Zama FHE master plan](https://www.zama.ai/post/zama-fhe-master-plan). Zama has raised $73 million in a Series A in Mar 2025.

- fhEVM architecture
  ![architecture](./assets/zama/fhevm-archit.avif)

#### Core components

- [TFHE-rs](https://github.com/zama-ai/tfhe-rs)
  - Utilize GPU
- fhEVM/httpz
  - the [solidity library](https://github.com/zama-ai/httpz-contracts)
  - a [fhevm co-processor](https://github.com/zama-ai/httpz-backend)
  - and a gateway and Key Management system

- There is a bounty program, and this one is looking to build a [dApp](https://github.com/zama-ai/bounty-program/issues/144) wtih fhEVM library.

#### Key papers/blogposts

- The 4-part series [TFHE Deep Dive](https://docs.zama.ai/tfhe-rs/explanations/tfhe-deep-dive)
- [TFHE-rs handbook](./assets/zama/tfhe-rs-handbook.pdf)
- [fhevm whitepaper v2](./assets/zama/fhevm-whitepaper-v2.pdf)

#### Next Step
- you could implement a guessing game, or a zk-voting app on aztec network & noir

### Fhenix

- https://www.fhenix.io/
- It is mainly building an FHE-enabled layer 2 ([whitepaper](https://www.fhenix.io/fhe-rollups-scaling-confidential-smart-contracts-on-ethereum-and-beyond-whitepaper/)).

  But Zama is also building that with fhEVM / httpz.

- Fhenix and Zama fhEVM works are kind of overlapping...

## MP-FHE

Libraries that do multi-party FHE

- [Phantom Zone](https://github.com/phantomzone-org/phantom-zone)
- [Open FHE](https://openfhe.org/)
- [Lattigo](https://github.com/tuneinsight/lattigo)

## Quantum Computing

- it is much faster, can process pretty much in parallel
- a few qubits can hold a lot more info than traditional computer bits
- It is much faster to run shor algorithm on quantum computer and find the prime factor of a large number.
- ref:
  - video 1: https://www.youtube.com/watch?v=lvTqbM5Dq4Q
  - video 2: https://www.youtube.com/watch?v=jHoEjvuPoB8

# Exercise

## pc-voting app

1. Only certain address could vote
  - use a wallet to sign a message to prove their identity
  - the wallet must contain certain NFT or a certain amount of ERC20 tokens
2. Each vote must meet a certain criteria, e.g. each voter has 5 voting points, allocating to three candidates, each 0 - 3.
3. The vote is private to the rest of the world on blockchain.
4. At the end of voting period, these votes are tally up and the aggregate result is computed and released.
5. After the voting period, all voters can verify that their votes are being included in the tally count.
  - can retrieve # of total voters.
  - can check if a voter has voted, but cannot link a voter back to his vote.
