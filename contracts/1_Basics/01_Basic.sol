// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.8.2 <0.9.0;

/**
 * @title Storage
 * @dev Store & retrieve value in a variable
 * @custom:dev-run-script ./scripts/deploy_with_ethers.ts
 */
contract Storage {

    
    function test() public pure returns (uint) {
       uint a = 0;
       unchecked { a--; }
       return a;
    }
    function min() public pure returns (uint) {
         uint mini = type(uint).min;
         return mini;
         
    }

    function max() public pure returns (uint8) {
        uint8 maxi = type(uint8).max;
        return maxi;
    }
   
}