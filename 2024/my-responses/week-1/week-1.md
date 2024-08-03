## Week 1 Study Group

- [A guide to Zero Knowledge Proofs (Part 2)](https://medium.com/@Luca_Franceschini/a-guide-to-zero-knowledge-proofs-part-2-7904dee9758d)
- [nice intro on RSA algorithm](https://www.comparitech.com/blog/information-security/rsa-encryption/)

## Week 1 Industry Keynotes
- zkemail
- prove.email (ZK email)
- check its github

- You can use email to transfer tokens

## Practical

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
- need to build a hardhat-circom template yourself
- Write a circuit to prove inclusion in Merkle tree
