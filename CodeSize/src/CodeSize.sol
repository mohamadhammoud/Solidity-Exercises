// SPDX-License-Identifier: BUSL-1.1
pragma solidity ^0.8.13;

contract CodeSize {
    /**
     * The challenge is to create a contract whose runtime code (bytecode) size is greater than 1kb but less than 4kb
     */

    uint256 public largeNumber;
    mapping(uint256 => uint256) public storageMap;

    constructor() {
        largeNumber = 123456789;
    }

    function storeData(uint256 key, uint256 value) public {
        storageMap[key] = value;
    }

    function getData(uint256 key) public view returns (uint256) {
        return storageMap[key];
    }

    function performComputation() public pure returns (uint256) {
        uint256 sum = 0;
        for (uint256 i = 0; i < 100; i++) {
            sum += i * i;
        }
        return sum;
    }

    function dummyFunction1(uint256 x) public pure returns (uint256) {
        return x * x + 42;
    }

    function dummyFunction2(uint256 x) public pure returns (uint256) {
        return x * x + 84;
    }

    function dummyFunction3(uint256 x) public pure returns (uint256) {
        return x * x + 126;
    }

    function dummyFunction4(uint256 x) public pure returns (uint256) {
        return x * x + 168;
    }

    function dummyFunction5(uint256 x) public pure returns (uint256) {
        return x * x + 210;
    }

    function dummyFunction6(uint256 x) public pure returns (uint256) {
        return x * x + 252;
    }

    function dummyFunction7(uint256 x) public pure returns (uint256) {
        return x * x + 294;
    }

    function dummyFunction8(uint256 x) public pure returns (uint256) {
        return x * x + 336;
    }

    function dummyFunction9(uint256 x) public pure returns (uint256) {
        return x * x + 378;
    }

    function dummyFunction10(uint256 x) public pure returns (uint256) {
        return x * x + 420;
    }

    function complexComputation(uint256 input) public pure returns (uint256) {
        uint256 result = input;
        for (uint256 i = 1; i < 50; i++) {
            result = (result * i) % 123456789;
        }
        return result;
    }
}
