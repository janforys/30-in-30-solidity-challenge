pragma solidity ^0.4.23;

contract Greeter {

    address owner;
    string greetings;
  
    constructor() public {
        greetings = "Hello Daddy!";
        owner = msg.sender;
    }
  
    modifier onlyOwner() {
        require(msg.sender == owner, "Only owner can call this function.");
        _;
    }

    function setGreetings(string _newGreetings) public onlyOwner {
        greetings = _newGreetings;
    }

    function sayHello() public view returns (string) {
        return greetings;
    } 
  
}