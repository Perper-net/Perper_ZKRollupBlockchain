# Perper ZKRollup Blockchain

![Perper ZKRollup Blockchain Logo](images/perper-logo.png)

Welcome to the `Perper ZKRollup Blockchain` repository! Initially conceived as a solution for the [perper.net](https://perper.net) ecosystem, our vision has expanded. We aim to evolve into a formidable player in the Ethereum Layer 2 (L2) Blockchain space.

## Overview

Perper ZKRollup Blockchain is a novel approach to blockchain scalability and privacy. By leveraging zkRollups, we can batch multiple transactions into a single proof and store it on the Ethereum mainnet, drastically reducing gas costs and increasing throughput. This project seeks to integrate this technology into a private blockchain environment, providing the benefits of Ethereum's security and decentralization while maintaining the flexibility and control of a private chain.

## 🌟 Vision

In the initial phase, our primary focus is to cater to the specific needs of the [perper.net](https://perper.net) ecosystem. However, as we progress, we envision Perper ZKRollup Blockchain to stand as a robust Ethereum L2 solution. Our ambition is not just to be another player but to redefine the standards of scalability, privacy, and efficiency in the blockchain world.

## 🤝 Join the Movement

We believe in the power of community. As we embark on this journey to reshape the blockchain landscape, we invite enthusiasts, developers, and visionaries to join us. Your contribution today can make you a part of the core coding team, and based on your engagement, you'll be rewarded with future blockchain tokens.

### Features

- zkRollups: Harnessing the power of zkRollups to batch multiple transactions, ensuring reduced gas costs and heightened throughput.
- Ethereum Compatibility: Crafted to seamlessly integrate with the Ethereum Virtual Machine (EVM).

20-Minute Block Time
Leveraging the power of zkRollups, all transactions on the Perper ZKRollup Blockchain are processed almost instantly, ensuring a seamless user experience. However, to make these transactions visible on the blockchain, there's a consistent 20-minute interval between block submissions. This design choice is rooted in our vision to keep transaction fees extremely low. By batching multiple transactions and submitting them at regular intervals, we can drastically reduce the cost per transaction, making the blockchain more accessible and affordable for all users.

- Nonce & Merkle Trees: Incorporating nonce for block connectivity and Merkle trees for streamlined data management.

## Getting Started

The project is divided into multiple parts:

1. [Circom Circuit](circom-circuit/README.md) - Provides a simple way to prove a transaction without revealing information we want to keep private

2. [Smart Contracts](contracts/README.md) - Smart contracts

Each subproject has it's own `README.md` file that you can read to find a more detailed explanation and a way to use that subproject.

## Contributing

We welcome contributions from the community! Please read our [CONTRIBUTING.md](CONTRIBUTING.md) for guidelines on how to contribute.

## License

This project is licensed under the MIT License. See [LICENSE](LICENSE) for details.
