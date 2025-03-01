// SPDX-License-Identifier: BUSL-1.1
pragma solidity ^0.8.13;

contract FilterOddNumbers {
    /*
        This exercise assumes you understand how to manipulate Array.
        1. Function `filterOdd` takes an array of uint256 as argument. 
        2. Filter and return an array with the odd numbers removed.
        Note: this is tricky because you cannot allocate a dynamic array in memory, 
              you need to count the even numbers then declare an array of that size.
    */

    function filterOdd(
        uint256[] memory _arr
    ) public view returns (uint256[] memory) {
        uint256 length = _arr.length;
        uint256 count = 0;

        // Allocate max possible memory size (we will update the length later by Yul)
        uint256[] memory tempArr = new uint256[](length);

        for (uint256 i = 0; i < length; i++) {
            if (_arr[i] % 2 == 0) {
                tempArr[count] = _arr[i]; // store only even numbers
                count++;
            }
        }

        // ;) update memory array to actual even count (low-level assembly)
        assembly {
            mstore(tempArr, count) // Update memory array length
        }

        return tempArr;
    }
}
