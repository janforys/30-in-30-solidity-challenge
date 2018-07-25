pragma solidity ^0.4.24;

/**
* @title Tic Tac Toe Game
* @author Jan Foryś
* @notice This smart contract presents tic tac toe game.
*/

contract TicTacToe {

    uint[] plate = new uint[](9);
    address player1;
    address player2;
    uint start = 0;

    uint[][] test = [ [0,1,2],[3,4,5],[6,7,8], [0,3,6],[1,4,7],[2,5,8], [0,4,8],[2,4,6] ];

    constructor() public {
        player1 = msg.sender;
    }

    function join() public {
        player2 = msg.sender;
    }

    function move(uint _place) public returns (string) {
        uint winner = checkWinner();
        if (winner == 1) {
            return "THE WINNER IS X";
        }
        if (winner == 2) {
            return "THE WINNER IS Y";
        }

        // check users
        if (start == 0) {
            if (msg.sender != player1) return "You're not Player 1!";
        else if (start == 1) {
            if (msg.sender != player2) return "You're not Player 2!";
            }
        }

        // is on plate
        if (_place < 0 || _place >= 8) return "Not on the plate";

        // is not set
        if (plate[_place] != 0) return "Already occupied";
        plate[_place] = start + 1;
        start = 1 - start;
        return "OK";
    }

    function checkWinner() public view returns (uint) {
        for ( uint i = 0; i < 8; i++) {
            uint[] memory p = test[i];
            if (plate[p[0]] != 0 && plate[p[0]] == plate[p[1]] && plate[p[0]] == plate[p[2]]) return plate[p[0]];
        }
        return 0;
    }
}