// SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.10;

import "ds-test/test.sol";
import { Hevm } from "hevm/Hevm.sol";
import "../Contract.sol";

contract BearlyTest is Hevm, DSTest {
    Bearly internal bearly;

    function setUp() public {
        bearly = new Bearly("test", "test");
    }

    function testCanMint() public {
        hevm.prank(address(1));
        bearly.mint();
        assertEq(bearly.totalSupply(), 1);
    }

    function testOwnerUpdateBaseURI() public {
        string memory uri = "new uri";
        bearly.setBaseURI(uri);
        assertEq(bearly.baseURI(), uri);
    }

    function testOnlyOwnerUpdateBaseURI() public {
        string memory uri = "new uri";
        hevm.prank(address(1));
        hevm.expectRevert(abi.encodeWithSignature("NotOwner()"));
        bearly.setBaseURI(uri);
    }
}
