require("@nomicfoundation/hardhat-toolbox");
require("dotenv").config();

module.exports = {
  solidity: "0.8.28",
  networks: {
    localhost: {
      url: "http://127.0.0.1:8545", // Local Hardhat network
    },
    apechain: {
       url: `https://apechain-curtis.g.alchemy.com/v2/${process.env.ALCHEMY_API_KEY}`,
       accounts: [`0x${process.env.PRIVATE_KEY}`]
       }
  },
};