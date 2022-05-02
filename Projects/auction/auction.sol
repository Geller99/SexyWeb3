 
 
// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

contract Auction {
    /*
        owner address to claim auction funds
        start and endBlocks to measure the auction duration
        ipfs hash to store auction data on decentralized database

        enum state to track/guard state of auction
        mapping to contain address - amount paid by bidders
        bid increment value to regulate the changes between bids    
    */
    address payable public owner;
    uint public startBlock;
    uint public endBlock;
    string public ipfsHash;

    enum State {Started, Running, Ended, Cancelled}
    State public auctionState;

    /* Highest Binding Bid is the minimum value between the highest bid and the most recent bid
       Highest Bidder tracks the highest bid sent in
    */
    uint public highestBindingBid;
    address payable public highestBidder;

    mapping(address => uint) public bids;
    uint bidIncrement;
    
    // initialize state values in constructor
    constructor (address externallyOwnedAccount) {
        owner = payable(externallyOwnedAccount);
        auctionState = State.Running;
        startBlock = block.number;
        endBlock = startBlock + 3;
        ipfsHash = "";
        bidIncrement = 1000000000000000000;
    }

    /* modifiers exist to write reusable conditions for our functions   */
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


    // helper function to calculate minimum value for highest Binding bid
    function min(uint a, uint b) pure internal returns (uint) {
        if(a <= b) {
            return a;
        }else {
            return b;
        }
    }


    /* Function to place bid based on some conditions
       Function needs the auction to be in a running state
       Function has a minimum possible bid value
       
       ensure current bid is higher than the highestBindingBid or it won't increment the auction

    */
    function placeBid() public payable notOwner afterStart beforeEnd {
        require(auctionState == State.Running);
        require (msg.value >= 1000000000000000000 wei);
        
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



    modifier onlyOwner () {
        require (msg.sender == owner);
        _;
    }

    function cancelAuction () public onlyOwner {
        auctionState = State.Cancelled;
    }

    function resumeAuction () public onlyOwner {
        auctionState = State.Running;
    }

    /*  Function to finalize auction based on specific conditions
        if the auction is cancelled, refund each bidder his original amount

    */

    function finalizeAuction()public {
        require(auctionState == State.Cancelled || block.number > endBlock);
        require(msg.sender == owner || bids[msg.sender] > 0);

        address payable recipient;
        uint value;

        if(auctionState == State.Cancelled) { // auction was cancelled
            recipient = payable(msg.sender);
            value = bids[msg.sender]; 
        }else if(msg.sender == owner) { // auction was NOT cancelled
            recipient = owner;
            value = highestBindingBid;
        }else if(msg.sender == highestBidder) { // highest bidder
            recipient = highestBidder;
            value = bids[highestBidder] - highestBindingBid;
        }else {
            recipient = payable(msg.sender);
            value = bids[msg.sender];
        }

        bids[recipient] = 0;

        recipient.transfer(value);

    }


}