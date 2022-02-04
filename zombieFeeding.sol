pragma solidity >=0.5.0 <0.6.0;

import "./zombiefactory.sol";

contract ZombieFeeding is ZombieFactory {

  function feedAndMultiply(uint _zombieId, uint _targetDna) public {
    require(msg.sender == zombieToOwner[_zombieId]);
    Zombie storage myZombie = zombies[_zombieId];
    // start here
  }

}

Zombie[] public ownerArmy; 

getZombiesByOwner(address _owner) external view {
    for(uint idx=0,idx<zombies.length, idx++) {
      if (zombieToOwner[idx] == _owner){
        ownerArmy.push(zombies[idx]);
      }
    } 
    return uint ownerZombieCount[_owner]
  }

uint[] memory values = new uint[](3); //TODO  What this 'new' thing here?