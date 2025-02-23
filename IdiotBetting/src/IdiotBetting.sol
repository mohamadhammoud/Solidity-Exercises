// SPDX-License-Identifier: BUSL-1.1
pragma solidity ^0.8.13;

contract IdiotBettingGame {
    /*
        This exercise assumes you know how block.timestamp works.
        - Whoever deposits the most ether into a contract wins all the ether if no-one 
          else deposits after an hour.
        1. `bet` function allows users to deposit ether into the contract. 
           If the deposit is higher than the previous highest deposit, the endTime is 
           updated by current time + 1 hour, the highest deposit and winner are updated.
        2. `claimPrize` function can only be called by the winner after the betting 
           period has ended. It transfers the entire balance of the contract to the winner.
    */
    address winner;
    uint256 highestDeposit;
    uint256 lastDepositTime;

    function bet() public payable {
        // your code here
        if (msg.value > highestDeposit) {
            highestDeposit = msg.value;
            winner = msg.sender;
            lastDepositTime = block.timestamp;
        }
    }

    function claimPrize() public {
        // your code here
        require(
            msg.sender == winner &&
                block.timestamp > (lastDepositTime + 1 hours),
            "Only winner can claim prize"
        );
        payable(winner).transfer(address(this).balance);

        // I Prefer this option
        // if (
        //     winner == msg.sender &&
        //     block.timestamp > (lastDepositTime + 1 hours)
        // ) {
        //     payable(winner).transfer(address(this).balance);
        // }
    }
}
