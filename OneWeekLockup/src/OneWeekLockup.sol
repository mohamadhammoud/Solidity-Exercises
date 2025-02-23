// SPDX-License-Identifier: BUSL-1.1
pragma solidity ^0.8.13;

contract OneWeekLockup {
    /**
     * In this exercise you are expected to create functions that let users deposit ether
     * Users can also withdraw their ether (not more than their deposit) but should only be able to do a week after their last deposit
     * Consider edge cases by which users might utilize to deposit ether
     *
     * Required function
     * - depositEther()
     * - withdrawEther(uint256 )
     * - balanceOf(address )
     */
    mapping(address => uint256) private _balances;
    mapping(address => uint256) private _lastDepositTime;
    function balanceOf(address user) public view returns (uint256) {
        // return the user's balance in the contract
        return _balances[user];
    }

    function depositEther() external payable {
        /// add code here
        _balances[msg.sender] += msg.value;
        _lastDepositTime[msg.sender] = block.timestamp;
    }

    function withdrawEther(uint256 amount) external {
        /// add code herer
        require((block.timestamp) > (_lastDepositTime[msg.sender] + 1 weeks));
        require(amount <= _balances[msg.sender]);
        _balances[msg.sender] -= amount;
        payable(msg.sender).transfer(amount);
    }
}
