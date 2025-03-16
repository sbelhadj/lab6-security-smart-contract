// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract SecureContract {
    mapping(address => uint256) public balances;
    bool private locked;

    modifier noReentrancy() {
        require(!locked, "Pas de réentrance !");
        locked = true;
        _;
        locked = false;
    }

    function deposit() public payable {
        balances[msg.sender] += msg.value;
    }

    function withdraw() public noReentrancy {
        uint256 amount = balances[msg.sender];
        require(amount > 0, "Solde insuffisant");

        balances[msg.sender] = 0;
        (bool success, ) = msg.sender.call{value: amount}("");
        require(success, "Échec du transfert");
    }
}
