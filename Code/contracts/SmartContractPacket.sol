// SPDX-License-Identifier: MIT

// Authors:
// @ Owen Joslin (otj8625@rit.edu)
// @ William Joslin (wpj3799@rit.edu)

pragma solidity ^0.8.0;

import "./SmartContract.sol";
import "./SmartContractFactory.sol";

contract SmartContractPacket {
    // Party struct
    struct Party {
        address partyAddress; // Party Address
        string signature; // Party Signature
        bool signed; // Has this Party Signed?
    }

    // Variable Stack
    string public packetName; // Name of the Packet
    Party[] private parties; // List of Involved Parties
    SmartContract[] private contractArray; // List on Contracts in Packet
    address private owner; // Account of Contract Owner
    address private contractFactoryAddress; // Address of the Smart Contract Factory
    address private packetFactoryAddress; // Address of the Smart Contract Packet Factory

    // Events
    event Packet(string kind, string name, address Contract); // packet created

    // Constructor
    constructor(
        string memory _name,
        address[] memory _parties,
        address _owner
    ) {
        packetName = _name;
        owner = _owner;
        for (uint256 i = 0; i < _parties.length; i++) {
            parties.push(
                Party({partyAddress: _parties[i], signature: "", signed: false})
            );
        }
        emit Packet("Packet Created", packetName, address(this)); // Emit Packet Creation
    }

    // Adds contract objects to the packet
    function addContract(address _contract) public {
        contractArray.push(SmartContract(_contract));
        emit Packet("Packet Contracts Updated", packetName, address(this));
    }

    // Update Fields
    function updateFields(
        address _contract,
        SmartContract.Field[] memory _fields
    ) public {
        SmartContract openContract = SmartContract(_contract);
        openContract.updateFields(_fields);
    }

    // Sign Contract
    function sign(string memory _signature) public {
        while (true) {
            for (uint i = 0; i < parties.length; i++) {
                if (parties[i].partyAddress == msg.sender) {
                    parties[i].signature = _signature;
                    parties[i].signed = true;
                }
                if (parties[i].signed == false) {
                    // Checks if all Parties have Signed Yet
                    break;
                }
            }
            emit Packet("Packet Signed", packetName, msg.sender);
        }
    }

    // Return Packet Owner
    function getOwner() public view returns (address) {
        return owner;
    }

    // Return the parties
    function getParties() public view returns (Party[] memory) {
        return parties;
    }

    // Return contract packets
    function getContracts() public view returns (SmartContract[] memory) {
        return contractArray;
    }
}
