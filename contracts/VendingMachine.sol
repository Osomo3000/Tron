// SPDX-License-Identifier: MIT
pragma solidity ^0.8.6;

contract VendingMachine {
    address public manager;
    address payable[] public customer;

    constructor() public {
        manager = msg.sender;
    }


    receive() external payable{
        customer.push(payable(msg.sender));
    }

    struct Drink {
        string name;
        string size;
        string price;
    }

    Drink[] public drinks;
    mapping(address => bool) public customers;

    // amount in wei
    function buy() public payable {
        require(msg.value > 0);
        customers[msg.sender] = true;
    }

    function addDrink(
        string memory _name,
        string memory _size,
        string memory _price
    ) public restricted {
        Drink memory newDrink = Drink({
            name: _name,
            size: _size,
            price: _price
        });
        drinks.push(newDrink);
    }

    function getDrinkList(uint256 _index)
        public
        view
        returns (
            string memory name,
            string memory size,
            string memory price
        )
    {
        Drink storage drink = drinks[_index];
        return (drink.name, drink.size, drink.price);
    }

    modifier restricted() {
        require(msg.sender == manager);
        _;
    }
}