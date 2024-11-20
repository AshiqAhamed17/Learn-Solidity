// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.2 <0.9.0;

contract Conditions {
    //IF_ELSE
    function isLegal(uint _age) public pure returns (bool) {
        if(_age >= 18){
            return true;
        }
        else{
            return false;
        }
    }

    //Ternary

    function isEven(uint _num) public pure returns (string memory) {
        return (_num%2==0) ? "Even" : "Odd";
    }

}