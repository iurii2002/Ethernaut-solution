pragma solidity ^0.8.0;

import "forge-std/console.sol";
import "forge-std/Test.sol";
import "../../src/26DoubleEntry/Task.sol";
import "../../src/26DoubleEntry/Solution.sol";



contract TestDoubleEntry is Test {

    CryptoVault public vault;
    LegacyToken public legacyToken;
    DoubleEntryPoint public doubleEntryTokenl;
    Forta public forta;

    MyFortaBot public myDetectionBot;

    function setUp() public {
        vault = new CryptoVault(msg.sender);
        legacyToken = new LegacyToken();
        forta = new Forta();

        myDetectionBot = new MyFortaBot(address(vault), address(forta));
        // forta.setDetectionBot(address(myDetectionBot));

        doubleEntryTokenl = new DoubleEntryPoint(address(legacyToken), address(vault), address(forta), msg.sender);
        vault.setUnderlying(address(doubleEntryTokenl));

        legacyToken.mint(address(vault), 100 ether);
        legacyToken.delegateToNewContract(doubleEntryTokenl);
        
    }

    function testSweep() public {
        uint alertsBefore = forta.botRaisedAlerts(msg.sender);

        console.logAddress(msg.sender);
        // console.logAddress(address(myDetectionBot));
        vm.prank(msg.sender);
        forta.setDetectionBot(address(myDetectionBot));

        console.logAddress(address(forta.usersDetectionBots(msg.sender)));
        console.logUint(forta.botRaisedAlerts(msg.sender));

        vault.sweepToken(legacyToken);

        console.logBytes4(bytes4(keccak256("delegateTransfer(address,uint256,address)")));

        uint alertsAfter = forta.botRaisedAlerts(msg.sender);
        assert(alertsAfter > alertsBefore);
    }
}
