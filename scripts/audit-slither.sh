#!/bin/bash
echo "🔍 Exécution de Slither pour auditer le Smart Contract..."
slither contracts/VulnerableContract.sol --print-function-summary
