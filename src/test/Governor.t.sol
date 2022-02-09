// SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.10;

import "ds-test/test.sol";
import { Hevm } from "hevm/Hevm.sol";
import "../Governor.sol";
import "../Token.sol";
import "@openzeppelin/contracts/governance/TimelockController.sol";

contract User {}

contract MockToken is GovToken {
    constructor () GovToken("test", "test") {}
}

contract GovernorTest is Hevm, DSTest {
    MockToken internal token;
    TimelockController internal timelock;
    MyGovernor internal govna;
    User internal user;

    address[] internal proposers;
    address[] internal executors;

    function setUp() public {
        user = new User();
        token = new MockToken();
        token.mint(address(user), 20 ether);
        assertEq(token.totalSupply(), 20 ether);
        assertEq(token.balanceOf(address(user)), 20 ether);
        timelock = new TimelockController(3600, proposers, executors);
        govna = new MyGovernor(token, timelock);
    }

    function testVotingDelay() public {
        uint256 period = govna.votingDelay();
        assertEq(period, 1);
    }
    function testVotingPeriod() public {
        uint256 period = govna.votingPeriod();
        assertEq(period, 6545); // 1 day in blocks
    }

}