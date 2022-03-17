


// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

/*

msg = contains info about the account generating the transaction and also about the transaction or call

msg.sender = account address that generates the transaction

msg.value = eth value sent to this contract

msg.gas = remaining gas... gasleft();

msg.data = data field from the transaction or call that executed this function

this: current contract, explicitly convertible to Address

block.timestamp alias for now: returns unix epoch

block.number 

block.difficulty

block.gaslimit

tx.gasprice;


*/

contract NewPractice {
    address public owner;

    uint public sentValue;

    function sendEther () public payable {
        sentValue = msg.value;
    }

    function getBalance() public view returns (uint) {
        return address(this).balance;
    }

    // find how much gas a block of code consumes

    function howMuchGas() public view returns (uint) {
        uint start = gasleft();
        uint j = 1;
        for (uint i = 1; i<20; i++) {
            j*=i;
        }

        uint end = gasleft();
        return start - end;
    }


}


contract GlobalVars {

    uint public this_moment = block.timestamp;
    uint public block_number = block.number;

    // POW is the problem the miners must solve
    uint public difficulty = block.difficulty;

    // defines the maximum block size
    uint public gaslimit = block.gaslimit;


}


