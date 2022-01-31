// SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.0;

import "solmate/tokens/ERC721.sol";
import "./Ownable.sol";

contract Bearly is ERC721, Ownable {
    string public baseURI;
    uint256 public totalSupply;

    constructor(string memory name_,  string memory symbol_) ERC721(name_, symbol_) {}

    /// @notice safely mint token to sender
    function mint() external payable {
        totalSupply++;
        _safeMint(msg.sender, totalSupply);
    }

    function setBaseURI(string memory uri) external onlyOwner {
        baseURI = uri;
    }

    function tokenURI(uint256 id) public view override returns (string memory) {
        return string(abi.encodePacked(baseURI, id, ".json"));
    }
}
