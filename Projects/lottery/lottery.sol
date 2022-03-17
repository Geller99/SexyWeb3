 
 
// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

contract Lottery {

    // array to store addresses of lottery players
    // manager state variable
    address payable[] public players;
    address public manager;

    constructor () {
        manager = msg.sender;
    }

    // must have payable state mutability
    // cannot have more than one per contract
    // run automatically
    // cannot have arguments or receive anything
    receive() external payable {
        // require checks for conditions and throws error if fasle
        require(msg.value == 0.1 ether); // assumed to be wei with no suffix
        players.push(payable(msg.sender));
    }   

    // get balance of smart contract after lottery players send ether
    function getBalance() public view returns (uint) {
        // make sure only manager can see contract balance
        // only manager can call getBalance
        require(msg.sender == manager);
        return address(this).balance;
    }



    function random() public view returns (uint) {
        // send seed to off-chain oracle which returns random number and verifiable proof back to the smart contract
        // use chainlink VRF
        return uint(keccak256(abi.encodePacked(block.difficulty, block.timestamp, players.length)));

    }

    function pickWinner() public {
        //ensure only the manager can pick the winner and send the funds
        require(msg.sender == manager);
        require(players.length >= 3);

        uint randomValue = random();
        address payable winner;

        // select random index as winner
        uint index = randomValue % players.length;

        winner = players[index];
        winner.transfer(getBalance());
        resetLottery();

    }

    function resetLottery () public {
        players = new address payable[](0);
    }



    


}