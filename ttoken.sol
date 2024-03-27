// SPDX-License-Identifier: GPL-3.0.
pragma solidity ^0.8.0; 
contract lb {
address public player;
uint public randomNumber;
bool public isGameFinished;
constructor() {
player = msg.sender;
randomNumber = uint(keccak256(abi.encodePacked(block.timestamp,msg.sender, blockhash(block.number -1)))) % 100; // Генерация случайного числа
isGameFinished = false;
}
function guess(uint _number) public {
require(msg.sender == player, "Only the player can guess the number");
require(!isGameFinished, "The game is already finished");
if (_number == randomNumber) {
isGameFinished = true;
}
}
function getHint() public view returns (string memory) {
require(msg.sender == player, "Only the player can get hints");
require(!isGameFinished, "The game is already finished");
if (randomNumber > 50) {
return "The number is greater than 50";
} else {
return "The number is less than or equal to 50";
}
}
}