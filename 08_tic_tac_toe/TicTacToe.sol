pragma solidity ^0.4.24;

/**
* @title Tic Tac Toe Game
* @author Jan Foryś
* @notice This smart contract presents tic tac toe game.
*/

contract TicTacToeGame {

    uint[] plate = new uint[](9);   // "plate" is something like a board
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

    function checkStatus(uint _place) public returns (string) {
        
        // checks if we have a winner
        string memory message = "No Winner";
        uint winner = checkWinners();
        if (winner == 1) {
            message = "X Wins!";
        }
        if (winner == 2) {
            message = "O Wins!";
        }

        // check users
        if (start == 0) {
            if (msg.sender != player1) return "You're not Player 1!";
        else if (start == 1) {
            if (msg.sender != player2) return "You're not Player 2!";
            }
        }

        // is on plate
        if (_place < 0 || _place > 8) return "Not on the plate";

        // is not already set
        if (plate[_place] >= 0 && plate[_place] <= 8) return "Already on plate";
        plate[_place] = start + 1;
        start = 1 - start;

        return (message);
    }

    function checkWinners() public view returns (uint) {
        for (uint i = 0; i < 8; i++) {
            uint[] memory p = test[i];
            if (plate[p[0]] != 0 && plate[p[0]] == plate[p[1]] && plate[p[0]] == plate[p[2]]) return plate[p[0]];
        }
        return 0;
    }

    function drawPlate() public view returns (string) {
          
        bytes memory outer = new bytes(12);
        byte[] memory signs = new byte[](3);

        // fills an array with signs
        signs[0] = "-";
        signs[1] = "X";
        signs[2] = "O";

        // fills an array with external signs
        bytes(outer)[3] = "|";
        bytes(outer)[7] = "|";
        
        for (uint i = 0; i < 9; i++) {
            bytes(outer)[i + i/3] = signs[plate[i]];
        }
             
        return (string(outer));
    }

}