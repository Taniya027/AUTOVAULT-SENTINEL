// SPDX-License-Identifier: MIT
pragma solidity ^0.8.28;

/**
 * @title SentinelVault
 * @notice A minimal ETH vault used to demonstrate
 *         deposit tracking, withdrawals, and on-chain observability.
 */
contract SentinelVault {
    /// @notice Total ETH deposited into the vault
    uint256 public totalDeposits;

    /// @notice Individual user balances
    mapping(address => uint256) public balances;

    /// @notice Emitted when a user deposits ETH
    event Deposited(address indexed user, uint256 amount);

    /// @notice Emitted when a user withdraws ETH
    event Withdrawn(address indexed user, uint256 amount);

    /**
     * @notice Deposit ETH into the vault
     */
    function deposit() external payable {
        require(msg.value > 0, "Deposit must be greater than zero");

        balances[msg.sender] += msg.value;
        totalDeposits += msg.value;

        emit Deposited(msg.sender, msg.value);
    }

    /**
     * @notice Withdraw ETH from the vault
     * @param amount Amount of ETH to withdraw
     */
    function withdraw(uint256 amount) external {
        require(amount > 0, "Amount must be greater than zero");
        require(balances[msg.sender] >= amount, "Insufficient balance");

        balances[msg.sender] -= amount;
        totalDeposits -= amount;

        (bool success, ) = msg.sender.call{value: amount}("");
        require(success, "ETH transfer failed");

        emit Withdrawn(msg.sender, amount);
    }

    /**
     * @notice Returns the total value locked (TVL)
     */
    function getTVL() external view returns (uint256) {
        return totalDeposits;
    }
}