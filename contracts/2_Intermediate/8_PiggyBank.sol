// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.8.2 <0.9.0;

/*
contract PiggyBank {
    address public owner;

    event Deposit(uint amount);
    event Withdraw(uint amount);

    constructor() {
        owner = msg.sender;
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "Only the owner can do this.");
        _;
    }

    receive() external payable {
        emit Deposit(msg.value);
    }

    function withdraw() external onlyOwner {
        emit Withdraw(address(this).balance);
        //selfdestruct(payable(owner));

    }

    function getbalance() public view returns (uint balance) {
        balance = address(this).balance;
    }

}
*/