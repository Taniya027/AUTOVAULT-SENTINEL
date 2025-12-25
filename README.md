# Autovault Sentinel

# Vault Health Monitoring on Stagenet

Autovault Sentinel is a Solidity-based ETH vault deployed on contract.dev Stagenet, designed to demonstrate how smart contract behavior can be observed, verified, and analyzed in real time using Stagenet’s native analytics and dashboards.
Rather than focusing on complex business logic, the project emphasizes observability, stability, and insight, showcasing how developers can gain confidence in contract behavior during development.

# Problem

Smart contracts often fail silently.
While contracts may compile and tests may pass, developers still lack clear visibility into:
-When deposits and withdrawals occur
-How vault balances evolve over time
-Whether unexpected or abnormal behavior is happening during testing
This lack of observability makes it difficult to validate contract behavior before mainnet deployment.

# Solution

Autovault Sentinel combines:
-A minimal ETH vault smart contract
-A live Stagenet deployment
-A custom analytics dashboard
Together, these provide continuous visibility into vault state and activity, allowing developers and reviewers to clearly understand how the contract behaves over time.

# Architecture Overview

* SentinelVault.sol
  ->Accepts ETH deposits
  ->Allows withdrawals
  ->Tracks cumulative deposits using totalDeposits()

* SentinelMonitor.sol
  ->A lightweight monitoring-focused contract
  ->Reads state from SentinelVault
  ->Designed to support observability without modifying core vault logic

* Stagenet Deployment

  ->Deployed on a private EVM testnet that replays mainnet blocks
  ->Integrated with GitHub-based CI/CD via contract.dev

* Analytics Dashboard
  ->Built using Stagenet’s native analytics tools
  ->Tracks vault balance, activity, and interaction patterns

# Stagenet Analytics Dashboard
The project includes a custom dashboard titled:

SentinelVault — Vault Health Dashboard

The dashboard contains the following components:

1. Current Vault Balance
Displays the current ETH balance held by the SentinelVault contract on Stagenet, confirming that the contract is deployed, funded, and actively receiving value.

2. Vault Balance (totalDeposits)
A line-chart visualization based on the totalDeposits() function.
This shows how the vault’s cumulative deposits change over time, making it easy to observe deposit activity, withdrawal impact, and sudden balance changes during testing.

3. Vault Activity Stream
A live stream of contract interactions, including:
Deposit and withdrawal calls
Caller addresses
ETH values sent
This provides immediate insight into how the vault is being used.

4. Wallet Interaction Monitoring
The dashboard also includes a Wallet Interactions view, showing which wallet addresses are interacting with the SentinelVault contract and how frequently.

This helps identify:
-Whether activity is concentrated or distributed
-How users interact with the vault during testing
-Potential anomalous interaction patterns early in development

# How to Test the Project

Judges and reviewers can test the project directly on Stagenet:
1. Open the SentinelVault Contract Workspace
2. Navigate to the Interact tab
3. Call deposit() with an ETH value
4. Observe updates in:
   Vault balance
   Balance trend chart
   Activity stream
5. Call withdraw(amount) and observe the corresponding changes

No additional setup is required.

# Use of Stagenet

This project actively uses Stagenet throughout development:

-GitHub repository linked for CI/CD
-Contracts automatically imported and versioned
-Deployments tracked in Contract Workspaces
-Custom analytics dashboard built using native tools
Stagenet is central to both development and evaluation.