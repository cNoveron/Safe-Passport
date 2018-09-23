pragma solidity ^0.4.0;

contract address_to_Pattern {

    mapping (address => Pattern) Pattern_from_address;
    // 1 of many to n>=1 of many

    mapping (Pattern => address) address_from_Pattern;
    // 1 of many to =1 of many
    
    function map_sender_address_to_Pattern(uint Pattern) public {
        Pattern_from_address[msg.sender] = Pattern;
        address_from_Pattern[Pattern] = msg.sender;
    }
    
    function map_address_to_Pattern(address address_of_third_party, uint Pattern) public {
        Pattern_from_address[address_of_third_party] = Pattern;
        address_from_Pattern[Pattern] = address_of_third_party;
    }
}