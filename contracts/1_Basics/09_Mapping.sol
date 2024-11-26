// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.2 <0.9.0;

contract Mapping {
    // Basic Mapping 
    mapping (address => uint) balances;
    mapping (address => bool) inserted;
    address[] public keys;

    function addBalance() public payable {
        require(msg.value > 0, "Invalid value");
        balances[msg.sender] += msg.value;
    }

    function getBalance(address _user) public view returns(uint) {
        require(_user != address(0) , "Invalid user Address");
        return balances[_user];
    }

    // iterable 
    function set(address _key , uint _val) public {
        balances[_key] = _val;
        if(!inserted[_key]){
            inserted[_key] = true;
            keys.push(_key);
        }
    }

    function getSize() public view returns (uint) {
        return (keys.length);
    }

    function getFirst() public view returns (uint) {
        return balances[keys[0]];
    }

    function get_i(uint _i) public view returns (uint) {
        return balances[keys[_i]];
    }


}

