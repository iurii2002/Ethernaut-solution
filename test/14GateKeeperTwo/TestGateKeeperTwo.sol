pragma solidity ^0.8.0;

import "forge-std/Test.sol";
import "../../src/14GateKeeperTwo/Task.sol";
import "../../src/14GateKeeperTwo/Solution.sol";



contract GateKeeperTest is Test {

    GatekeeperTwo task;
    GatekeeperTwoAttack solution;

    function setUp() public {
        task = new GatekeeperTwo();
        solution = new GatekeeperTwoAttack(address(task));
    }

    function test_gatekeeper_two() public {
        console.logAddress(tx.origin);
        console.logAddress(msg.sender);
        console.logUint(type(uint64).max);
        console.logUint(uint64(bytes8(keccak256(abi.encodePacked(msg.sender)))));
        console.logBytes8(solution.gateKey());
        console.logUint(uint64(bytes8(keccak256(abi.encodePacked(msg.sender)))) ^ uint64(solution.gateKey()));
    }
}
