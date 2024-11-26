// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.2 <0.9.0;

contract Arrays {
    uint[] public arr = [1,2,3,4,5];
    uint[5] public fixedArr = [1,2,3];
    // Creating a Array in memory 

    function simpleExamples() public returns(uint){
        uint[] memory array8 = new uint[](5);
        //bytes[] memory byteArr = new bytes[](5);
        array8[0] = 7;
        arr.push(5);
        arr.pop();
        fixedArr[3] = 4;
        delete arr[1];
        uint len = arr.length;
        return len;
    }

    function removeByIndex(uint _index) public {
        uint len = arr.length;
        require(_index < len, "Index out of bound");
        arr[_index] = arr[len - 1];
        arr.pop();
    }

    


}