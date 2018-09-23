pragma solidity ^0.4.0;

import "./address_to_nickname.sol";

contract acquaintance {
    constructor(address where_address_to_nickname_lives) {
        address_to_nickname 
        use_address_to_nickname_to = address_to_nickname(where_address_to_nickname_lives);
    }

    mapping (acquaintance_pair => bool) effectivity_of_acquaintance_from_address_pair;
    // 1 of many to =1 of 2
    
    struct address_pair{
        address from_person;
        address to_person;
    }

    function accept_acquaintance(address_pair from_them_to_me) {
        require(from_them_to_me.to_person == msg.sender);
        effectivity_of_acquaintance_from_address_pair[from_them_to_me] = true;
        address_pair from_me_to_them = address_pair(from_them_to_me.to_person, from_them_to_me.from_person);
        effectivity_of_acquaintance_from_address_pair[from_me_to_them] = true;
    }

    function request_acquaintance(address requester) 
    public {
        emit(use_address_to_nickname_to.get_address_from_nickname());
    }
    
    event acquaintance_requested(
        string alguien_dice_conocerlo_a_ud_su_apodo_es
    );

    function confirm_whether_they_know_me_or_not(address_pair from_them_to_me) {
        require(from_them_to_me.to_person == msg.sender);
        return effectivity_of_acquaintance_from_address_pair[from_them_to_me];
    }

    function confirm_whether_I_know_them_or_not(address_pair from_me_to_them) {
        require(from_me_to_them.from_person == msg.sender);
        return effectivity_of_acquaintance_from_address_pair[from_me_to_them];
    }
}