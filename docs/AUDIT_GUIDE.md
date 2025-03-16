# 🔍 Guide d’Audit de Sécurité pour les Smart Contracts  

## 🔹 Étape 1 : Identifier les Vulnérabilités  

### 🔥 Problèmes Courants  
| Vulnérabilité | Explication |
|--------------|-------------|
| **Reentrancy Attack** | Un attaquant peut exécuter plusieurs retraits avant que le solde ne soit mis à jour. |
| **Integer Overflow/Underflow** | Peut entraîner des erreurs de calcul. |
| **TX Origin Attack** | `tx.origin` peut être manipulé pour forcer des transactions non voulues. |

---

## 🔹 Étape 2 : Analyse avec Slither  

Slither est un outil d’audit statique pour Solidity.  

1️⃣ Installer Slither  
```bash
pip install slither-analyzer
```
2️⃣ Analyser un Smart Contract

```bash
slither contracts/VulnerableContract.sol
```

✅ Slither identifiera les problèmes comme la réentrance ou les dépassements de mémoire

## 🔹 Étape 3 : Analyse avec Mythril
1️⃣ Installer Mythril

```bash
pip install mythril
```

2️⃣ Scanner le contrat pour des vulnérabilités

```bash
myth analyze contracts/VulnerableContract.sol
```

✅ Mythril effectue une analyse avancée des flux d’exécution



## ✅ Exécution de l’attaque
### 📌 1️⃣ Installation des dépendances
```bash
npm install dotenv web3 fs path
```
### 📌 2️⃣ Déployer le contrat vulnérable
```bash
node scripts/deploy.js
```
### 📌 3️⃣ Lancer l’attaque
```bash
node scripts/exploit.js
```
💀 Attaque réussie ! Le contrat malveillant a drainé les fonds du contrat vulnérable !

### 🔥 Conclusion et Sécurisation
####🔹 Pourquoi ça marche ?
Le contrat VulnerableContract.sol effectue le transfert d’ETH avant de mettre à jour le solde. Le contrat attaquant exploite cette faiblesse en exécutant la fonction fallback() en boucle pour drainer les fonds.

####🔹 Comment corriger cette faille ?
✅ Mise à jour du solde avant d’envoyer l’ETH
✅ Utilisation du Checks-Effects-Interactions Pattern
✅ Ajout d’un modificateur noReentrancy

📌 Voir le fichier contracts/SecureContract.sol pour la version corrigée !

📚 Ressources Supplémentaires
📖 Documentation Solidity sur la Sécurité : Ethereum Smart Contract Security Best Practices
📖 Reentrancy Attack Explained : Ethereum.org

🚀 Bravo ! Vous avez exploité une faille et appris à la corriger ! 🔥


