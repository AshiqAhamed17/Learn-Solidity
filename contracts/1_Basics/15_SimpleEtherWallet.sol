// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.8.2 <0.9.0;


contract SimpleEtherWallet {
    address payable public owner;

    constructor() payable {
        owner = payable(msg.sender);

    }

    function withdraw(uint _amount) external {
        (bool send, ) = msg.sender.call{value: _amount}("");
        require(send, "Failed");
    }

    receive() external payable { }

    function getBalance() public view returns (uint) {
        return address(this).balance;
    }
}

