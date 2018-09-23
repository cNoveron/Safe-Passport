pragma solidity ^0.4.0;

contract address_to_Pattern {

    mapping (address => Pattern) Pattern_from_address;
    // 1 of many to n>=1 of many

    mapping (Pattern => address) address_from_Pattern;
    // 1 of many to =1 of many
}