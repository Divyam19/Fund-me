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

    address public owner ;

    constructor() {
        owner = msg.sender;    
    }
    
    
    function withdraw() public  onlyOwner {
        // require(msg.sender == owner, "Must be owner!");
        for(uint256 i = 0 ; i<funders.length ; i++){
            address funder = funders[i];
            addressToAmountFunded[funder] = 0;
        }
        funders = new address[](0);

        // transfer
        // payable (msg.sender).transfer(address(this).balance);
        // // send
        // bool sendSuccess = payable(msg.sender).send(address(this).balance);
        // require(sendSuccess ,"failed to send funds to user");

        // call
        (bool callSuccess , ) = payable(msg.sender).call{value: address(this).balance}("");
        require(callSuccess,"Call Faliure");
    }
    
    modifier  onlyOwner() {
        require(msg.sender == owner, "Sender is not Owner!");
        _;
    }

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