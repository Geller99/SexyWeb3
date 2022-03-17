// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;


contract Mappings {

    // a DS that holds key->value pairs. Similar to Java Hashmaps, JS objects or Python dictionaries

    // All keys must have the same type and all values must have the same type

    // Keys cannot be of types mapping, dynamic array, enum or struct. The values can be any type including mapping

    // ALways saved in storage, it's a state variable - mappings within functions are also storage saved

    // Lookup time is O(1)

    // Not iterable, cant use a for loop
    // Keys are not saved into the map. To get a value, we provide a key...
    // value of unexisting key =  default value of data type
    
    mapping(address => uint) public bids;

    function bid() payable public {
        bids[msg.sender] = msg.value;
    }

    // contains any possible key with its default variable
    // are one way to send ether to a smart contract


}