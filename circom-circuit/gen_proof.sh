if [ ! -d "./powers_of_tau" ]
then
  mkdir powers_of_tau
fi

if [ ! -d "./zkey" ]
then
  mkdir zkey
fi

if [ ! -d "./proof" ]
then
  mkdir proof
fi

Verbose="-v"
if [[ "$*" == *"--not-verbose"* ]]
then
  Verbose=""
fi

# Start a new "Powers Of Tau" ceremony
snarkjs powersoftau new bn128 12 powers_of_tau/pot12_0000.ptau $Verbose

# Contribute to the ceremony
snarkjs powersoftau contribute powers_of_tau/pot12_0000.ptau powers_of_tau/pot12_0001.ptau --name="First contribution" $Verbose

# Phase 2
snarkjs powersoftau prepare phase2 powers_of_tau/pot12_0001.ptau powers_of_tau/pot12_final.ptau $Verbose

# Generate .zkey (contain the proving and verification keys together with all phase 2 contributions)
snarkjs groth16 setup transaction.r1cs powers_of_tau/pot12_final.ptau zkey/transaction_0000.zkey

# Contribute to the phase 2 of the ceremony
snarkjs zkey contribute zkey/transaction_0000.zkey zkey/transaction_0001.zkey --name="1st Contributor Name" $Verbose

# Export the verification key
snarkjs zkey export verificationkey zkey/transaction_0001.zkey proof/verification_key.json

# Gen proof
snarkjs groth16 prove zkey/transaction_0001.zkey witness.wtns proof/proof.json proof/public.json
