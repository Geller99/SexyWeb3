

// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;


contract Node {

    uint256 public value;
    

    constructor(uint256 _value) {
        value = _value;
    }
}


contract LinkedList {

}

// contract Property {

//     int public price;
//     address public owner;
//     string public location;
//     int constant area = 100;
//     int immutable nextArea = 200;


//     constructor(int _price, string memory _location) {
//         price = _price;
//         location = _location;
//         owner = msg.sender;
//     }


//     function setPrice(int _price) public  {
//         price = _price;

//         // string memory myName = 'Kohl';
 
//     }

//     function setLocation (string memory _location) public {
//         location = _location;
//     }
// }



