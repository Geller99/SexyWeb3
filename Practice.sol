// SPDX-License-Identifier: MIT

pragma solidity >=0.7.0 <0.9.0;


contract TipPool {

    //
    // FIxed sized arrays - Arrays whose size is specified at compile time and cannot be changed using a setter function

    uint[5] public containerArray;
    uint public numbers;

    // uint is the data type, [5] represents the number of elements, "public" represents the visibility and containerArray represents the name of the array.

    /* 
        fixed size arrays contain an internal method .length which returns the size of the array

    */

    // data location must be "Storage", "memory" or "calldata" for variable

    function getArrayLength () public view returns (uint) {
         return containerArray.length;
    }

    // all variables declare "public" contain an automatic getter function

    /*
        Dynamically Sized arrays - are arrays whose size is determined at run-time and can be changed via push and pop methods
    */

    // pure functions don't use the blockchain and don't have access to state variables like arrays



    

     
}

