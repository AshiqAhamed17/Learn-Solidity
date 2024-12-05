// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.2 <0.9.0;

interface IStorage {
    //function getNum() external  view returns(uint);
    function add() external;
}

contract hello2 {

    constructor () {

    }

    function proxyAdd() public {
        IStorage(0xAb8483F64d9C6d1EcF9b849Ae677dD3315835cb2).add();
    }

}