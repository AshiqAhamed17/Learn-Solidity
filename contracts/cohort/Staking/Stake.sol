// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.8.2 <0.9.0;

contract Counter {
    uint count= 0;
    address public imp;

    constructor(address _imp) {
        imp = _imp;
    }

    function increase() public  {
        imp.delegatecall(msg.data);
    }
    function decrement() public  {
         imp.delegatecall(msg.data);
    }

}

contract CounterImpV1 {
    uint count= 0;

    function increase() public  {
        count +=1;
    }
    function decrement() public  {
        count -=1;
    }
}
