pragma solidity ^0.4.0;

contract address_to_Identity {

    struct Identity{
        string names;
        string surnames;
        uint birth_date;
        string town_of_birth;
        string town_of_origin;
    }

    mapping (address => string) Identity_from_address;
    // 1 of many to n>=1 of many

    mapping (string => address) address_from_Identity;
    // 1 of many to =1 of many
    
    modifier knowsThePeer(address_of_a_peer) {
        require(IKnowThePeer[address_of_a_peer]);
        _;
    }

    function map_sender_address_to_Identity(string Identity) public {
        Identity_from_address[msg.sender] = Identity;
        address_from_Identity[Identity] = msg.sender;
    }
    
    function map_address_to_Identity(address address_of_a_peer, string Identity) 
    public IKnowThePeer(address_of_a_peer) {
        Identity_from_address[address_of_a_peer] = Identity;
        address_from_Identity[Identity] = address_of_a_peer;
    }
}