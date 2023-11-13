const { ethers } = require("hardhat");

async function main() {
  // Deploy the ERC721 contract
  const AbhishekNFT = await ethers.getContractFactory("ERC721Token");
  const Abhisheknft = await AbhishekNFT.deploy("MeenaToken","MT"); // Pass the arguments

  //await Abhisheknft.deployed();

  console.log("Abhishek Token deployed to:", Abhisheknft.target);
}

main()
  .then(() => process.exit(0))
  .catch((error) => {
    console.error(error);
    process.exit(1);
  });