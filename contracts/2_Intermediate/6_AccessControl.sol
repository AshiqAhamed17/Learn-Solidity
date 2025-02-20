// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.8.2 <0.9.0;

contract AccessControl {

    mapping(bytes32 => mapping(address => bool)) public roles;

    event GrandRole(bytes32 indexed role, address indexed account);
    event RevokeRole(bytes32 indexed role, address indexed account);

    bytes32 public constant ADMIN = keccak256(abi.encodePacked("ADMIN"));
    bytes32 public constant USER = keccak256(abi.encodePacked("USER"));

    modifier onlyRole(bytes32 _role) {
        require(roles[_role][msg.sender], "Not Authorised");
        _;
    }

    constructor() {
        roles[ADMIN][msg.sender] = true;
    }

    function _grantRole(bytes32 _role , address _account) internal {
        roles[_role][_account] = true;
        emit GrandRole(_role, _account);
    }

    function grantRole(bytes32 _role  , address _account) external onlyRole(ADMIN) {
        _grantRole(_role, _account);
    }

    function revokeRole(bytes32 _role, address _account) external onlyRole(ADMIN) {
        roles[_role][_account] = false;
        emit RevokeRole(_role, _account);
    }

}