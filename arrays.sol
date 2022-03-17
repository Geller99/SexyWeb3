
// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;


contract Arrays {

    
    // fixed sized array declaration
    uint[3] public numbers = [0,1,2];

    function setBytesArray() public {
        b1 = 'abc';
    }

    bytes public b1 = 'abc';

    string public s1 = 'abc';
    // can't add elements to string using a setter like we can with bytes
    // index access for string is not possible
    // cannot get length of string


}



    struct Car {
        string brand;
        int build_year;
        int value;
        address ownerAddress;
    }


contract UseCase {
 
    // a collection of key-value pairs similar to mappings but values can have different types
    // struct introduces new complex data type that is composed of other elementary data type
    // used to represent things that have properties e.g car, person
    // we use mappings to represent a collection of things like a collection of cars, requests etc
    // struct is saved in storage and references storage by default
    // can be delcared globally and used by multiple contracts
    // can be initialized in constructor
    // by default struct references storage

    Car public userCar;
}

contract NewCar {
    // storage struct variable
    Car public newCar;

    constructor(string memory _brand, int _build_year, int _value) {
        newCar.brand = _brand;
        newCar.build_year = _build_year;
        newCar.value = _value;
        newCar.ownerAddress = msg.sender;

    }
    
    function changeInstructor (string memory _brand, int _build_year, int _value, address _myAddy) public {
        // memory struct variable
        Car memory myNewCar = Car({
            brand: _brand,
            build_year: _build_year,
            value: _value,
            ownerAddress: _myAddy
        });

        newCar = myNewCar;

    }


}