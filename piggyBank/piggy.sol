pragma solidity ^0.6.0;

import "./safemath.sol";

contract PiggyBank{
    uint32 balance;
    bool depositAllowed;
    address public owner;

    constructor(address _ownerAddress){
        owner = _ownerAddress;
        balance = 0;
    }

    modifier onlyOwner(){
        require(msg.sender == owner,"onlyOwner is allowed to perform this operation");
        _;
    }

    // How to keep track of who added funds when?
    function addMoney() public payable{
        require(depositAllowed == false,"Piggy Bank broken! No further deposits allowed");
        balance.add(msg.value);
    }

    function getBalance() public view{
        return balance;
    }

    function breakBank() external onlyowner{
        owner.transfer(balance);
        balance = 0;
        depositAllowed = false;
    }
}