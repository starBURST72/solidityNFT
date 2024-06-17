pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract MyNFT is ERC721, Ownable {
    uint256 public tokenCounter;

    constructor() ERC721("MyNFT", "MNFT") {}

    function mint(address to) public onlyOwner returns (uint256) {
        _safeMint(to, tokenCounter);
        tokenCounter = tokenCounter + 1;
        return tokenCounter;
    }

    function getOwnerOf(uint256 tokenId) public view returns (address) {
        return ownerOf(tokenId);
    }

    function transferNFT(address to, uint256 tokenId) public {
        require(_isApprovedOrOwner(_msgSender(), tokenId), "Caller is not owner nor approved");
        _transfer(msg.sender, to, tokenId);
    }
}
