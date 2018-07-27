pragma solidity ^0.4.24;

/**
* @title Lottery Multiple Winners
* @author Jan Foryś
* @notice In this smart contract we have a lottery with more than one winner.
* Each winner receives his reward.
*/

contract MultipleWinners {

    address[] participants;   // no participants limit
    address owner;
    uint Nonce;
    uint newBalance;
    uint reward;

    enum LotteryState { Accepting, Finished }
    LotteryState state;

    mapping (uint => address[]) choices;

    /// Function modifier that allows only contract's owner to call certain functions
    modifier onlyOwner() {
        require(msg.sender == owner, "Only owner can do this.");
        _;
    }

    constructor() public {
        owner = msg.sender;
        state = LotteryState.Accepting;
    }

    /// Function that allows you to participate in the lottery
    function joinLottery(uint _number) public payable {

        // give number between 1-100 to participate
        require(_number >= 1 && _number <= 100, "You have to type a number between 1 and 100");
        // pay 0.1 Ether to participate
        require(msg.value == 0.1 ether, "You have to send 0.1 ETH");
        require(state == LotteryState.Accepting, "Lottery is finished");
        // put lottery participants into an array
        participants.push(msg.sender);

    }

    /// Contract's owner starts number generation from 1 to 100
    function generateNumber(uint _limit) public returns (uint) {

        uint min = 1;
        uint max = 100;
        Nonce++;
        uint randomNumber = uint(keccak256(abi.encodePacked((min+max), Nonce))) % _limit;
        return randomNumber;

    }

    function drawWinners() public onlyOwner returns (uint)  {

        // set lottery state as ended
        state == LotteryState.Finished;
        // check if we have participants in our lottery array
        require(participants.length > 0, "No participants in the Lottery");
        // user, which number was generated wins
        uint chosen = generateNumber(100) + 1;
        participants = choices[chosen];
        // 50% of the funds are distributed among the winners
        newBalance = address(this).balance / 2;
        reward = newBalance / participants.length;
        // send won funds
        participants[participants.length].transfer(reward);
        // if the lottery ends, next begins
        delete participants;  

    }   
    
}