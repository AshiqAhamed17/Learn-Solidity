// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.8.2 <0.9.0;

contract Testdelegatecall {
    // NOTE: storage layout must be the same as contract Delegatecall
    uint public num;
    address public sender;
    uint public value;

    function setValue(uint _num) external payable {
        num = _num;
        sender = msg.sender;
        value = msg.value;
    }
}

contract Delegatecall {
    uint public num;
    address public sender;
    uint public value;

    event DelegateResponse(bool success, bytes data);
    function setValue(address _test, uint _num) external payable {
        /*
        (bool success, bytes memory data) = _test.delegatecall(
            abi.encodeWithSignature("setValue(uint256)", _num);
        )
        */
        // A's storage is set; B's storage is not modified.
        (bool success, bytes memory data) = _test.delegatecall(
            abi.encodeWithSelector(Testdelegatecall.setValue.selector, _num)
        );
        require(success, "Delegatecall Failed !!!!");
        emit DelegateResponse(success, data);
    }
}