// SPDX-License-Identifier: MIT

// Authors:
// @ Owen Joslin (otj8625@rit.edu)
// @ William Joslin (wpj3799@rit.edu)

pragma solidity ^0.8.0;

contract SmartContract {
    // DataType enum
    enum DataType {
        // Types of Field Data
        Signature,
        Initials,
        Date,
        Time,
        Name,
        Email,
        Location,
        Title,
        CheckBox,
        TextBox
    }

    // Status enum
    enum Status {
        Pending,
        Active,
        Completed,
        Inactive,
        Expired
    }

    // Field struct
    struct Field {
        uint256 ID; // Field Location within Terms
        DataType dataType; // Field Data Type
        string name;
        string data; // Field Data
        bool editable; // Can Field be Edited by Recipiants
    }

    // Variables
    string private contractName; // Name of Contract
    string private terms; // Terms of the Contract
    Field[] private fields; // Array of Fields Within the Contract
    Status public currentState; // Current State of the Contract
    uint256 public deploymentTime; // Time of Deployment
    uint256 public signTime; // Time of Signature
    uint256 private version; // Contract Version Number
    address private owner; // Account of Contract Owner
    address private packet; // Address of the Encapsualting Packet
    address private contractFactoryAddress; // Address of the Smart Contract Factory
    address private packetFactoryAddress; // Address of the Smart Contract Packet Factory

    // Events
    event Contract(string kind, string name, address Contract);

    // Constructor
    constructor(
        string memory _name,
        address _owner,
        address _contractFactoryAddress,
        address _packetFactoryAddress,
        address _packet
    ) {
        version = 0;
        packet = _packet;
        contractName = _name;
        owner = _owner;
        contractFactoryAddress = _contractFactoryAddress;
        packetFactoryAddress = _packetFactoryAddress;
        emit Contract("Contract Created", contractName, address(this)); // Emits Contract Creation
    }

    // Update Terms
    function updateTerms(string memory _terms) public {
        terms = _terms; // Sets Terms
        version += 1; // Sets Version to +1
        emit Contract("Contract Terms Updated", contractName, address(this)); // Emits Contract Terms Updated
    }

    // Update Fields
    function updateFields(Field[] memory _fields) public {
        delete fields; // Clears All Existing Fields
        for (uint i = 0; i < _fields.length; i++) {
            // Adds fields to the 'fields' array
            fields.push(_fields[i]);
        }
    }

    // Return the contract executor
    function getOwner() public view returns (address) {
        return owner;
    }
    // Return the contract terms
    function getTerms() public view returns (string memory) {
        return terms;
    }

    // Return the contract terms
    function getFields() public view returns (Field[] memory) {
        return fields;
    }

    // Return Contract Name
    function getName() public view returns (string memory) {
        return contractName;
    }

    // Return Contract Version
    function getVersion() public view returns (uint256) {
        return version;
    }

    // Set Contract Deploy Time
    function setDeploy(uint256 _time) public {
        deploymentTime = _time;
    }

    // Set Contract Sign Time
    function setSign(uint256 _time) public {
        signTime = _time;
    }

    // Set Contract Status
    function setStatus(Status _status) public {
        currentState = _status;
    }

    // Set Contract Status
    function getStatus() public view returns (Status) {
        return currentState;
    }
}
