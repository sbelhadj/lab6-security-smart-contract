# 🚀 Lab 6 : Audit et Sécurité des Smart Contracts  

## 🎯 Objectif  
Ce lab vous guide dans l’analyse des vulnérabilités des **Smart Contracts Solidity**, leur correction et l’utilisation d’outils d’audit comme **Slither** et **Mythril**.  

✅ **Analyser un Smart Contract vulnérable**  
✅ **Comprendre les failles de sécurité courantes**  
✅ **Utiliser des outils d’audit automatique pour détecter des vulnérabilités**  
✅ **Corriger et sécuriser un contrat**  

---

## 📂 Structure du repo  

```plaintext
📦 lab6-security-smart-contract
 ├── 📂 contracts               # Dossier contenant les Smart Contracts vulnérables et corrigés
 │    ├── VulnerableContract.sol # Contrat volontairement vulnérable
 │    ├── SecureContract.sol     # Contrat sécurisé après correction
 │
 ├── 📂 docs                     # Documentation et guides
 │    ├── LAB6_SETUP.md          # Instructions détaillées pour le Lab 6
 │    ├── AUDIT_GUIDE.md         # Guide d’audit de sécurité
 │
 ├── 📂 scripts                  # Scripts pour tester et auditer les contrats
 │    ├── audit-slither.sh       # Script d’audit avec Slither
 │    ├── audit-mythril.sh       # Script d’audit avec Mythril
 │
 ├── 📜 .gitignore               # Fichiers à ignorer dans le repo
 ├── 📜 README.md                # Présentation du Lab 6
 ├── 📜 package.json             # Dépendances du projet (Hardhat, Slither, Mythril)
 ├── 📜 LICENSE                  # Licence du projet

```
## Installer les outils de sécurité

```bash
npm install
bash scripts/audit-slither.sh
bash scripts/audit-mythril.sh
```

## Analyser un contrat vulnérable

```bash
npx hardhat test
```

✅ Félicitations ! Vous avez découvert et corrigé des vulnérabilités dans un Smart Contract !



## 📜 **`contracts/VulnerableContract.sol` (Smart Contract Vulnérable)**  

```solidity
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract VulnerableContract {
    mapping(address => uint256) public balances;

    function deposit() public payable {
        balances[msg.sender] += msg.value;
    }

    function withdraw() public {
        require(balances[msg.sender] > 0, "Solde insuffisant");
        (bool success, ) = msg.sender.call{value: balances[msg.sender]}("");
        require(success, "Échec du transfert");
        balances[msg.sender] = 0;
    }
}
```

⚠️ Problème : Ce contrat est vulnérable à une attaque de réentrance !
📌 Voir le fichier docs/AUDIT_GUIDE.md pour l’analyse de cette faille.

