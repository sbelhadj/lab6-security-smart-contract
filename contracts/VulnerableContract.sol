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
