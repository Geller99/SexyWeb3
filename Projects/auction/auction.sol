 
 
// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

contract Auction {

    address payable public owner;
    uint public startBlock;
    uint public endBlock;
    string public ipfsHash;

    enum State {Started, Running, Ended, Cancelled}
    State public auctionState;

    // mimimum between all bids + bid increment
    uint public highestBindingBid;
    address payable public highestBidder;

    mapping(address => uint) public bids;
    uint bidIncrement;
    
    constructor () {
        owner = payable(msg.sender);
        auctionState = State.Running;
        startBlock = block.number;
        endBlock = startBlock + 40320;
        ipfsHash = "";
        bidIncrement = 100;
    }


    modifier notOwner() {
        require (msg.sender != owner);
        _;
    }

    modifier afterStart() {
        require(block.number >= startBlock);
        _;
    }

    modifier beforeEnd() {
        require(block.number <= endBlock);
        _;
    }

    function min(uint a, uint b) pure internal returns (uint) {
        if(a <= b) {
            return a;
        }else {
            return b;
        }
    }

    function placeBid() public payable notOwner afterStart beforeEnd {
        require(auctionState == State.Running);
        require (msg.value >= 100 wei);
        
        uint currentBid = bids[msg.sender] + msg.value;
        require (currentBid > highestBindingBid);

        bids[msg.sender] = currentBid;

        if(currentBid <= bids[highestBidder]) {
            highestBindingBid = min(currentBid + bidIncrement, bids[highestBidder]);
        } else {
            highestBindingBid = min(currentBid, bids[highestBidder] + bidIncrement);
            highestBidder = payable(msg.sender);
        }

    }

}