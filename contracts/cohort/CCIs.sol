// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.2 <0.9.0;

contract Storage {
    uint public num;

    constructor(uint _num) {
        require(_num > 0, "Invalid number");
        num = _num;
    }

    function getNum() public view returns (uint) {
        return num;
    }

    function add() public {
        num += 1;
    }


}