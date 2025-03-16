# 🚀 **Lab 6 : Audit et Sécurité des Smart Contracts**  

## 🎯 **Objectif du Lab**  
Dans ce lab, nous allons apprendre à :  
✅ Identifier les vulnérabilités courantes des Smart Contracts Solidity  
✅ Utiliser des outils d’audit automatisés (**Slither, Mythril**)  
✅ Exploiter une **attaque de réentrance** pour vider un contrat vulnérable  
✅ Appliquer les meilleures pratiques pour **sécuriser un Smart Contract**  

---

## 📂 **1️⃣ Prérequis**  

Avant de commencer, assurez-vous d’avoir les outils suivants installés :  

### 🔹 **Outils requis**  
| Outil | Utilité | Installation |
|-------|---------|-------------|
| **Node.js & npm** | Exécution de scripts Web3.js | `sudo apt install nodejs npm` |
| **Metamask** | Gestion des comptes Ethereum | [🔗 Installer](https://metamask.io/) |
| **Infura** | Accès aux nœuds Ethereum | [🔗 Créer un compte](https://infura.io/) |
| **Hardhat** | Framework de développement Ethereum | `npm install --save-dev hardhat` |
| **Slither** | Analyse statique de sécurité | `pip install slither-analyzer` |
| **Mythril** | Analyse dynamique des vulnérabilités | `pip install mythril` |

### 🔹 **Configurer Metamask avec Sepolia**  
1️⃣ **Ouvrir Metamask** → Aller dans **Paramètres > Réseaux > Ajouter un Réseau**  
2️⃣ **Entrer les informations suivantes :**  
   - **Nom** : Sepolia  
   - **RPC URL** : `https://sepolia.infura.io/v3/YOUR_INFURA_PROJECT_ID`  
   - **Chain ID** : `11155111`  
   - **Explorateur** : `https://sepolia.etherscan.io/`  
3️⃣ **Obtenir des ETH Sepolia** via un Faucet :  
   - 🔗 [Alchemy Sepolia Faucet](https://www.alchemy.com/faucets/ethereum-sepolia)  

---

## 📜 **2️⃣ Installation des dépendances**  

```bash
npm install
```

## 🔍 3️⃣ Audit de Sécurité avec Slither
### 📌 1️⃣ Exécuter une analyse de sécurité sur VulnerableContract.sol
```bash
slither contracts/VulnerableContract.sol
```

✅ Résultat attendu : Slither détectera des failles comme la réentrance.

### 📌 2️⃣ Vérifier les failles identifiées
Slither affichera un rapport détaillé avec des recommandations.

## 🔥 4️⃣ Exploitation de la Vulnérabilité de Réentrance
### 📌 1️⃣ Déployer le Contrat Vulnérable
```bash
node scripts/deploy.js
```

✅ Ce script va déployer VulnerableContract.sol sur Sepolia Testnet.

### 📌 2️⃣ Exécuter l’Attaque avec Attacker.sol
```bash
node scripts/exploit.js
```

✅ Résultat attendu : Le contrat attaquant va drainer les fonds du contrat vulnérable.

## 🔐 5️⃣ Sécurisation du Contrat
Après l’attaque, nous allons sécuriser le contrat en appliquant :
✅ Checks-Effects-Interactions Pattern
✅ Modificateur noReentrancy

### 📌 1️⃣ Comparaison des deux versions
Version	Problème	Correction
VulnerableContract.sol	Réentrance	Un attaquant peut drainer les fonds.
SecureContract.sol	Sécurisé	Ajout d’un verrou (noReentrancy).

### 📌 2️⃣ Déployer la version sécurisée
```bash
node scripts/deploy-secure.js
```

✅ Résultat attendu : Le contrat sécurisé empêchera l’attaque.

## 🛠 6️⃣ Vérification avec Mythril
###📌 1️⃣ Scanner VulnerableContract.sol avec Mythril
```bash
myth analyze contracts/VulnerableContract.sol
```

✅ Résultat attendu : Mythril affichera un avertissement sur la réentrance.

### 📌 2️⃣ Scanner SecureContract.sol pour vérifier la correction
```bash
myth analyze contracts/SecureContract.sol
```
✅ Résultat attendu : Aucun problème détecté.

## ✅ 7️⃣ Récapitulatif
Étape	Action
🔍 Audit avec Slither	Détection des vulnérabilités
💀 Exploitation	Exécution de l’attaque de réentrance
🔐 Sécurisation	Correction avec noReentrancy
🔎 Vérification avec Mythril	Validation de la correction
📚 8️⃣ Ressources Supplémentaires
📖 Documentation Solidity sur la Sécurité : Ethereum Smart Contract Security Best Practices
📖 Reentrancy Attack Explained : Ethereum.org

🚀 Bravo ! Vous avez complété ce lab et appris à sécuriser un Smart Contract ! 🔥

