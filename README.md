# OwNifty
Code to tokenize smart contract ownership - create ERC721 ownership token that can be transferred, traded on DeFi platforms, used as asset
Works with all Ownable smart contracts

### Steps to tokenize ownership

1. Call setOwnership (parameter is SC address for tokenization)
2. Transfer ownership to the smart contract
3. Call mintOwNifty function

To burn token and redeem ownership, call burnOwNifty
