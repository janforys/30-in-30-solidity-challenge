pragma solidity ^0.4.24;

/**
* @title Lottery
* @author Jan Foryś
* @notice A Lottery contract to participate for 10 people 
*/

contract Lottery10 {
   
    address[10] participants;    // 10 participants limit
    uint8 participantsCount = 0;
    uint Nonce = 0;
    
    
    function join() public payable {
        require(msg.value == 0.1 ether, "Must send 0.1 ether");     // minimum 0.1 ether to contribute
        require(participantsCount < 10, "User limit reached");
        require(_joinedAlready(msg.sender) == false, "User already joined");    // one chance to join the lottery
        participants[participantsCount] = msg.sender;
        participantsCount++;
        if (participantsCount == 10) {
            _selectWinner();
        }
    }
    
    function _joinedAlready(address _participant) private view returns (bool) {
        bool containsParticipant = false;
        for (uint i = 0; i < 10; i++) {
            if (participants[i] == _participant) {
                containsParticipant == true;
            }
        }
    }
   
    // owner of the contract can participate
    // draw a winner when we have 10 participant
    // winner gets all money
    function _selectWinner() private returns (address) {
        require(participantsCount == 0, "Waiting for more users");
        address winner = participants[_randomNumber()];
        winner.transfer(address(this).balance);
        delete participants;
        participantsCount = 0;
        return winner;
    }
    
    function _randomNumber() private returns(uint) {
        uint rand = uint(keccak256(abi.encodePacked(now, msg.sender, Nonce))) % 3;
        Nonce++;
        return rand;
    }
    
    // new lottery starts immediately after ending previous one
}