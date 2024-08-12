# Week 2

- Tonardo cash src: https://github.com/tornadocash/tornado-core/tree/master

- Rareskills: On how tonardo cash works: https://www.rareskills.io/post/how-does-tornado-cash-work

- Koh Wei Jie: On Semaphore: https://medium.com/coinmonks/to-mixers-and-beyond-presenting-semaphore-a-privacy-gadget-built-on-ethereum-4c8b00857c9b

- Ken: introduction to zk-SNARK: https://docs.google.com/presentation/d/18b1AQM6aHxIAhvTYjFSwBdO2iv_xZQUbKZTYpTNh1ac/edit#slide=id.g2eff15ba1eb_1_0

- Dankrad Feist article (very hard core, but it gets to all the details): https://dankradfeist.de/ethereum/2020/06/16/kate-polynomial-commitments.html

- On Groth16: https://www.zeroknowledgeblog.com/index.php/groth16

- Why and how zk-SNARK work: https://arxiv.org/pdf/1906.07221

## Exercises

1. What is a proof system?

   <details open>
     <summary>Answer</summary>

     A proof system involve a prover proving to a verifier that $f(x) = y$, that the prover know a secret value $x$ such that a public function $f$ is evaluated to $y$.

     This usually involved the following proces:

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
     <summary>Answer</summary>

   </details>

3. How does program convert to proof?
