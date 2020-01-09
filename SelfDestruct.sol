pragma solidity 0.5.16;

contract Bank {
    function getBalance() public view returns (uint) {return address(this).balance;}
    function () external payable { revert(); }
    function kill(address payable target) public {
        selfdestruct(target);
    }
}
contract Caller {
    constructor() public payable {}
    function doTransfer(address payable user) public { 
        user.transfer(1 ether); 
    }
    function doSend(address payable user) public { 
        require(user.send(1 ether));
    }
    function kill(address payable target) public {
        selfdestruct(target);
    }
    function getBalance() public view returns (uint) { 
        return address(this).balance; 
    }
}
