// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.9;


interface IChallenge {
    function exploit_me(string memory _name) external;
    function lock_me() external;
    function pause(bool _status) external;
    function getAllwiners() external view returns (string[] memory _names);
}