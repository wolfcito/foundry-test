# Foundry Mode Template

## Foundry Project for Deployment and Verification of Contracts on the Mode Network

This Foundry project is designed as a comprehensive template to streamline the efficient deployment and verification of contracts on the Mode Network. The initial configuration provides a solid framework that accelerates the development process and ensures the successful implementation of smart contracts.

## Deploy and Verify

```shell
forge create --rpc-url https://sepolia.mode.network --private-key <your-private-key> src/Counter.sol:Counter --verify --verifier blockscout --verifier-url https://sepolia.explorer.mode.network/api\?
```

## Key features

Predefined Configuration: The project includes an initial configuration ready for deployment, eliminating the complexity associated with setting up the environment.

Deployment Automation: An automated system for deploying contracts on the Mode Network has been integrated, reducing the time required for this critical task.

Verification Tools: Dedicated tools are incorporated to verify the proper execution of contracts, ensuring the desired integrity and functionality.

**Foundry is a blazing fast, portable and modular toolkit for Ethereum application development written in Rust.**

Foundry consists of:

- **Forge**: Ethereum testing framework (like Truffle, Hardhat and DappTools).
- **Cast**: Swiss army knife for interacting with EVM smart contracts, sending transactions and getting chain data.
- **Anvil**: Local Ethereum node, akin to Ganache, Hardhat Network.
- **Chisel**: Fast, utilitarian, and verbose solidity REPL.

## Documentation

https://book.getfoundry.sh/

## Usefull commands

- Build

```shell
forge build
```

- Test

```shell
forge test
```

- Format

```shell
forge fmt
```

- Gas Snapshots

```shell
forge snapshot
```

- Anvil

```shell
anvil
```

- Deploy

```shell
forge create --rpc-url https://sepolia.mode.network --private-key <your-private-key> src/Counter.sol:Counter
```

- Cast

```shell
cast <subcommand>
```

- Help

```shell
forge --help
anvil --help
cast --help
```
