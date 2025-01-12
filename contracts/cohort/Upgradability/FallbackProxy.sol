// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.8.2 <0.9.0;

contract Proxy {
    uint public num;
    address imp;

    constructor (address _imp) {
        num = 0;
        imp = _imp;
    }

    fallback() external {
        (bool success, ) = imp.delegatecall(msg.data);
        require(success, 'Failed');
    }
}

contract ImplementationV1 {
    uint num;

    function setNum(uint _num) public {
        num = _num;
    }
}