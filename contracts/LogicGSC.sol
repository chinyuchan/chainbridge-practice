//SPDX-License-Identifier: UNLICENSED
pragma solidity 0.8.11;

import "@openzeppelin/contracts/interfaces/IERC20.sol";
import "./BytesLib.sol";

interface IBridge {
    function deposit(uint8 destinationDomainID, bytes32 resourceID, bytes calldata data) external payable;
}

contract LogicGSC {
    using BytesLib for bytes;

    // 桥地址
    address public bridge;
    // erc20地址
    address public wgsc;
    // handler地址
    address public handler;
    // resourceID地址
    bytes32 public resourceID;

    // 构造函数
    constructor(address _bridge, address _handler, address _token, bytes32 _resourceID) {
        bridge = _bridge;
        handler = _handler;
        wgsc = _token;
        resourceID = _resourceID;
    }

    // 调用桥合约的deposit方法
    function deposit(uint8 _domainID, uint _amount, address _recipient) external payable {
        // 把用户要跨链的数量转到Logic合约
        IERC20(wgsc).transferFrom(msg.sender, address(this), _amount);

        bytes memory data1 = abi.encode(_amount, 20);
        bytes memory recipientBytes = abi.encodePacked(_recipient);
        bytes memory data = data1.concat(recipientBytes);

        IBridge(bridge).deposit(_domainID, resourceID, data);
    }
}
