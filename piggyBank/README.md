# Piggy bank contract

## Idea
contract where you can just deposit funds and once you want to redeem all the collected funds,
you call a function to break it i.e. the function stops accepting any more money, transfers it to owner's account and you have to 
create a new contract(new piggy bank) i.e. start over.

## Contract skeleton- 
You supply an address that should be the owner of that piggy bank.Implement the following functions:

1.) addFunds public payable - only when the bank is functioning.
2.) breakBank onlyOwner - returns the funds to the owner and restricts further addition rendering the piggyBank useless
3.) getBalance public
