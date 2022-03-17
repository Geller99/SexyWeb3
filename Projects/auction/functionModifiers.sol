/*

    used to modify the behavior of a function

    THey test a condition before calling a function and will only execute if it falls to true

    They are constant properties and are inherited
    They don't return and use only require();
    They are defined by using the modifier keyword;

    
*/


contract Property {

    address public owner;

    // created like regular function syntax but with the modifier keyword
    // special statement _;
    // idiomatic way of testing conditions before executing contracts
    // 
    modifier onlyOwner() {
        require(owner == msg.sender);
        _;
    }

    function changeOwner(address _owner) public onlyOwner {
        owner = _owner;
    }
}