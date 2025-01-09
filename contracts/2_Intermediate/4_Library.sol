// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.8.2 <0.9.0;

library ArrayLib {
    function find(uint[] storage arr, uint x) internal view returns (uint) {
        for(uint i=0; i<arr.length; i++) {
            if(arr[i] == x) return i;
        }
        revert("Not Found");
    }

    function solve(uint x) internal pure returns (uint) {
        return (2 * x);
    }
}

contract TestArray {
    using ArrayLib for uint[];
    uint[] public arr = [1,2,3,4];

    function testFind(uint _x) external view returns (uint) {
        //return ArrayLib.find(arr, _x);
        return arr.find(_x);
    }

    function func() external  returns (uint[] memory) {
        for(uint i=0; i<arr.length; i++){
            arr[i] = ArrayLib.solve(arr[i]);
        }
        return arr;
    }


}