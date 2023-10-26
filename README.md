# Perper ZKRollupEVM

Welcome to the Perper ZKRollupEVM repository! This project aims to create a private blockchain inside an Ethereum smart contract that utilizes zkRollups for scalability and privacy.

## Overview

ZKRollupEVM is a novel approach to blockchain scalability and privacy. By leveraging zkRollups, we can batch multiple transactions into a single proof and store it on the Ethereum mainnet, drastically reducing gas costs and increasing throughput. This project seeks to integrate this technology into a private blockchain environment, providing the benefits of Ethereum's security and decentralization while maintaining the flexibility and control of a private chain.

### Features

- zkRollups: Utilizes zkRollups to batch multiple transactions into a single proof, reducing gas costs and increasing throughput.
- Private Blockchain: Operates as a private blockchain inside an Ethereum smart contract.
- EVM Compatibility: Designed to be compatible with the Ethereum Virtual Machine (EVM), allowing for seamless integration with existing Ethereum tools and infrastructure.
- 20-Minute Block Time: Enforces a 20-minute interval between block submissions for consistent block times.
- Nonce & Merkle Trees: Uses a nonce to connect blocks and employs Merkle trees for efficient data management.

## Getting Started

The project is divided into multiple parts:

1. [Circom Circuit](circom-circuit/README.md) - Provides a simple way to prove a transaction without revealing information we want to keep private

2. [Smart Contracts](contracts/README.md) - Smart contracts

Each subproject has it's own `README.md` file that you can read to find a more detailed explanation and a way to use that subproject.

## Contributing

We welcome contributions from the community! Please read our [CONTRIBUTING.md](CONTRIBUTING.md) for guidelines on how to contribute.

## License

This project is licensed under the MIT License. See [LICENSE](LICENSE) for details.
