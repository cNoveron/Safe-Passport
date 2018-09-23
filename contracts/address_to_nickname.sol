pragma solidity ^0.4.0;

contract address_to_nickname {

    mapping (address => string) nickname_from_address;
    // 1 of many to n>=1 of many

    mapping (string => address) address_from_nickname;
    // 1 of many to =1 of many
    
    function map_my_address_to_nickname(string nickname) public {
        nickname_from_address[msg.sender] = nickname;
        address_from_nickname[nickname] = msg.sender;
    }
    
    function map_someones_address_to_nickname(address address_of_other_person, string nickname) public {
        nickname_from_address[address_of_other_person] = nickname;
        address_from_nickname[nickname] = address_of_other_person;
    }

    function get_address_from_nickname(string nickname_of_other_person) {
        return address_from_nickname[nickname_of_other_person];
    }
}