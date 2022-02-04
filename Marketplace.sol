pragma solidity ^0.6.0;

import "./safemath.sol";

contract Marketplace{
    uint escrowBalance;
    uint immutable itemPrice;
    address payable buyer;
    address payable seller;
    bool buyerDissolves;
    bool sellerDissolves;
    bool buyerDeposited;
    bool sellerDeposited;

    constructor(address payable _buyer, address payable _seller, uint _itemPrice){
        escrowBalance = 0;
        seller = _seller;
        buyer = _buyer;
        itemPrice = _itemPrice;
        sellerDeposited = false;
        buyerDeposited = false;
    }

    modifier onlyBuyer(){
        require(msg.sender == buyer,"only buyer alllowed to perform this operation");
    }
    modifier onlySeller(){
        require(msg.sender == seller,"only seller alllowed to perform this operation");

    }

    event FundsAdded(address sender);
    event BuyerDissolved(uint time);
    event SellerDissolved(uint time);

    function addFunds() external payable {
        require((msg.sender == seller || msg.sender == buyer) && msg.value == 2*itemPrice,"Either you're not authorized or wrong amount");
        if(msg.sender==buyer){
            buyerDeposited = true;
            emit FundsAdded(buyer);
        }
        else{
            sellerDeposited = true;
            emit FundsAdded(seller);
        }
    }

    function dissolve() external{
        if(msg.sender == buyer){
            buyerDissolves = true;
            emit BuyerDissolved(now);
        }
        else if(msg.sender == seller){
            sellerDissolves = true;
            emit SellerDissolved(now);
        }

    }

    function dissolveAndReturnFunds() public {
        require(buyerDissolves && sellerDissolves,"Both parties need to agree to dissolve contract and return funds");
        seller.transfer(3*itemPrice);
        buyer.transfer(itemPrice);
    }

    function getItemPrice() public view returns(uint){
        return itemPrice;
    }
}