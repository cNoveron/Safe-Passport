pragma solidity ^0.4.0;

import "./address_to_nickname.sol";

contract acquaintance {
    constructor(address where_address_to_nickname_lives) {
        address_to_nickname 
        use_address_to_nickname_to = address_to_nickname(where_address_to_nickname_lives);
    }

    mapping (address => address) they_know_me;
    // 1 of many to =1 of 2

    mapping (address => address) I_know_them;
    // 1 of many to =1 of 2

    struct address_pair{
        address from_person;
        address to_person;
    }

    function accept_acquaintance(address their_address) public {
        they_know_me[their_address] = msg.sender
        I_know_them[their_address] = msg.sender;
    }

    function request_acquaintance(address requester) 
    public {
        emit(use_address_to_nickname_to.get_address_from_nickname());
    }
    
    event acquaintance_requested(
        string alguien_dice_conocerlo_a_ud_su_apodo_es
    );

    function confirm_whether_they_know_me_or_not(address_pair from_them_to_me) {
        return they_know_me[their_address] == msg.sender;
    }

    function confirm_whether_I_know_them_or_not(address_pair from_me_to_them) {
        return I_know_them[their_address] == msg.sender;
    }
}