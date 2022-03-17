



// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

contract Deposit {


    receive() external payable {

    }

    fallback() external payable {

    }

    function getBalance() public view returns (uint) {
        return address(this).balance;
    }

    function sendEther() public payable {
        uint x;
        x++;
    }

    function transferEther (address payable recipient, uint amount) public returns (bool) {
        if (amount <= getBalance()) {
            recipient.transfer(amount);
            return true;
        } else {
            return false;
        }
        
    }
}