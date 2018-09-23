pragma solidity ^0.4.0;

import "./acquaintances.sol";

contract address_to_Identity {
    constructor(address where_acquaintances_live) {
        acquaintances 
        use_acquaintances_to = acquaintances(where_acquaintances_live);
    }

    struct Identity{
        string names;
        string surnames;
        uint birth_date;
        string town_of_birth;
        string town_of_origin;
    }

    mapping (address => string) Identity_from_address;
    // 1 of many to =1 of many possible

    mapping (string => address) address_from_Identity;
    // 1 of many to =1 of many
    
    modifier to_know_the_peer(address_of_a_peer) {
        require(use_acquaintances_to.confirm_whether_they_know_me_or_not(address_of_a_peer));
        _;
    }

    function map_sender_address_to_Identity(string Identity) public {
        Identity_from_address[msg.sender] = Identity;
        address_from_Identity[Identity] = msg.sender;
    }
    
    function map_address_to_Identity(address address_of_a_peer, string Identity) 
    public I_know_the_peer(address_of_a_peer) {
        Identity_from_address[address_of_a_peer] = Identity;
        address_from_Identity[Identity] = address_of_a_peer;
    }
}