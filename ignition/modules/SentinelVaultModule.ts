import { buildModule } from "@nomicfoundation/hardhat-ignition/modules";

const SentinelVaultModule = buildModule("SentinelVaultModule", (m) => {
  const vault = m.contract("SentinelVault");

  return { vault };
});

export default SentinelVaultModule;