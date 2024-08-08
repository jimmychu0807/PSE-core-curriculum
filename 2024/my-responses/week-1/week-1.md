# Week 1

## Week 1 Study Group

- [A guide to Zero Knowledge Proofs (Part 2)](https://medium.com/@Luca_Franceschini/a-guide-to-zero-knowledge-proofs-part-2-7904dee9758d)
- [nice intro on RSA algorithm](https://www.comparitech.com/blog/information-security/rsa-encryption/)
- Download power of tau here: https://github.com/iden3/snarkjs

## Week 1 Industry Keynotes
- zkemail
- prove.email (ZK email)
- check its github
- You can use email to transfer tokens

## My Responses

### Symmetric vs Assymmetric Encryption (AES, RSA)

Consider the Following:

1. What is the primary difference between symmetric and asymmetric encryption?

   Symmetric encryption use one key to encrypt and decrypt the message and cyphertext. Assymmetric encryption has a key setup process to generate a public key and private key. Then it uses the public key of a user to encrypt the message, and the key holder use the private key to decrypt the cyphertext.

2. Can you briefly explain how AES (Advanced Encryption Standard) works?

   AES is block cypher, so the data will be splitted into blocks of 128 bits (16 bytes). The last block can be padded with zeroes. Then the algorithm accepts a key, which can be in three lengths: 128 bits, 192 bits, and 256 bits.

   There is a **Key expansion phase**. The original key will be expanded to 128 bits: 10 keys, 192 bits: 12 keys, and 256 bits: 14 keys.

   In round 1:

   1. the 4x4 block data is XOR'ed with the key, then
   2. pass through an SP (substitution-permutation) network, then
   3. rotating the byte of each row, with the 1st row shifting 0 byte, 2nd row shifting one byte, 3rd row two bytes, and 4th row three bytes, then
   4. mixing the columns by multiplying a constant matrix to each column of the block data (there are a total of four columns).

   This completes one round. Now you will repeat this for all rounds, depending on your key length.

3. What makes RSA a popular choice for public-key encryption?

   RSA is popular because it doesn't require the two communicating parties to have a secure and private channel beforehand to exchange the passcode/key.

## Exercise

1. **Symmetric vs. Asymmetric Encryption**: What are the key differences between symmetric and asymmetric encryption? Provide a practical use case for each.

   **Ans**: Symmetric encryption use one key to encrypt and decrypt the message and cyphertext. Assymmetric encryption has a key setup process to generate a public key and private key. Then it uses the public key of a user to encrypt the message, and the key holder use the private key to decrypt the cyphertext.

   Use case for symmetric encryption: This can be used when the encrypter and the decrypter is the same person or when they have a secure and private way to communicate a key beforehand. A good use case would be encrypting the file system of a user local hard drive.

   Use case for assymmetric encryption: This can be used when there is no way to communicate a key securely and privately. A good use case is Alice want to send a message privately and securely to Bob. Alice uses Bob public key, which is broadcasted beforehand or publicly known, to encrypt the message to a cyphertext and Bob use his private key to decrypt the cyphertext back to the original message.

2. **Public-Key Cryptography and Key Exchange Protocols**: How can the Diffie-Hellman protocol enhance security in a messaging application?

   **Ans**: Deffie-Hellman protocol is as followed. Alice and Bob want to communicate to each other privately and securely:

   1. First they fix a large prime number $\textbf{p}$ (e.g 600 digits).
   2. Fix an integer $\textbf{g}$ in $\{1..p\}$.
   3. Alice randomly choose a secret value $\textbf{a}$ within $\{1..p - 1\}$ and Bob choose a secret value $\textbf{b}$ within the range.
   4. Alice sends Bob $g^a (mod\ p)$, and Bob sends Alice $g^b (mod\ p)$. It doesn't matter if any of these values are being eavedropped.
   5. In future both of them will use the key $g^{ab} (mod\ p)$ to encrypt messages sent between them. Alice can get this value by computing $(g^b)^a (mod\ p)$, and vice versa for Bob.

   Notice that eavedropper with $g^a (mod\ p)$ and $g^b (mod\ p)$, it is very difficult to compute $g^{ab} (mod\ p)$ back. This is called Deffie-Hellman assumption. So in this way they found a way to compose a secured, symmetric key even their messages are being eavedropped during the tranmission.

3. **Hash Functions**: What features make SHA-256 and Poseidon good hash functions for ensuring data integrity? Mention one unique advantage of Poseidon.

4. **Merkle Trees**: Explain how Merkle trees can help verify data in a large database efficiently.

5. **Cryptographic Commitments**: How can Pedersen Commitments be used in a blockchain protocol to maintain transaction privacy?

6. **Digital Signatures**: How can you verify the authenticity of a digitally signed document?
