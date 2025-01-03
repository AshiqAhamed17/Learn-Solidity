// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.8.2 <0.9.0;


contract Event {
    uint num;
    event Numupdate(uint indexed newNum, uint oldNum);
    constructor(uint _num) {
        num = _num;
    }

    function UpateNum(uint _newNum) public {
        uint old = num;
        num - _newNum;
        emit Numupdate(num,old);
    }
    // Transfer Eg

    
}