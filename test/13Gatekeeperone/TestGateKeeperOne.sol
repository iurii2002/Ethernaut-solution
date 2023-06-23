pragma solidity ^0.8.0;

import "forge-std/Test.sol";
import "../../src/13GatekeeperOne/Task.sol";
import "../../src/13GatekeeperOne/Solution.sol";



contract GateKeeperTest is Test {

    GatekeeperOne task;
    AttackGatekeeperOne solution;

    function setUp() public {
        task = new GatekeeperOne();
        solution = new AttackGatekeeperOne(address(task));
    }

    function test_gatekeeper() public {       
    bytes8 gateKey = solution.calculate_key();

    for (uint gas = 0; gas <= 8191; gas++) {
        try task.enter{gas: 100000 + gas}(gateKey) {
            console.log("passed with gas ->", 100000 + gas);
            break;
        } catch {}
        }
      
        // assertEq(task.entrant(), msg.sender);
    }

}
