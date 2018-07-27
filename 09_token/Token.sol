pragma solidity ^0.4.24;

/**
* @title Token
* @author 
* @notice Simple Token.
*/

contract BasicToken {

    uint initialValue;

    mapping (address => uint) balances;

    constructor(uint _initialValue) public {
        initialValue = _initialValue;
        balances[msg.sender] = _initialValue;
    }

    /// Owner can transfer tokens
    function transfer(address _recipient, uint _amount) public {
        require(balances[msg.sender] >= _amount, "Not enough funds");
        require(_recipient != msg.sender, "You do not have to send tokens to yourself");
        require(balances[_recipient] + _amount > balances[_recipient]);
        balances[msg.sender] -= _amount;
        balances[_recipient] += _amount;
    }

    /// Ability to check amount of tokens
    function checkBalance(address _owner) public view returns (uint, uint) {
        return (balances[_owner], initialValue);
    }

}