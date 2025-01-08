// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.8.2 <0.9.0;

contract TestCall {
    uint public x;
    string public message;

    event Received(address caller, uint256 amount, string message);

    // Explicitly handle plain Ether transfers without calldata
    receive() external payable {
        emit Received(msg.sender, msg.value, "Ether received without calldata");
    }


    fallback() external payable { 
       emit Received(msg.sender, msg.value, "Fallback was called");
    }

    function fun(string memory _message, uint _x) external payable returns(bool, uint) {
        message = _message;
        x = _x;
        emit Received(msg.sender, msg.value, _message);
        return (true, 100);
    }
}

contract Call {
    bytes public data;

    function callFun(address _test) external payable {
        (bool success, bytes memory _data) = _test.call{value: 111, gas: 100000}(
            abi.encodeWithSignature(
                "fun(string,uint256)", "fun called", 17
            )
        );
        require(success, "failed to call");
        data = _data;
    }

    function InvalidFun(address _test) external  {
        (bool success, ) = _test.call(
            abi.encodeWithSignature("Invalid(uint)", 69)
        );
        require(success, "failed to call InvalidFun");
    }
}