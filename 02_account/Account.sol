pragma solidity ^0.4.24;

/**
* @title Account
* @author Jan Foryś
* @notice This contract will return account balance and its address.
*/

contract Account {

    // State variables
    address owner;

    constructor () public {
        owner = msg.sender;
    }

    modifier onlyOwner() {
        require(owner == msg.sender, "Only owner can check his own account balance.");
        _;
    }

    // function that returns contract address
    function getContractAddress() public view returns (address) {
        return this;
    }

    // function that returns address of contract's owner
    function getOwnerAddress() public view returns (address) {
        return owner;
    }

    // function that returns address of sender (i.e. person who is calling a function)
    function getSenderAddress() public view returns (address) {
        return msg.sender;
    }

    // function that returns contract balance
    function getContractBalance() public view returns (uint) {
        return address(this).balance;
    }

    // function that returns balance of contract's owner account (and only owner can call this function)
    function getOwnerBalance() public view onlyOwner returns (uint) {
        return owner.balance;
    }   
    
    // function that returns balance of sender account (i.e. person who is calling a function)
    function getSenderBalance() public view returns (uint) {
        return msg.sender.balance;
    }   

}