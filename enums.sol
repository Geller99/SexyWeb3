
// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;


contract EnumPractice {

    // Used to create user-defined types - Enum = enumerate
    // Implicite conversions not allowed...but explicitly convertible to and from integer
    // used to specify current state or flow of smart contract

    // Solidity supports enumerables and they are useful to model choice and keep track of state.

     enum Status {
        Pending,
        Shipped,
        Accepted,
        Rejected,
        Canceled
    }
    
     // Default value is the first element listed in
    // definition of the type, in this case "Pending"
    Status public status;

    // Returns uint
    // Pending  - 0
    // Shipped  - 1
    // Accepted - 2
    // Rejected - 3
    // Canceled - 4
    function get() public view returns (Status) {
        return status;
    }

    // Update status by passing uint into input
    function set(Status _status) public {
        status = _status;
    }

    // You can update to a specific enum like this
    function cancel() public {
        status = Status.Canceled;
    }

    // delete resets the enum to its first value, 0
    function reset() public {
        delete status;
    }


}