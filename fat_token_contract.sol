pragma solidity ^0.6.0;

contract MyToken{
    uint32 maxLimit = 10000000;
    string tokenName = "ApeToken";
    string symbol = "FAT";
    mapping(address => uint256) ownerBalance;  // Storing how much FAT you have
    mapping(address => address[]) ownerApprovedAddress; // Storing who can transfer your tokens for you

    function transfer(address _from, address _to, uint amount) public{
        bool approved = false;
        for(uint i; i<ownerApprovedAddress[_from].length;i++){
            if(msg.sender == ownerApprovedAddress[_from][i]){
                approved = true;
            }
        }
        // Check that only owner or approved address can move a fund and that the address has enough $FAT
        require((msg.sender == _from || approved) && ownerBalance[_from] >= amount,"balance too low or you are not approved to transfer tokens");
        ownerBalance[_from] -= amount;
        ownerBalance[_to] += amount;
    }

    function approve(address _from, address _to) external{
        require(msg.sender == _from, "Only owner can approve another address to transfer tokens");
        ownerApprovedAddress[_from].push(_to);
    }

    function getBalance(address owner) public view returns(uint) {
        return ownerBalance[owner];
    }
}
