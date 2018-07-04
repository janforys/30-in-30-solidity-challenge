pragma solidity ^0.4.23;

/**
* @title Account
* @author Jan Foryś
* @notice This contract will return account balance and its address.
*/

contract Account {

    address contractAddress;
    address ownerAddress;
    address senderAddress;
    uint accountBalance;
    uint ownerBalance;
    uint senderBalance;

    // function that returns contract address
    // function that returns address of contract's owner
    // function that returns address of sender (i.e. person who is calling a function)
    // function that returns account balance
    // function that returns balance of contract's owner account (and only owner can call this function)
    // function that returns balance of sender account (i.e. person who is calling a function)
}