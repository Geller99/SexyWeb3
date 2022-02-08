## Solidity Documentation - in English

A layman's attempt at simplifying Solidity documentation -  



Episode 1 -> 


C-style Object-Oriented Syntax

Solidity as a language, operates similar to Java and C# syntax where all of the action is contained in classes. Only this time, they're labelled "Contracts"

Let's take a look at variations
```
class PublicStaker {} would be the equivalent declaration in Java

contract PublicStaker {} emulates the exact same structure, where private and public member methods and variables are declared within the contract and used implement application needs
```

Data Types

Most programming languages give us the ability to define/declare varying types for the various types of information we need to interact with. 
Solidity provides 4 Primitive Data Types; let's examine each one individually

Boolean 
Represents truthy or falsey variables
```
contract VerifyTransactions {

bool public isPayable = true;
bool public completedTransaction = false;

}
```

Integer
Unsigned Integer -  represents non-negative integer values. 


Solidity lets you implement unsigned integers in different sizes ranging from 8-256bits
```
uint8 -> 0 to 2 ** 8 - 1
uint16 -> 0 to 2 ** 16 -1
uint256 -> 0 to 2 ** 256 - 1



IMPLEMENTATION
uint256 public userId = 23;
```
normal integer types possess the same size range BUT allow negative values
```
int public userStakePosition = 45;
```
In order to access the minimum and maximum values of integers, we use the type method
```
int public minimumIntegerValue = type(int).min;
int public maximumIntegerValue = type(int).max;
```


Address
This data type is how we get rich, so let's focus here...


For the need to interact with wallet addresses, Solidity provides a data type which is either payable or non-payable and holds a 20 byte value, the usual size of an ethereum wallet address!
We can further interact with addresses in a few ways; 
		- check for balance 
		- transfer funds
```
contract AddressTypes {

address public stakerAddress = 0xCA35b7d915458EF540aDe6068dFe2F44E8fa733c;

address public payable claimerAddress = 0xCA35b7d915458EF540aDe6068dFe2F44E8fa733c;



}
where the payable address contains the transfer and send properties which aren't available on the regular address type.
```

Byte data type
Represents a sequence of bytes stored in an array - we're able to implement fixed-sized byte arrays or dynamically-sized byte arrays
```
bytes1 groupOfBytes = 0xb5;  - prints out [10110101];
bytes1 differentBytes = 0x56 - prints out [01010110];
```
To understand bytes more, we've provided a reference to get you started! We will also discuss byte manipulation in further chapters!



Today's Highlight

Lastly, unlike other languages, solidity has no undefined or null values...so unassigned variables automatically get a default value.
```
    bool public defaultBoolean; // false 
    uint public defaultUint; // 0 
    int public defaultInt; // 0 
    address public defaultAddress; // 0x0000000000000000000000000000000000000000
```




