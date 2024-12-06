// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract Mytokenz is ERC20, Ownable {

    constructor() ERC20("AZToken", "AZ") Ownable(msg.sender) {
        _mint(msg.sender, 1000000000);
    }

    function mint(address account , uint amount) public onlyOwner {
        _mint(account, amount);
    }
}