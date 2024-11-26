// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.2 <0.9.0;

contract Ownable {
    address public owner;

    constructor(address _owner) {
        owner = _owner;
    }

    //Modifier
    modifier onlyOwner() {
        require(msg.sender == owner, "Not authorized");
        _;
    }

    function setOwner(address _newOwner) external onlyOwner {
        require(_newOwner != address(0), "Invalid address");
        owner = _newOwner;
    }
}