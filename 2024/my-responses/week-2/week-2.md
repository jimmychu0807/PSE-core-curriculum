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

     1. The prover commit to certain computation results and send those commitments $C$ to the verifier.
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

     1. Convert a program to a bunch of constraints, and your input have to satisfy these constraints. like $x * x = 16$ then $x = 4$ if $x$ is an positive integer.

     2. With this constraint and input number, you try to prove the constraint really satisfy. In the case of PLONK, the main part of your proof are every gate is correctly compute and every neighbor gate is consistent. You just compute it in polynomial. That's why it seems complicated.

     You can apply many arithmetization techniques to convert a program to a proof. There are R1CS, Plonkish, AIR. You can also have different combination of proving scheme like Polynomial IOP and PCS that generate the proofs given the contraints.

   </details>
