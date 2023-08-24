// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract Auction is ERC721, Ownable {
    struct NFT {
        uint256 tokenId;
        string name;
        string description;
        address highestBidder;
        uint256 highestBid;
    }

    mapping(uint256 => NFT) public nfts;

    constructor(string memory name, string memory symbol) ERC721(name, symbol) {
    }

    function createNFT(uint256 tokenId, string memory name, string memory description) external onlyOwner {
        nfts[tokenId] = NFT({ tokenId: tokenId, name: name, description: description, highestBidder: address(0), highestBid: 0 });
    }

    function placeBid(uint256 tokenId) external payable {
        NFT storage nft = nfts[tokenId];
        require(msg.value > nft.highestBid, "Bid must be higher");

        nft.highestBidder = msg.sender;
        nft.highestBid = msg.value;
    }
}
