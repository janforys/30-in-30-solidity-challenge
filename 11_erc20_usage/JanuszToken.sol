pragma solidity ^0.4.24;

import "./StandardToken.sol";

/**
* @title Janusz Token
* @author Jan Foryś
* @notice This contract shows us usage of ERC20 (fungible) Standard for our own Token.
*/

contract JanuszToken is StandardToken {

    string public constant name = "JanuszToken";
    string public constant symbol = "JSZ";
    uint8 public constant decimals = 10;
    uint public constant initialSupply = 666 * (10 ** uint(decimals));

    constructor() public {
        balances[msg.sender] = initialSupply;
        totalSupply = initialSupply;
    }

}