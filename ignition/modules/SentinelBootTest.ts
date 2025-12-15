import { buildModule } from "@nomicfoundation/hardhat-ignition/modules";

export default buildModule("SentinelBootTestModule", (m) => {
  const bootTest = m.contract("SentinelBootTest");

  return { bootTest };
});