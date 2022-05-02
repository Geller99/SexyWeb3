const SHA256 = require("crypto-js/sha256");

/*
    - index: tells us where the block sits
    - timestamp: when the block was created
    - data: any type of data you or details of transaction
    - parentHash: contains the hash or parent block
*/

class Block {
  constructor(index, timestamp, data, parentHash) {
    this.index = index;
    this.timestamp = timestamp;
    this.data = data;
    this.parentHash = parentHash;
    this.hash = "";
  }

  calculateHash() {
    return SHA256(
      this.index +
        this.previousHash +
        this.timestamp +
        JSON.stringify(this.data).toString()
    );
  }
}

class BlockChain {
  constructor() {
    this.chain = [];
  }

  createGenesisBlock() {
      return new Block(0, "03/17/2022", "Genesis", "0");
  }

  getLatestBlock () {
      return this.chain(this.chain.length - 1);
  };

  addBlock(newBlock) {
      
  }


}
