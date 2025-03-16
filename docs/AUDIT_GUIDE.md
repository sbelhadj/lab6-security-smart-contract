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
