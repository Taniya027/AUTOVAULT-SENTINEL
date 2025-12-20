// SPDX-License-Identifier: MIT
pragma solidity ^0.8.28;

/**
 * @title SentinelVault
 * @notice A minimal ETH vault used to demonstrate
 *         deposit tracking, withdrawals, and on-chain observability.
 */
contract SentinelVault {
    //State
    address public owner;
    uint256 public totalDeposits;
    
    ISentinelMonitor public monitor;
    
    //Events
    event Deposited(address indexed from, uint256 amount);
    event Withdrawn(address indexed to, uint256 amount);

    //Modifiers
    modifier onlyOwner() {
        require(msg.sender == owner, "Not owner");
        _;
    }

    //Constructor
    constructor() {
        owner = msg.sender;
    }

    //Monitor Configuration
    /// @notice Attach or update the SentinelMonitor contract
    function setMonitor(address _monitor) external onlyOwner {
        monitor = ISentinelMonitor(_monitor);
    }

    //Vault Operations
    /// @notice Deposit ETH into the vault
    function deposit() external payable {
        require(msg.value > 0, "Zero deposit");

        totalDeposits += msg.value;
        emit Deposited(msg.sender, msg.value);

        // Notify monitor (if configured)
        if (address(monitor) != address(0)) {
            monitor.checkDeposit(msg.value);
        }
    }

    /// @notice Withdraw ETH from the vault
    function withdraw(uint256 amount) external onlyOwner {
        require(amount > 0, "Zero withdraw");
        require(amount <= totalDeposits, "Insufficient balance");

        totalDeposits -= amount;
        emit Withdrawn(msg.sender, amount);

        // Notify monitor (if configured)
        if (address(monitor) != address(0)) {
            monitor.checkWithdraw(amount);
        }

        payable(owner).transfer(amount);
    }
}

//Monitor Interface

interface ISentinelMonitor {
    function checkDeposit(uint256 amount) external;
    function checkWithdraw(uint256 amount) external;
}