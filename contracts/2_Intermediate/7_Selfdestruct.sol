// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.8.2 <0.9.0;

contract Selfdestruct {
    address public  owner;

    constructor() {
        owner = msg.sender;
    }
    /*
    function destroy(address payable _addr) internal {
        require(msg.sender == owner, "Only owner can call destroy");
        require(_addr != address(0), "Cannot destroy with zero address");

        // The selfdestruct function has been depreciate. So, dont use it...
        //selfdestruct(_addr);
        
    }
    */
}