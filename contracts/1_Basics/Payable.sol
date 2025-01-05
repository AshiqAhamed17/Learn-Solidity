// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.8.2 <0.9.0;

contract Payable {
    address payable public owner;
    constructor() {
        owner = payable(msg.sender);
    }

    function deposit() public payable {}

    function getBalance() public view returns (uint256) {
        return address(this).balance;
    }
}