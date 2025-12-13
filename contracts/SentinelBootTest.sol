// SPDX-License-Identifier: MIT
pragma solidity ^0.8.28;

/// @notice Minimal contract to verify Stagenet deployment and CI/CD setup
contract SentinelBootTest {
    /// @notice Health-check function
    function ping() external pure returns (string memory) {
        return "Autovault Sentinel is live on Stagenet";
    }
}