const { buildModule } = require("@nomicfoundation/hardhat-ignition/modules");

module.exports = buildModule("JobBoardModule", (m) => {
  const jobBoard = m.contract("JobBoard"); // This name must match the actual contract name
  return { jobBoard };
});
