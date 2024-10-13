// Get funds from users
// Withdaw funds
// Set a minimum funding value in USD

// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

contract FundMe{
    uint256 public minUsd = 5;
    function fund() public payable {
        //Allow users to send $
        //Have a minimum $ sent
        //How do we send ETh to this contract

        require(msg.value > minUsd , "didnt send enough eth"); // 1e18 = 1ETH = 1000000000000000000 = 1 * 10**18


    }
    
    
    //function withdraw() public {}
}