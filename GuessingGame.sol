pragma solidity ^0.4.18;

contract GuessingGame{
    
    uint nonce = 0;
    
    event Winner(address user, uint lotteryNumber);
    event Loser(address user, uint lotteryNumber);
    
    function () public payable{
        
    }
    
    function getBalance() public constant returns(uint){
        return this.balance;
    }
    
    function playGame() payable public{
        //Check for correct payment
 //       if (msg.value != 0.01 ether){
//            throw;                              //only used for JVM, use assert for web3
//        }

        assert(msg.value == 0.01 ether);
        
        //Generate random number
        uint rand = uint(keccak256(block.blockhash(block.number), nonce)) % 100;
        nonce++; 
        
        if (rand % 2 == 0){
            msg.sender.transfer(msg.value * 2);   
            emit Winner(msg.sender, rand);
        }else{
            emit Loser(msg.sender, rand);
        }
        
    }
}
