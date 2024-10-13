// Get funds from users
// Withdaw funds
// Set a minimum funding value in USD

// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

import {AggregatorV3Interface} from "@chainlink/contracts/src/v0.8/shared/interfaces/AggregatorV3Interface.sol";

contract FundMe{
    uint256 public minUsd = 5;
    function fund() public payable {
        //Allow users to send $
        //Have a minimum $ sent
        //How do we send ETh to this contract

        require(msg.value > minUsd , "didnt send enough eth"); // 1e18 = 1ETH = 1000000000000000000 = 1 * 10**18


    }
    
    
    //function withdraw() public {}
    function getprice() public view returns (uint256){ 
        //Address
        //ABI
        AggregatorV3Interface priceFeed = AggregatorV3Interface(0x694AA1769357215DE4FAC081bf1f309aDC325306);
        (/*uint80 roundId*/,
        int price,
        /*uint startedAt*/,
        /*uint timeStamp*/,
        /*uint80 answeredInRound*/ ) = priceFeed.latestRoundData();
        // pricein terms of usd
        //2000.00000000
        return uint256(price * 1e18);
    }
    function getConversionRate() public {}

}

/*
     
     * Network: Sepolia
     * Aggregator: ETH/USD
     * Address: 0x694AA1769357215DE4FAC081bf1f309aDC325306
     *//*
    constructor() {
        dataFeed = AggregatorV3Interface(
            0x694AA1769357215DE4FAC081bf1f309aDC325306
        );
    }
*/