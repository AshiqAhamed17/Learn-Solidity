// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.8.2 <0.9.0;

contract Function {
    address owner;

    constructor(address _owner) {
        owner = _owner;
    }

    //MODIFIER ONLYOWNER
    modifier onlyOwner() {
        require(msg.sender == owner, "Caller is not the owner");
        _;
    }

    // ADD Function
    function add(uint a, uint b) public pure returns(uint c) {
        c = a+b;
    }

    //GetCallerInfo
    function getCallerInfo() public view onlyOwner returns(address, uint) {
       address caller = msg.sender;
       uint time = block.timestamp;
       return (caller, time);
    }

    //SET OWNER
    function setOwner(address _newOwner) public onlyOwner {
        require(_newOwner != address(0), "Invalid Address");
        owner = _newOwner;
    }




}