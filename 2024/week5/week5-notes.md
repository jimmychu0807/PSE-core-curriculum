# Programmable Cryptography

- [Beyond Zero-Knowledge: Programmable Cryptography](https://mirror.xyz/privacy-scaling-explorations.eth/xXcRj5QfvA_qhkiZCVg46Gn9uX8P_Ld-DXlqY51roPY)
- YT playlist of Programmable Cryptography: https://www.youtube.com/playlist?list=PL-ZQkds07L_oJA72_JCXK7_OnSNTevOks

Four golden lessons: https://www.nature.com/articles/426389a

## MPC

- related to the shamir secret sharing algorithm?
- [Secure Multi-Party Computation](https://mirror.xyz/privacy-scaling-explorations.eth/v_KNOV_NwQwKV0tb81uBS4m-rbs-qJGvCx7WvwP4sDg)
  - on 2-party computation and multi-party computation
  - It takes serveral different ideas together
    - arithmetic circuit
    - oblivious transfer
    - garbled circuit
  - Finally there is a secret sharing by splitting a secret into pieces

## PSE MPC framework

- check [MPC framework](https://mpc.pse.dev/)
- It depends on garbled circuit impl [emp-wasm-backend](https://github.com/voltrevo/emp-wasm-backend)
- here is using the [garbled circuit](https://github.com/voltrevo/emp-wasm-backend/blob/main/src/EmpCircuit.ts), that depends on [emp-wasm](https://github.com/voltrevo/emp-wasm)
- garbled circuit YT explanation: https://www.youtube.com/watch?v=FMZ-HARN0gI

## Zama

- [Zama FHE master plan](https://www.zama.ai/post/zama-fhe-master-plan)
  Zama has raised $73 million in a Series A

- fhEVM architecture
  ![architecture](./assets/zama/fhevm-archit.avif)

Core components
- [TFHE-rs](https://github.com/zama-ai/tfhe-rs)
  - Utilize GPU
- fhEVM/httpz
  - the [solidity library](https://github.com/zama-ai/httpz-contracts)
  - a [fhevm co-processor](https://github.com/zama-ai/httpz-backend)
  - and a gateway and Key Management system

- There is a bounty program, and this one is looking to build a [dApp](https://github.com/zama-ai/bounty-program/issues/144) wtih fhEVM library.

## Quantum Computing

- it is much faster, can process pretty much in parallel
- a few qubits can hold a lot more info than traditional computer bits
- It is much faster to run shor algorithm on quantum computer and find the prime factor of a large number.
- ref:
  - video 1: https://www.youtube.com/watch?v=lvTqbM5Dq4Q
  - video 2: https://www.youtube.com/watch?v=jHoEjvuPoB8
