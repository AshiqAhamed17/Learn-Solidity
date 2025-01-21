// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

contract FunctionSelector {
    event Log(bytes data);
    event Transfer(address addr, uint amount);

    function transfer(address _to, uint _amount) public {
        emit Log(msg.data); // 0xa9059cbb => function to call 
                            //000000000000000000000000ab8483f64d9c6d1ecf9b849ae677dd3315835cb => function parameter address _to
                            //2000000000000000000000000000000000000000000000000000000000000000c => function parameter uint _amount
        emit Transfer(_to, _amount);
    }

    function Functionselector(string calldata _func) public pure returns (bytes4) {
        // func => "transfer(address,uint256)" => 0xa9059cbb
        return bytes4(keccak256(bytes(_func)));
    }
}