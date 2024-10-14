// Get funds from users
// Withdaw funds
// Set a minimum funding value in USD

// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;
import {PriceConverter} from "contracts/PriceConverter.sol";
contract FundMe{
    using PriceConverter for uint256;
    mapping(address funder => uint256 amountFunded) public addressToAmountFunded ;
    address[] public funders;
    uint256 public minUsd = 5e18;
    function fund() public payable {
        require(msg.value.getConversionRate() >= minUsd , "didnt send enough eth"); // 1e18 = 1ETH = 1000000000000000000 = 1 * 10**18
        funders.push(msg.sender);
        addressToAmountFunded[msg.sender] = addressToAmountFunded[msg.sender] + msg.value;

    }
    
    
    //function withdraw() public {}
    

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