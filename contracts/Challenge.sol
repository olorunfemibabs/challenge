// SPDX-License-Identifier: UNLICENSED
pragma solidity 0.8.18;

// The goal of this challenge is to be able to add your address to the array of winners.
// pass in your name that will be attached to the address.

contract Challenge{
    address owner;
    address[] public winners;
    mapping(address => bool) public HasInteracted;
    mapping(address => string) public  Names;
    bool lock;
    bool isPause;

    constructor(){
        owner=msg.sender;
        
    }

    function exploit_me(string memory _name) public{
        require(!isPause);
        lock = false;

        msg.sender.call("");

        require(lock);
        require(HasInteracted[msg.sender] == false, "This address has interacted before");

        HasInteracted[msg.sender] = true;
        winners.push(tx.origin);
        Names[tx.origin] = _name;
    }

    function lock_me() public{
        lock = true;
    }

    function pause(bool _status) external{
        require(msg.sender == owner);
        isPause = _status;



    }

     function getAllwiners() external view returns (string[] memory _names){
            _names = new string[](winners.length); 
            for(uint i; i < winners.length; i++){
                _names[i] = Names[winners[i]];
            }
     }

}