## [A Primer for Zero Knowledge Proofs](../week0_course_primer.md#a-primer-for-zero-knowledge-proofs)

Consider the following:

1. What are zero-knowledge proofs?

   Zero-knowledge proof is one can prove he know certain knowledge without revealing the knowledge to a verifier. He does this by generating proofs, and if the verifier verifies the proof to be true, then it means the prover knows the knowledge.

2. What are the principles of soundness, completeness, and zero-knowledge?

   - **Soundness**: It means if the prover knows the secret, then it will be able to generate a proof that is verified to be true.

   - **Completeness**: If a proof is verified to be true, then the prover must know the secret. In practical terms, if a proof is verified to be true, the prover being able to fake a proof is statistically negligible.

   - **Zero-knowledge**: This means that no new knowledge is acquired by the verifier after the proof-interaction with provers. Specifically, Matthiew Green in his post says that a knowledge extractor on the verifier side couldn't extract any new knowledge from the prover.

3. What distinguishes interactive from non-interactive proofs?

   Normally performing a zero-knowledge proof involves many rounds of interaction between verifier giving out a challenge generated from a crypto-secured random number generator and prover reponding back with a proof. This requires the verifier to be always online to interact with provers. Fiat and Shamir comes up with a transformation protocol so that with a decent hash function (e.g. SHA256), it can replace the many interactions between provers and verifiers.
