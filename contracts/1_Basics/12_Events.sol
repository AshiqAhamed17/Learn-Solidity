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

    mapping(address => uint)  balances;
    event Trasfer(address indexed from, address indexed to, uint value);

    function mint(address _to, uint _value) public {
        require(_to != address(0), "Cannot  mint to Zero address");
        require(_value > 0, "Cannot Transfer zero tokens ");
        balances[_to] += _value;
        emit Trasfer(address(0), _to, _value);
    }

    function transfer(address _to , uint _value) public {
         require(_to != address(0));
         require (_value > 0," Cannot Transfer zero tokens");
          balances[_to] += _value;
        emit Trasfer(msg.sender, _to, _value);
     }
}