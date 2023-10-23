# Transaction circuit

## Explanation

The circuit `transaction.circom` is meant as a simple `template` that should prove a transaction with these signals:

Input signals:
 - `balanceInSender`
 - `balanceInReceiver`
 - `amount`

Output signals:
 - `balanceOutSender`
 - `balanceOutReceiver`

While the template looks fine to me, when proving it, an error occurs during the `C Points` calculations.

The `input.json` is a sample input that should work correctly.

## Installation

Please follow the instructions from here https://docs.circom.io/getting-started/installation to install the `circom` compiler and `snarkjs`.

## Build & prove

1. Run `./build.sh` to generate `WASM` code for witness generation
2. Run `./gen_witness.sh` to generate the witness from the `input.json`
3. Run `./gen_proof.sh`. The last command in the file is the one that creates the problem
  - `snarkjs groth16 prove zkey/transaction_0001.zkey witness.wtns proof/proof.json proof/public.json`

For an explanation on all of the commands you can visit the other parts of the circom getting started guide:
 - https://docs.circom.io/getting-started/writing-circuits
 - https://docs.circom.io/getting-started/compiling-circuits
 - https://docs.circom.io/getting-started/computing-the-witness
 - https://docs.circom.io/getting-started/proving-circuits

## Error

You can find the whole log (which I created by going through source code and adding `console.log`) and error in `error.log` file.

### Explanation

What I've gathered from looking into the code where the error happens is that some data called `C Points` from the `zkey` is an array that's empty when it shouldn't be.

Well, I don't know whether it should or should not be empty, but it seems like it's expected to be non-empty because when empty it causes a `Division by zero` error, so the `sScalar` below becomes `NaN`.

It also seems that the data array that's gotten from the witness file that should be used in the function bellow is also empty, which I'm also not sure if it's allowed to be.

The error only happens on those `C Points`, and not on any data (`Points`) before them.
The whole output for the `_multiExp` function for all the other points is in the `error.log` file.
This one is just for the `C Points`.

From `_multiExp` function:

```log
logText: multiexp C (C Points)
buffBases: Uint8Array(0) []
buffScalars: Uint8Array(0) []
buffBases.byteLength: 0
buffScalars.byteLength: 0
nPoints: 0
sScalar: NaN
sGIn: 64
inType: affine
```