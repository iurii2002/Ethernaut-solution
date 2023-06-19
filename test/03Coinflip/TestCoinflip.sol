// pragma solidity ^0.8.0;

// import "forge-std/Test.sol";
// import "../../src/03Coinflip/Task.sol";
// import "../../src/03Coinflip/Solution.sol";



// contract ConflipTest is Test {

//     CoinFlipCracker solution;
//     CoinFlip coinflip;

//     function setUp() public {
//         coinflip = new CoinFlip();
//         solution = new CoinFlipCracker(address(coinflip));
//     }

//     function test_flip() public {        
//         solution.winCoinFlip();
//         vm.roll(block.number + 1);
//         solution.winCoinFlip();
//         vm.roll(block.number + 1);
//         solution.winCoinFlip();
//         vm.roll(block.number + 1);
//         solution.winCoinFlip();
//         vm.roll(block.number + 1);
//         solution.winCoinFlip();
//         vm.roll(block.number + 1);
//         solution.winCoinFlip();
//         vm.roll(block.number + 1);
//         solution.winCoinFlip();
//         vm.roll(block.number + 1);
//         assertEq(coinflip.consecutiveWins(), 7);
//     }

// }
