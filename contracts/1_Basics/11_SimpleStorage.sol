// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.2 <0.9.0;

contract Storage {
    string public text;

    function set(string calldata _text) external {
        text = _text;
    }

    function get() external view returns (string memory) {
        return text;
    }

    function getLenght() public view returns (uint) {
        return bytes(text).length;
    }

    function append(string calldata _str) public  returns (string memory) {
        text = string.concat(text," ", _str);
        return text;
    }
}