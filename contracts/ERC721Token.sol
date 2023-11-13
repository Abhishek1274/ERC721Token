// SPDX-License-Identifier: undefined
pragma solidity >=0.4.22 <0.9.0;
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts/utils/Strings.sol";
contract ERC721Token is ERC721,Ownable,ERC721URIStorage{
    uint public tokenIds=0;
    

constructor(string memory name,string memory symbol) ERC721(name, symbol) Ownable(msg.sender)  {
}
function _baseURI() internal pure override returns (string memory) {
        return
            "https://bafybeicl4du5f6z7gru5txno5tuzea4kttic2i4otgrxnwdaraskzcgcoa.ipfs.dweb.link/";
    }
function safeMint(address to) public onlyOwner {
        tokenIds++;
        uint tokenId=tokenIds;

        
        _safeMint(to, tokenId);
        tokenURI(tokenId);
        
    }
    function burn(uint tokenId) public onlyOwner{
        _burn(tokenId);
    }

 function tokenURI(uint256 tokenId) public pure override(ERC721, ERC721URIStorage) returns (string memory) {
        string memory base = _baseURI();
        return string.concat(base,Strings.toString(tokenId), ".json");
    }
function supportsInterface(bytes4 interfaceId) public view override(ERC721, ERC721URIStorage) returns (bool) {
        return super.supportsInterface(interfaceId);
    }
}

