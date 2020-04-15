pragma solidity ^0.6.4;

contract EtheremonLite {
    function initMonster(string memory _monsterName) public {}
    function getName(address _monsterAddress) public view returns(string memory) {}
    function getNumWins(address _monsterAddress) public view returns(uint) {}
    function getNumLosses(address _monsterAddress) public view returns(uint) {}
    function battle() public returns(uint256){}
}

contract WinBattle {

    event DiceOutcome(uint dice);

    EtheremonLite public etheremonLite;
    constructor() public {
        etheremonLite = EtheremonLite(0x9E30144D5e89e7718339D12f526705A85BEDD8F3);
    }

    function create_my_monster() public {
        etheremonLite.initMonster("sl2883");
    }

    function fight() public {
        uint dice = uint(blockhash(block.number - 1));
        dice = dice/85;
        emit DiceOutcome(dice % 3);
        if(dice % 3 == 0) {
            etheremonLite.battle();
        }
        else {
        }
    }

    function getNumWins(address _monsterAddress) public view returns(uint) {
        return etheremonLite.getNumWins(_monsterAddress);
    }

    function getNumLosses(address _monsterAddress) public view returns(uint) {
        return etheremonLite.getNumLosses(_monsterAddress);
    }

    function getName(address _monsterAddress) public view returns(string memory) {
        return etheremonLite.getName(_monsterAddress);
    }
}


