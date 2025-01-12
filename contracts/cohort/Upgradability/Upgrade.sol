// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.8.2 <0.9.0;

import "@openzeppelin/contracts/access/Ownable.sol";

contract Proxy is Ownable {
   uint public num;
   address imp;
   bytes datas; 

   constructor () Ownable(msg.sender){
      num = 0;
   }


   function setNum(uint _num) public {

      (bool success, bytes memory data) = imp.delegatecall(
         abi.encodeWithSignature("setNum(uint256)", _num)
      );
      require(success, "Failed to Deligate call");
      datas = data;
   }

   function setImp(address _imp) public onlyOwner {
      imp = _imp;
   }
}

contract ImplementationV1{
   uint dummy;
   uint num;

   function setNum(uint _num) public {
      num = _num;
   }
}

contract ImplementationV2 {
   uint dummy;
   uint num;

   function setNum(uint _num) public {
      num = 2 * _num;
   }
}

contract ImplementationV3{
   uint dummy;
   uint num;

   function setNum(uint _num) public {
      num = 3 * _num;
   }
}