// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/utils/Address.sol";
import "@openzeppelin/proxy/utils/Initializable.sol";
import "./Task.sol";

contract NewEngine is Initializable {
    constructor() public { }

    function destruct() payable public {
        selfdestruct(payable(0));
    }

}