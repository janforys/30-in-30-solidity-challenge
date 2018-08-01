pragma solidity ^0.4.24;

import "./../../openzeppelin-solidity/contracts/token/ERC721/ERC721Token.sol";

/**
* @title Pioter Token
* @author Jan Foryś
* @notice This contract shows us usage of ERC721 (non fungible) Standard for our own Token.
*/

contract PioterToken is ERC721Token {

    string public constant name = "PioterToken";
    string public constant symbol = "PTR";
    
}

