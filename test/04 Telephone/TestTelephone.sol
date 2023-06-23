pragma solidity ^0.8.0;

import "forge-std/Test.sol";
import "../../src/04Telephone/Task.sol";
import "../../src/04Telephone/Solution.sol";



contract TelephoneTest is Test {

    Telephone task;
    SolutionTelephon solution;

    function setUp() public {
        task = new Telephone();
        solution = new SolutionTelephon(address(task));
    }

    function test_thephone() public {
        solution.changeOwnership(msg.sender);        
        assertEq(task.owner(), msg.sender);
    }

}
