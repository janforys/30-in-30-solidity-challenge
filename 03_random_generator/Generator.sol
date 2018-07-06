pragma solidity ^0.4.24;

/**
* @title Pseudo Random Generator
* @author Jan Foryś
* @notice Will generate "random" number
*/

contract Generator {

    uint Nonce = 0;

    // Function that generates random number between 0-99
    function generate() public returns (uint) {
        uint min = 0;
        uint max = 99;
        Nonce++;
        uint randomNumber = uint(keccak256(abi.encodePacked((min+max), Nonce)));
        return randomNumber;
    }

}