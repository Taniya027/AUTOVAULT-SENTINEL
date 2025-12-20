import { buildModule } from "@nomicfoundation/hardhat-ignition/modules";

const SentinelMonitorModule = buildModule("SentinelMonitorModule", (m) => {
  const vaultAddress = m.getParameter(
    "vaultAddress",
    "0x77ea2bc6e86dee8d263c5d3fa3f2d60428637a1b"
  );

  const largeDeposit = m.getParameter(
    "largeDepositThreshold",
    1000000000000000n // 0.001 ETH
  );

  const largeWithdraw = m.getParameter(
    "largeWithdrawThreshold",
    1000000000000000n // 0.001 ETH
  );

  const monitor = m.contract("SentinelMonitor", [
    vaultAddress,
    largeDeposit,
    largeWithdraw,
  ]);

  return { monitor };
});

export default SentinelMonitorModule; 