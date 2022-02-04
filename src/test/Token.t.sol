// SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.10;

import "ds-test/test.sol";
import { Hevm } from "hevm/Hevm.sol";
import "../Token.sol";

contract TokenTest is Hevm, DSTest {
    GovToken internal token;

    function setUp() public {
        token = new GovToken("test", "test");
    }

    function test_mint() public {
        token.mint(address(1), 20 ether);
        assertEq(token.totalSupply(), 20 ether);
    }

    function test_mintNotOwner() public {
        hevm.prank(address(1));
        hevm.expectRevert('Ownable: caller is not the owner');
        token.mint(address(1), 20 ether);
    }
}