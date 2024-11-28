// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.2 <0.9.0;

contract Struct {
    struct Person {
        string name;
        uint age;
        uint score;
    }

    Person p1 = Person("Zuck", 39, 98);
    Person p2 = Person({name: "AQ", age: 18, score: 97});

    string name = p1.name;
    //p1.age = 40;

    //Nested Struct

    struct Contact {
        uint phone;
        string email;
    }

    struct Emp {
        string name;
        uint age;
        Contact contact;
    }

    mapping(uint => Emp) public employees;
    uint public c;

    function addEmp(string memory _name, uint _age, uint _phone, string memory _email) public {
        employees[c] = Emp(_name, _age, Contact(_phone, _email));
        c++;
    }

    function getEmp(uint _id) public view returns(Emp memory) {
        return employees[_id];
    }

}