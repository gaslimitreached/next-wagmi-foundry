// SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.0;

abstract contract Ownable {
    address public owner = msg.sender;
    error NotOwner();
    modifier onlyOwner() {
        if(owner != msg.sender) revert NotOwner();
        _;
    }
}