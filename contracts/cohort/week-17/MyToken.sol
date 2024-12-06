// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.2 <0.9.0;

contract MyToken {

    //mapping(address => uint) owner;
    address public owner;
    uint public totalSupply;
    mapping  (address => uint) public balances;

    constructor() {
        owner = msg.sender;
    }

    modifier onlyOwner {
        require(msg.sender == owner, "Only owner can call this function");
        _;
    }

    function mint(uint _amount) public onlyOwner {
        balances[owner] += _amount;
        totalSupply += _amount;
    }

    function mintTo(uint _amount, address _to) public onlyOwner {
        balances[_to] += _amount;
        totalSupply += _amount;
    }

    function transfer(uint _amount, address _to) public {
        uint currentBalance = balances[msg.sender];
        require(currentBalance >= _amount, "Not enough balance");
        balances[msg.sender] -= _amount;
        balances[_to] += _amount; 
    }

    function burn(uint _amount) public {
        uint _balance = balances[msg.sender];
        require(_balance > _amount, "Not enough balance");
        balances[msg.sender] -= _amount;
        totalSupply -= _amount;
    }
}