 
// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;


/*
    This smart contract was created so users can contribute ether to a pool

    The funds contributed can then be assigned to a particular celebrity of their choosing

    To perform a viral act

*/

contract TipPool {

    address payable owner;
    address payable celebrity;
    uint public minimumTip;
    uint public numberOfTippers;
    uint public deadline;
    uint public goal;
    uint public totalPoolBalance;
    
    mapping(address => uint) public fans;

    enum State {Started, Running, Ended, Cancelled}
    State public poolState; 

    constructor (uint _goal, uint _deadline) {
        celebrity = payable(msg.sender);
        goal = _goal;
        deadline = block.timestamp + _deadline;
        poolState = State.Running;    
        minimumTip = 100 wei;
    }


    function addTip () public payable{
        /* Ensure pooling is still going on  */
        require(block.timestamp < deadline, "Pooling closed!");
        require(msg.value >= minimumTip, "Minimum amount not met" );

        if(fans[msg.sender] == 0) {
            // increment numberOfFans 
            numberOfTippers++;
        }
        // add the tip sent to the mapping hash
        fans[msg.sender] += msg.value;
        totalPoolBalance += msg.value;
    }

    receive () payable external {
        addTip();
    }

    function getPotBalance () public view returns(uint) {
        return address(this).balance;
    }

    function cancelPot () public returns (State) {
        poolState = State.Cancelled;
        return poolState;
    }





}