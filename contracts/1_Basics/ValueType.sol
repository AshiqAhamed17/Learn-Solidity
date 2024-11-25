// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.2 <0.9.0;

contract ValueType {
    // State variable
    uint a = 7;
    function getA() public view returns (uint) {
        return a;
    }

    //Local Variables
    function localEg() public pure returns (uint) {
        uint b = 18;
        return b;
    }

    //Global Variables:
    function getGlobalVars() public view returns (uint, address) {
        uint timeStamp = block.timestamp;
        address add = msg.sender;
        return (timeStamp, add);
    }
}