#!/bin/bash
echo "🔍 Exécution de Mythril pour détecter des vulnérabilités..."
myth analyze contracts/VulnerableContract.sol
