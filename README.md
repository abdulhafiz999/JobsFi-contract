# 🛠️ JobsFi Smart Contract

JobsFi is a decentralized job board platform built on the ApeChain testnet. It enables employers to post jobs and applicants to apply — all with Web3 transparency and accountability. The smart contract handles job postings, applications, and employer subscription logic.

## ⚙️ Features

- Post and close jobs (employers)
- Apply to jobs with resume & cover letter (job seekers)
- Employer subscription model using APE token (basic tier: 0.2 APE)
- Stores applications per job with mapping

## 📄 Smart Contract

- Language: Solidity (`0.8.x`)
- Contract Name: `JobBoard.sol`

## 🔐 Subscription Logic

Employers must pay `0.2 APE` to access job posting features. Subscriptions are stored and validated before allowing job posting actions.

## 🚀 Deployment

**Network:** ApeChain Testnet  
**Tool:** Hardhat  
**API Provider:** Alchemy

## 🧪 Run Locally

```bash
git clone https://github.com/abdulhafiz999/JobsFi-contract.git
cd JobsFi-contract
npm install
npx hardhat test
