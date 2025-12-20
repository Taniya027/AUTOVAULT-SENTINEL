// SPDX-License-Identifier: MIT
pragma solidity ^0.8.28;

/// @notice Lightweight monitoring contract for SentinelVault activity
contract SentinelMonitor {
    address public immutable vault;
    uint256 public largeDepositThreshold;
    uint256 public largeWithdrawThreshold;

    event LargeDepositDetected(address indexed from, uint256 amount);
    event LargeWithdrawDetected(address indexed to, uint256 amount);

    constructor(
        address _vault,
        uint256 _largeDepositThreshold,
        uint256 _largeWithdrawThreshold
    ) {
        vault = _vault;
        largeDepositThreshold = _largeDepositThreshold;
        largeWithdrawThreshold = _largeWithdrawThreshold;
    }

    /// @notice Called after a deposit to check if it crosses alert threshold
    function checkDeposit(uint256 amount) external {
        if (amount >= largeDepositThreshold) {
            emit LargeDepositDetected(msg.sender, amount);
        }
    }

    /// @notice Called after a withdrawal to check if it crosses alert threshold
    function checkWithdraw(uint256 amount) external {
        if (amount >= largeWithdrawThreshold) {
            emit LargeWithdrawDetected(msg.sender, amount);
        }
    }
}