//SPDX-License-Identifier: UNLICENSED
pragma solidity 0.8.11;

import "@openzeppelin/contracts/token/ERC20/presets/ERC20PresetMinterPauser.sol";

contract WFRA is ERC20PresetMinterPauser {
    constructor() ERC20PresetMinterPauser("WFRA", "WFRA") {}

    function mint() payable external {
        require(msg.value > 0, "Error: value must be greater than zero");
        _mint(msg.sender, msg.value);
    }
}
