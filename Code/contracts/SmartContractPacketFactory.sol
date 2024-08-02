// SPDX-License-Identifier: MIT

// Authors:
// @ Owen Joslin (otj8625@rit.edu)
// @ William Joslin (wpj3799@rit.edu)

pragma solidity ^0.8.0;

import "./SmartContractPacket.sol";
import "./SmartContractFactory.sol";

contract SmartContractPacketFactory {
    // Variables
    address private frontEnd; // Address of Front End Account
    address private contractFactoryAddress; // Address of the Smart Contract Factory
    address private blockchainTOS;
    SmartContract[] contracts;

    // Constructor
    constructor(address _frontEnd) {
        frontEnd = _frontEnd;
    }

    // Create New Contract Packet
    function createContractPacket(
        string memory _name,
        address _owner,
        address[] memory _parties
    ) public returns (address) {
        SmartContractPacket newContractPacket = new SmartContractPacket(
            _name,
            _parties,
            _owner
        );
        newContractPacket.addContract(blockchainTOS);
        return address(newContractPacket);
    }

    // Add Contracts to a Packet
    function addContract(
        address _packet,
        address _owner,
        address _contract
    ) public {
        SmartContract contractCopy = SmartContract(_contract);
        address newContractWNewOwner = SmartContractFactory(
            contractFactoryAddress
        ).createContract(contractCopy.getName(), _owner, _packet);
        SmartContract newContract = SmartContract(newContractWNewOwner);
        SmartContractFactory(contractFactoryAddress).updateContract(
            newContractWNewOwner,
            contractCopy.getTerms(),
            contractCopy.getFields()
        );
        contracts.push(newContract);
    }

    // Update Location of the TOS
    function updateTOS(address _newAddress) public {
        blockchainTOS = _newAddress;
    }
}
