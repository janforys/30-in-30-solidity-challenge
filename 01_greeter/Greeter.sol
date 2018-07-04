pragma solidity ^0.4.23;

/** 
* @title Greeter
* @author Jan Foryś
* @notice What this very simple contract does is only displaying greetings.
*/

contract Greeter {      // Contract's name

    // State variables
    address owner;
    string greetings;
  
    // Contract's constructor which initializes variables during creating it
    constructor() public {
        greetings = "Hello Daddy!";
        owner = msg.sender;
    }
    
    // Function modifier which allows to check if only owner of the contract is calling "setGreetings" function
    modifier onlyOwner() {
        require(msg.sender == owner, "Only owner can call this function.");
        _;
    }

    // Here you can type your own greeting
    function setGreetings(string _newGreetings) public onlyOwner {      
        greetings = _newGreetings;
    }

    // This function returns greetings string
    function sayHello() public view returns (string) {      
        return greetings;
    } 
  
}