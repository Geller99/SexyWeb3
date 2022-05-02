

// SPDX-License-Identifier: MIT
import './auction.sol';

pragma solidity ^0.8.0; 


contract CreateAuction{

    address public ownerCreator;
    Auction[] public deployedAuctions;

    function createNewAuction () public {
        Auction newAuction = new Auction(msg.sender);
        // dynamic array to store instances of Auction
        deployedAuctions.push(newAuction);
        
    }

}

