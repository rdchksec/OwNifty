pragma solidity >=0.6.0 <0.8.0;

import "@openzeppelin/contracts/token/ERC721/ERC721Burnable.sol";
import "@openzeppelin/contracts/GSN/Context.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract OwNifty is Context, ERC721Burnable {

  mapping (address => address) owners;

  constructor() public ERC721("OwNifty", "OwNFT") {

  }

  /**
     * @dev Saves current contract owner to owners array
  */
  function setOwnership(address _scAddr) public {
    Ownable _sc = Ownable(_scAddr);
    owners[_scAddr] = _sc.owner();
  }

  /**
     * @dev Creates NFT based no smart contract setOwnership
     * Note. setOwnership should be called and contract owner should be this contract
  */
  function mintOwNifty(address _scAddr) public {
    Ownable _sc = Ownable(_scAddr);
    require(_sc.owner() == address(this));
    require(owners[_scAddr] == msg.sender);
    super._mint(msg.sender, uint(_scAddr));
  }

  /**
     * @dev Burns NFT and returns ownership to token owner
  */
  function burnOwNifty(address _scAddr) public {
    require(msg.sender == ownerOf(uint(_scAddr)));
    Ownable _sc = Ownable(_scAddr);
    _sc.transferOwnership(msg.sender);
    _burn(uint(_scAddr));
  }

  /**
     * @todo Create function that can perform delegate call to contract
     * with tokenized ownership on owner behalf
  */

}
