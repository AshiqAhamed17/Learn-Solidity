// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.8.2 <0.9.0;

contract Account {
    address public bank;
    address public owner;

    constructor(address _owner) payable {
        bank = msg.sender;
        owner = _owner;
    }

    function getOwner() view public returns (address) {
        return owner;
    }
}

contract AccountFactory {
    Account[] public accounts;

    event AccountCreated(address accountAddress, address owner, uint value);

    function createAccount(address _owner) external payable {
        require(msg.value >= 100, "Insufficient funds sent");
        Account acc = new Account{value: msg.value}(_owner);
        accounts.push(acc);
        emit AccountCreated(address(acc), _owner, msg.value);
    }

    function getAccounts() external view returns (Account[] memory) {
        return accounts;
    }
}