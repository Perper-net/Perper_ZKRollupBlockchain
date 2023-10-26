// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ZKRollupBlockchain {
  struct Block {
    uint256 nonce;
    bytes32 previousHash;
    bytes32 merkleRoot; // Commitment to off-chain data
    bytes zkProof;      // ZKRollup proof for the batch of transactions
  }

  Block[] public blockchain;
  uint256 public lastBlockTimestamp = 0;
  uint256 public constant BLOCK_INTERVAL = 20 minutes;

  event BlockAdded(uint256 indexed blockNumber, bytes32 merkleRoot, bytes zkProof);

  constructor(bytes32 _merkleRoot) {
    Block memory genesisBlock;
    genesisBlock.merkleRoot = _merkleRoot;
    genesisBlock.previousHash = 0x0;
    blockchain.push(genesisBlock);
    lastBlockTimestamp = block.timestamp;
  }

  function addBlock(bytes32 _merkleRoot, bytes memory _zkProof) public {
    require(block.timestamp >= lastBlockTimestamp + BLOCK_INTERVAL, "Must wait for the next block interval");
    require(verifyProof(_merkleRoot, _zkProof), "Invalid ZKProof");

    Block memory newBlock;
    newBlock.merkleRoot = _merkleRoot;
    newBlock.zkProof = _zkProof;
    newBlock.previousHash = blockchain[blockchain.length - 1].merkleRoot;
    newBlock.nonce = randomNonce(newBlock.previousHash); 
    blockchain.push(newBlock);

    lastBlockTimestamp = block.timestamp;

    emit BlockAdded(blockchain.length - 1, newBlock.merkleRoot, _zkProof);
  }

  function randomNonce(bytes32 previousHash) internal view returns (uint256) {
    return uint256(keccak256(abi.encodePacked(block.timestamp, previousHash)));
  }

  function verifyProof(bytes32 _merkleRoot, bytes memory _zkProof) internal view returns (bool) {
    // After we figure out the circom circuit problem, we'll implement this function.
    return true;
  }
}
