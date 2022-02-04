// SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.10;

import "ds-test/test.sol";
import { Hevm } from "hevm/Hevm.sol";
import "../Token.sol";

contract TokenTest is Hevm, DSTest {
    GovToken internal token;

    function setUp() public {
        token = new GovToken("token", "token");
    }
}