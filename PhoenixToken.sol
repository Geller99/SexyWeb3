// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;


interface ERC20Interface {
    function totalSupply() external view returns (uint);
    function balanceOf(address tokenOwner) external view returns (uint balance);
    function transfer(address to, uint tokens) external returns (bool success);

    function allowance(address tokenOwner, address spender) external view returns (uint remaining);
    function approve(address spender, uint token) external returns (bool success);
    function transferFrom(address from, address to, uint tokens) external returns (bool success);

    event Transfer(address indexed from, address indexed to, uint tokens);
    event Approval(address indexed tokenOwner, address indexed spender, uint tokens);
}


contract Phoenix is ERC20Interface {
    string public name = "Phoenix";
    string public symbol = "PHX";
    uint public decimals = 0;
    uint public override totalSupply;

    address public founder;

    mapping(address => uint) public balances;

    mapping(address => mapping(address => uint)) allowed;
    // 0x111...(owner) allows 0x222...(spender) to spend --- 100 tokens
    // allowed[0x111][0x222] = 100;




    constructor() {
        totalSupply = 1000000;
        founder = msg.sender;
        balances[founder] = totalSupply; // assigns all tokens to the founder address
    }


    function balanceOf(address tokenOwner) public view override returns (uint balance) {
        // this function returns the token balance of the current address
        return balances[tokenOwner];
    }


    function transfer(address to, uint tokens) public override returns(bool success) {
        // this function enables transfer of tokens and emits an event for it
        require(balances[msg.sender] >= tokens);
        
        balances[to] += tokens;
        balances[msg.sender] -= tokens;
        emit Transfer(msg.sender, to, tokens);

        return true;
    }

    function allowance (address tokenOwner, address spender) view public override returns (uint) {
        //  ensure only tokenOwner can run this function
        // require(msg.sender == tokenOwner); 
        return allowed[tokenOwner][spender];
    }

    function approve (address spender, uint tokens) public override returns (bool success) {
        // ensure the sender has enough tokens before transacting
        require(balances[msg.sender] >= tokens); 
        // ensure number of transacted tokens is more than zero
        require(tokens > 0);

        // update the allowed mapping with no_ of tokens permitted to allowed spender
        allowed[msg.sender][spender] = tokens;
        
        // An event is emitted, it stores the arguments passed in transaction logs
        // These logs are stored on blockchain and are accessible using address of the contract till the contract is present on the blockchain.
        emit Approval(msg.sender, spender, tokens);

        return true;
    }

    // allows spender to withdraw from owner's account - also changes total allowance
    function transferFrom(address from, address to, uint tokens) public override returns (bool success) {
        // ensure that allowance is more than tokens transferred
        require(allowed[from][to] >= tokens);        
        require(balances[from] >= tokens);

        // update the addresses with tokens
        balances[from] -= tokens;
        balances[to] += tokens;          
        allowed[from][to] -= tokens;

        return true;

    }





}