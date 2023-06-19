// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/access/Ownable.sol";
import "@openzeppelin/token/ERC20/ERC20.sol";
import "./Task.sol";


contract MyFortaBot is IDetectionBot {
    CryptoVault public cryptoVault;
    Forta public forta;

    constructor(address _vault, address _forta) {
        cryptoVault = CryptoVault(_vault);
        forta = Forta(_forta);

    }

    function getSelector(bytes calldata msgData) public pure returns(bytes4 selector) {
        // assembly {
        // // load 32 bytes into `selector` from `data` skipping the first 32 bytes
        // selector := mload(add(msgData, 32))
        // }
        selector = bytes4(msgData[:4]);
    }

    function decodeMsgData(bytes calldata msgData) public pure returns (address to, uint value, address origSender) {
    // The first 4 bytes on the msgData are the function signature, in order to decode the payload it is required to skip those bytes of the function signature!
        // reference: "abi.decode cannot decode msg.data" <===> https://github.com/ethereum/solidity/issues/6012
        (to, value, origSender) = abi.decode(msgData[4:],(address,uint,address));
    }

    function handleTransaction(address user, bytes calldata msgData) external {
        bytes4 sweepTokenSelector = bytes4(keccak256("delegateTransfer(address,uint256,address)")); 
        if (sweepTokenSelector == getSelector(msgData)){
            (, , address origSender) = decodeMsgData(msgData);

            if (origSender == address(cryptoVault)) {
                forta.raiseAlert(user);
            }
        }
    }


}