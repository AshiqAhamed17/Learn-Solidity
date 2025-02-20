// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import { IERC20 } from "@openzeppelin/contracts/token/ERC20/IERC20.sol";

contract LockUSDT {

    address private usdtAddress;
    uint amount;

    constructor (address _usdtAddress) {
        usdtAddress = _usdtAddress;
    }



    function deposit(uint256 _amount) public  {
        require(_amount > 0, "Invalid Amount");
        amount += _amount;
    }

}