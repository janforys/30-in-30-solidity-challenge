pragma solidity ^0.4.24;

/**
* @title Lottery NoLimit
* @author Jan Foryś
* @notice A Lottery with no participants limit.
*/

contract LotteryNolimit {

    address[] participants;   // no participants limit
    address owner;
    uint Nonce = 0;

    modifier isOwner() {
        require(msg.sender == owner, "Only owner can do that");
        _;
    }

    constructor() public {
        // contract owner can participate
        owner = msg.sender;
    }

    // User can participate in lottery more than 1 time
    function join() public payable {
        // pay 0.1 Ether to participate
        require(msg.value == 0.1 ether, "Must send 0.1 Eth");
        participants.push(msg.sender);
    }
       
    // Contract owner decide when to draw a winner
    function drawWinner() public isOwner {
        require(participants.length > 0, "No participants in the Lottery");
        // winner gets all funds
        participants[_randomNumber(participants.length)].transfer(address(this).balance);
        delete participants;
    }

    function _randomNumber(uint _limit) private returns (uint) {
        uint rand = uint(keccak256(abi.encodePacked(msg.sender, Nonce))) % _limit;
        Nonce++;
        return rand;
    }
}