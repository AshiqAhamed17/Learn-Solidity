// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.2 <0.9.0;

contract Errors {
    int amount;
    uint8 age;

    function testRequire(int _amount) public {
        require(_amount > 0, "the amount must be bigger than 0");
        amount += _amount;
    }

    function setAge(uint8 _age) public {
        if(_age < 18){
            revert("you're too young!");
        }
        age = _age;
    }

    function testAssert() public view {
        assert(amount > 100);
    }




}