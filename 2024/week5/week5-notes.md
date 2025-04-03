## MPC

- related to the shamir secret sharing algorithm?
- [Secure Multi-Party Computation](https://mirror.xyz/privacy-scaling-explorations.eth/v_KNOV_NwQwKV0tb81uBS4m-rbs-qJGvCx7WvwP4sDg)
  - on 2-party computation and multi-party computation
  - It takes serveral different ideas together
    - arithmetic circuit
    - oblivious transfer
    - garbled circuit
  - Finally there is a secret sharing by splitting a secret into pieces


# Programmable Cryptography

- [Beyond Zero-Knowledge: Programmable Cryptography](https://mirror.xyz/privacy-scaling-explorations.eth/xXcRj5QfvA_qhkiZCVg46Gn9uX8P_Ld-DXlqY51roPY)
- YT playlist of Programmable Cryptography: https://www.youtube.com/playlist?list=PL-ZQkds07L_oJA72_JCXK7_OnSNTevOks

Four golden lessons: https://www.nature.com/articles/426389a

## Survey on PSE MPC framework

- check [MPC framework](https://mpc.pse.dev/)
- It depends on garbled circuit impl [emp-wasm-backend](https://github.com/voltrevo/emp-wasm-backend)
- here is using the [garbled circuit](https://github.com/voltrevo/emp-wasm-backend/blob/main/src/EmpCircuit.ts), that depends on [emp-wasm](https://github.com/voltrevo/emp-wasm)
- garbled circuit YT explanation: https://www.youtube.com/watch?v=FMZ-HARN0gI
