const { ethers } = require("hardhat");
const hre = require("hardhat");

async function main() {

  const Auction = await ethers.deployContract("Auction",["MyNFT","MNFT"]);
  console.log("Auction: ", Auction.target);

}

main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});
