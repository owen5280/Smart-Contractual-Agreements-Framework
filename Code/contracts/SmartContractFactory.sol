// SPDX-License-Identifier: MIT

// Authors:
// @ Owen Joslin (otj8625@rit.edu)
// @ William Joslin (wpj3799@rit.edu)

pragma solidity ^0.8.0;

import "./SmartContract.sol";

contract SmartContractFactory {
    // Variables
    address private frontEnd; // Address of Front End Account
    address private packetFactoryAddress; // Address of the Smart Contract Packet Factory

    // Constructor
    constructor(address _frontEnd) {
        frontEnd = _frontEnd;
    }

    // Create new Template
    function createTemplate(
        string memory _name,
        address _owner
    ) public returns (address) {
        SmartContract newTemplate = new SmartContract(
            _name,
            _owner,
            address(this),
            packetFactoryAddress,
            address(0)
        ); // Create New Contract Instance
        return address(newTemplate);
    }

    // Create New Contract
    function createContract(
        string memory _name,
        address _owner,
        address _packet
    ) public returns (address) {
        SmartContract newContract = new SmartContract(
            _name,
            _owner,
            address(this),
            packetFactoryAddress,
            _packet
        ); // Create New Contract Instance
        return address(newContract);
    }

    // Update contract
    function updateContract(
        address _contract,
        string memory _terms,
        SmartContract.Field[] memory _fields
    ) public {
        SmartContract selectedContract = SmartContract(_contract); // Open the Contract Instance
        selectedContract.updateTerms(_terms); // Updated a Contract's Terms
        selectedContract.updateFields(_fields); //Updates a Contract's Fields
    }

    // Get a Contract Owner
    function getOwner(address _contract) public view returns (address) {
        return SmartContract(_contract).getOwner();
    }

    // Update Smart Contract Packet Factory Address
    function updatePacketFactoryAddress(address _newAddress) public {
        packetFactoryAddress = _newAddress;
    }
}
