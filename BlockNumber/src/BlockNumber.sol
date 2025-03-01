// SPDX-License-Identifier: BUSL-1.1
pragma solidity ^0.8.13;

contract BlockNumber {
    /**
     * In this exercise the function lastCaller stores the address of the caller of the function in the lastCaller stateVariable
     * The task is to make this function only callable once per block.
     * If it is called more than once per block, the second and later calls revert.
     * To pass the test, it needs a storage variable that stores the last blocknumber where it was accessed.
     */

    address public lastCaller;
    mapping(uint256 => bool) private _blockNumber;

    function callMe() external {
        require(
            _blockNumber[block.number] == false,
            "BlockNumber: can only be called once per block"
        );
        /// your code here
        lastCaller = msg.sender;
        _blockNumber[block.number] = true;
    }
}
