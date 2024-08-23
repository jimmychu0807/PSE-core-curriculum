# Week 2

- Tonardo cash src: https://github.com/tornadocash/tornado-core/tree/master

+ Rareskills: On how tonardo cash works: https://www.rareskills.io/post/how-does-tornado-cash-work

+ Koh Wei Jie: On Semaphore: https://medium.com/coinmonks/to-mixers-and-beyond-presenting-semaphore-a-privacy-gadget-built-on-ethereum-4c8b00857c9b

- Ken: introduction to zk-SNARK: https://docs.google.com/presentation/d/18b1AQM6aHxIAhvTYjFSwBdO2iv_xZQUbKZTYpTNh1ac/edit#slide=id.g2eff15ba1eb_1_0

- Dankrad Feist article (very hard core, but it gets to all the details): https://dankradfeist.de/ethereum/2020/06/16/kate-polynomial-commitments.html

## Todo

- Pinocchio protocol: https://www.zeroknowledgeblog.com/index.php/the-pinocchio-protocol
- On Groth16: https://www.zeroknowledgeblog.com/index.php/groth16
- Vitalik on pairing (the 2nd section): https://medium.com/@VitalikButerin/exploring-elliptic-curve-pairings-c73c1864e627
- Vitalik on STARKs
  - part-1: https://vitalik.eth.limo/general/2017/11/09/starks_part_1.html
  - part-2: https://vitalik.eth.limo/general/2017/11/22/starks_part_2.html
  - part-3: https://vitalik.eth.limo/general/2018/07/21/starks_part_3.html
- Vitalik on PLONK: https://vitalik.eth.limo/general/2019/09/22/plonk.html
- Why and how zk-SNARK work: https://arxiv.org/pdf/1906.07221
- Read Groth16 paper (in your pse wk2 local folder)

## Exercises

1. What is a proof system?

   <details open>
     <summary><bold>Answer</bold></summary>

     A proof system involve a prover proving to a verifier that $f(x) = y$, that the prover know a secret value $x$ such that a public function $f$ is evaluated to $y$.

     This usually involved the following process:

     1. The prover commits to certain computation results and send those commitments $C$ to the verifier.
     2. The verifier will send a random value (or a group of random values) $r$ to the prover for him to compute.
     3. The prover will compute those results of $f(r) = v$ together with proofs $\pi$ and send them over to the verifier.
     4. The verifer will verify the result is indeed y, and check that the proofs $\pi$ are consistent with the commitments $C$ sent in step 1. If it all checks out, the verifier will accept the result, otherwise the verifier will reject.

     This is an interactive proof system. To make it non-interactive, we will apply fiat-shamir transform to the above process. So this turns into:

     1. The prover commit to certain computation results and send those commitments $C$ to the verifier.
     2. $C$ will be used as a source of entropy to generate the random values that are previously sent from the verifier. Usually a collision resistant hash will do here.
     3. The prover will than compute all the values ($f(r)$) based on the generated random values with proofs $\pi$. Then the prover will send all these values to the verifier.
     4. The verifier will perform the usual step 4 as aforementioned.

   </details>

2. What is input, witness, circuit, and proof?

   <details open>
     <summary><bold>Answer</bold></summary>

     **input**: it is the input values a prover input to the proof system.

     **witness**: it is a set of public and private inputs that satisfy the circuit contraints.

     **circuit**: It is a set of contraint generated that the input has to satisfy.

     **proof**: It is some computed value to show that the prover indeed perform certain calculations as he claimed.

   </details>

3. How does program convert to proof?

   <details open>
     <summary><bold>Answer</bold></summary>

     The process of converting a program to a proof is:

     1. Convert a program to a bunch of constraints (also called circuit), and your input have to satisfy these constraints. like $x * x = 16$ then $x = 4$ if $x$ is an positive integer. The circuits are eventually resolved into a few polynomials (like from 5 - 20) that need to be satisfied. This step is called arithmetization. There are "R1CS" way, "PLONKish" way (generating Gate and Copy constraints).

     2. Then you pick a commitment scheme. One of the most popular schemes is KZG Commitment (aka Kate commitment). This scheme is based on a "substract-and-divide" technique and ensure the quotient part is a polynomial with no remainder. The prover first send a commitment to the verifier and then a calculation result with a proof. The prover uses elliptic curve discrete log assumption to hide the input from the verifier. The verifier will perform an elliptic curve pairing at the end to verify two sides of the equation are the same.

   </details>

4. Compare hashes **SHA256**, **MiMC**, **Poseidon**, and **Pedersen** in terms of gas cost, capacity, proof generation efficiency, and proof size.

   <details open>
     <summary><bold>Answer</bold></summary>

     Answer comes from chatGTP 🙂

     When comparing cryptographic hash functions like SHA-256, MiMC, Poseidon, and Pedersen, especially in the context of blockchain and zero-knowledge proofs (ZKPs), several factors come into play. Below is a comparative overview:

     | **Feature** | **SHA-256** | **MiMC**  | **Poseidon** | **Pedersen** |
     |-------------|-------------|-----------|--------------|--------------|
     | **Gas Cost**| High   | Moderate to High | Low to Moderate  | Low    |
     | **Capacity**| Fixed  | Flexible       | Flexible     | Fixed        |
     | **Proof Generation** | Inefficient in zk-SNARKs | Efficient  | Highly Efficient in zk-SNARKs | Efficient |
     | **Proof Size** | Large | Moderate     | Small        | Small        |

     Detailed Analysis

     1. SHA-256 Hash
        - Gas Cost: Higher gas cost on Ethereum and similar platforms due to complex operations that aren't native to elliptic curve operations.
        - Capacity: Provides a fixed-length output (256 bits).
        - Proof Generation: Not efficient for zk-SNARKs due to its bitwise structure, which is not suitable for arithmetic circuits used in ZKP systems.
        - Proof Size: Larger compared to specialized hash functions; not optimized for constructing concise proofs.

      2. MiMC Hash
         - Gas Cost: Generally moderate to high because it is designed for ZKP but involves several arithmetic operations.
         - Capacity: Flexible, as it can be tailored for different circuit sizes.
         - Proof Generation: MiMC is designed to be efficient for proof generation in zk-SNARKs by using simple arithmetic operations.
         - Proof Size: Moderate; optimized for use in ZKP, but larger than Poseidon.

      3. Poseidon Hash
         - Gas Cost: Lower than SHA-256 and MiMC when used in zk-SNARKs because it is designed to minimize arithmetic complexity on elliptic curves.
         - Capacity: Highly flexible, optimized for various inputs and digest lengths.
         - Proof Generation: Highly efficient due to its algebraic structure designed for zk-SNARKs, leading to faster proof generation.
         - Proof Size: Small; this is one of its significant advantages in proof systems like zk-SNARKs.

      4. Pedersen Hash
         - Gas Cost: Typically low in platforms that natively support elliptic curve operations since it leverages group operations.
         - Capacity: Fixed, determined by the elliptic curve used.
         - Proof Generation: Efficient due to its use of linear operations which translate well to zk-proofs.
         - Proof Size: Small, as it benefits from elliptic curve mathematics that are succinct and efficient.

      In summary, Poseidon hash and Pedersen hash are widely popular choices within zk-SNARK applications.

   </details>
