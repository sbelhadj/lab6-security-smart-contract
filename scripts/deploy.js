require('dotenv').config();
const Web3 = require('web3');
const fs = require('fs');
const path = require('path');

const web3 = new Web3(`https://sepolia.infura.io/v3/${process.env.INFURA_PROJECT_ID}`);
const account = web3.eth.accounts.privateKeyToAccount(process.env.ATTACKER_PRIVATE_KEY);
web3.eth.accounts.wallet.add(account);

const contractABI = JSON.parse(fs.readFileSync(path.join(__dirname, '../build/VulnerableContractABI.json')));
const contractBytecode = fs.readFileSync(path.join(__dirname, '../build/VulnerableContractBytecode.txt')).toString();

async function deployContract() {
    console.log("Déploiement du contrat vulnérable...");

    const deployTx = new web3.eth.Contract(contractABI)
        .deploy({ data: contractBytecode });

    const gas = await deployTx.estimateGas({ from: account.address });
    const deploy = await deployTx.send({ from: account.address, gas });

    console.log(`✅ Contrat vulnérable déployé à : ${deploy.options.address}`);
}

deployContract();
