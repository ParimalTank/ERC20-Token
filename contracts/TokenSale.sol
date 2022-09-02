// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.15;

import "./Parimal_19IT141.sol";

contract TokenSale {
    address admin;
    Parimal_19IT141 public tokenContract;
    uint256 public tokenPrice;
    uint256 public tokensSold;

    event Sell(address _buyer, uint256 _amount);

    constructor(Parimal_19IT141 _tokenContract, uint256 _tokenPrice) {
        admin = msg.sender;
        tokenContract = _tokenContract;
        tokenPrice = _tokenPrice;
    }

    function multiply(uint256 x, uint256 y) internal pure returns (uint256 z) {
        require(y == 0 || (z = x * y) / y == x);
    }

    //buy token
    function buyTokens(uint256 _numberOfTokens) public payable {
        require(msg.value == multiply(_numberOfTokens, tokenPrice));
        require(tokenContract.balanceOf(address(this)) >= _numberOfTokens);
        require(tokenContract.transfer(msg.sender, _numberOfTokens));

        tokensSold += _numberOfTokens;

        emit Sell(msg.sender, _numberOfTokens);
    }

    /*
        buy function explanation and intial requirement 
       
        -> Require that value is equle to tokens
        -> Rquire that the contarct has enough tokens
        -> Reuire that a transfer is successfull tokens
        -> Keep Track of tokens Sold
        -> Trigger Sell Event
    */

    function endSale() public payable {
        require(msg.sender == admin);
        require(
            tokenContract.transfer(
                admin,
                tokenContract.balanceOf(address(this))
            )
        );

        // UPDATE: Let's not destroy the contract here
        // Just transfer the balance to the admin
        //admin.transfer(address(this).balance);
        selfdestruct(payable(admin));
    }
}
