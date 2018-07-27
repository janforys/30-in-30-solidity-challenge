pragma solidity ^0.4.24;

/**
* @title Foundation
* @author 
* @notice This contract allow you to take part in fundraising.
*/

contract Foundation {

    address owner;
    uint public goal;
    uint public endTime;
    uint public total = 0;
    
    mapping(address => uint) donations;
    
    constructor(uint _goal, uint _timeLimit) public {
        owner = msg.sender;
        goal = _goal;
        endTime = now + _timeLimit;
    }
    
    /// Here you can send some money for foundation
    function donate() payable public {
        require(now < endTime, "Fundraising is closed");
        require(total < goal, "We reached a goal");
        require(msg.value > 0, "You need to send some Ether");
        donations[msg.sender] += msg.value; 
        total += msg.value;
    }
    
    /// If goal isn't reached, user can withdraw his funds
    function withdrawOwner() public {
        require(msg.sender == owner, "You must be owner");
        require(total >= goal, "Fundraising not closed yet");
        owner.transfer(address(this).balance);
    }
    
    /// Only when goal is reached, owner can withdraw all money
    function withdraw() public {
        require(now > endTime, "Fundraising not closed");
        require(total < goal, "Cannot withdraw when fundraising was successful");
        uint amount = donations[msg.sender];
        total -= amount;
        donations[msg.sender] = 0;
        address(msg.sender).transfer(amount);
    }
}