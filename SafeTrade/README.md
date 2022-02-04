# TrustlessTrade Contract
This is my attempt to come up with a contract implementation based on [this]( https://docs.soliditylang.org/en/v0.8.10/solidity-by-example.html#safe-remote-purchase) idea without looking at their implementation of the same.

## Concept:
Trustless marketplace is a great idea to work upon, the concept of this contract is for a the buyer and seller to lock in 2x the money for an item that is being traded in an escrow. 
When the buyer gets the item both can choose to dissolve the contract returning the buyer 1x and the seller3x (2x for the amount they locked and 1x for the original item sold)

## Contract Skeleton

0.)the creator of the contract, sets the buyer address, seller address and the price of the item,

1.) Function to deposit 2x the amount in the contract and storing it for both buyer and seller.
it should check if both the buyer and seller add 2x the funds in the contract, otherwise return the amount received. 

2.)getItemPrice: it can be the case that when creating the contract the party that created it supplied the wrong price, so the other party can check it with this function.

3.) Function to dissolve the contract returning both the parties their respective post trade amount.Should check if both parties have voted to dissolve the contract.

4.)function to vote if the item has been shipped and whether contract should be dissolved from buyer's side. onlyBuyer.

5.)function to vote if the item has been shipped and whether contract should be dissolved from  buyer's side. onlySeller
