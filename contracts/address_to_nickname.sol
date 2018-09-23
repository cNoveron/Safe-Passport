pragma solidity ^0.4.0;

contract address_to_nickname {

    mapping (address => string) nickname_from_address;
    // 1 of many to n>=1 of many

    mapping (string => address) address_from_nickname;
    // 1 of many to =1 of many
    
    function map_sender_address_to_nickname(string nickname) public {
        nickname_from_address[msg.sender] = nickname;
        address_from_nickname[nickname] = msg.sender;
    }
    
    function map_address_to_nickname(address address_of_third_party, string nickname) public {
        nickname_from_address[address_of_third_party] = nickname;
        address_from_nickname[nickname] = address_of_third_party;
    }
}