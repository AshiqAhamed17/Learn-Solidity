// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.8.2 <0.9.0;

//Logic Contract
contract TestdelegatecallV1 {
    // NOTE: storage layout must be the same as contract Delegatecall
    uint public num;
    address public sender;
    uint public value;

    function setValue(uint _num) external payable {
        num =  2 * _num;
        sender = msg.sender;
        value = msg.value;
    }
}

//Logic contract 2
contract TestdelegatecallV2 {
    uint public num;
    address public sender;
    uint public value;

    function setValue(uint _num) external payable {
        num = 10 * _num;
        sender = msg.sender;
        value = msg.value;
    }

}


//Contract which delegate call the logic contracrt with context of this contract
contract Delegatecall {
    uint public num;
    address public sender;
    uint public value;

    event DelegateResponse(bool success, bytes data);
    function setValue(address _test, uint _num) external payable {
        
        (bool success, bytes memory data) = _test.delegatecall(
            abi.encodeWithSignature("setValue(uint256)", _num)
        );
    
        // Delegatecall's storage is set; Testdelegatecall's storage is not modified.
        /*(bool success, bytes memory data) = _test.delegatecall(
            abi.encodeWithSelector(Testdelegatecall.setValue.selector, _num)
        );*/
        require(success, "Delegatecall Failed !!!!");
        emit DelegateResponse(success, data);
    }

    // Testdelegatecall's storage is set; Delegatecall's storage is not modified.
    function setValueCall(address _test, uint _num) external payable {
        /*(bool success, bytes memory data) = _test.call{value: msg.value}(
            abi.encodeWithSelector(Testdelegatecall.setValue.selector, _num)
        );*/

        (bool success, bytes memory data) = _test.call{value: msg.value}(
            abi.encodeWithSignature("setValue(uint256)", _num)
        );
        require(success, "Delegatecall Failed !!!!");
        emit DelegateResponse(success, data);
    }
}