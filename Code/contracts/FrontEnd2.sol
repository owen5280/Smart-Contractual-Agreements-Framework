// SPDX-License-Identifier: MIT

// Authors:
// @ Owen Joslin (otj8625@rit.edu)
// @ William Joslin (wpj3799@rit.edu)

pragma solidity ^0.8.0;

import "./SmartContractFactory.sol";
import "./SmartContractPacketFactory.sol";
import "./SmartContract.sol";

contract FrontEnd2 {
    // Variables
    address private contractPacket;

    // FrontEnd2 constructor
    constructor(address _packet) {
        contractPacket = _packet;
    }

    // Update the NDA template
    function UpdateNDATemplate(address ndacontract) public {
        SmartContract.Field[11] memory fixedArray = [
            SmartContract.Field({
                ID: 1,
                dataType: SmartContract.DataType.Date,
                name: "CONTRACT.DATE",
                data: "4/20/24 @ 4:20pm",
                editable: true
            }),
            SmartContract.Field({
                ID: 2,
                dataType: SmartContract.DataType.Name,
                name: "PARTY1.NAME",
                data: "Company A",
                editable: true
            }),
            SmartContract.Field({
                ID: 3,
                dataType: SmartContract.DataType.Location,
                name: "PARTY1.ADDRESS",
                data: "123 Main St, Anytown, USA",
                editable: true
            }),
            SmartContract.Field({
                ID: 4,
                dataType: SmartContract.DataType.Name,
                name: "PARTY2.NAME",
                data: "Company B",
                editable: true
            }),
            SmartContract.Field({
                ID: 5,
                dataType: SmartContract.DataType.Location,
                name: "PARTY2.ADDRESS",
                data: "456 Elm St, Othertown, USA",
                editable: true
            }),
            SmartContract.Field({
                ID: 6,
                dataType: SmartContract.DataType.Signature,
                name: "PARTY1.SIGNATURE",
                data: "",
                editable: true
            }),
            SmartContract.Field({
                ID: 7,
                dataType: SmartContract.DataType.Name,
                name: "PARTY1.NAME",
                data: "Company A",
                editable: true
            }),
            SmartContract.Field({
                ID: 8,
                dataType: SmartContract.DataType.Date,
                name: "PARTY1.SIGNDATE",
                data: "",
                editable: true
            }),
            SmartContract.Field({
                ID: 9,
                dataType: SmartContract.DataType.Signature,
                name: "PARTY2.SIGNATURE",
                data: "",
                editable: true
            }),
            SmartContract.Field({
                ID: 10,
                dataType: SmartContract.DataType.Name,
                name: "PARTY1.NAME",
                data: "Company B",
                editable: true
            }),
            SmartContract.Field({
                ID: 11,
                dataType: SmartContract.DataType.Date,
                name: "PARTY1.SIGNDATE",
                data: "",
                editable: true
            })
        ];
        SmartContract.Field[] memory dynamicArray = new SmartContract.Field[](
            fixedArray.length
        );
        for (uint i = 0; i < fixedArray.length; i++) {
            dynamicArray[i] = fixedArray[i];
        }

        SmartContractPacket(contractPacket).updateFields(
            ndacontract,
            dynamicArray
        );
    }

    function UpdateRentalAgreementTemplate(address racontract) public {
        SmartContract.Field[20] memory fixedArray = [
            SmartContract.Field({
                ID: 1,
                dataType: SmartContract.DataType.Date,
                name: "CONTRACT.DATE",
                data: "4/20/24 @ 4:20pm",
                editable: true
            }),
            SmartContract.Field({
                ID: 2,
                dataType: SmartContract.DataType.Name,
                name: "LANDLORD.NAME",
                data: "John Doe",
                editable: true
            }),
            SmartContract.Field({
                ID: 3,
                dataType: SmartContract.DataType.Location,
                name: "LANDLORD.ADDRESS",
                data: "123 Main St, Anytown, USA",
                editable: true
            }),
            SmartContract.Field({
                ID: 4,
                dataType: SmartContract.DataType.Name,
                name: "TENANT.NAME",
                data: "Alice Smith",
                editable: true
            }),
            SmartContract.Field({
                ID: 5,
                dataType: SmartContract.DataType.Location,
                name: "TENANT.ADDRESS",
                data: "456 Elm St, Othertown, USA",
                editable: true
            }),
            SmartContract.Field({
                ID: 6,
                dataType: SmartContract.DataType.Location,
                name: "PROPERTY.ADDRESS",
                data: "789 Oak St, Anycity, USA",
                editable: true
            }),
            SmartContract.Field({
                ID: 7,
                dataType: SmartContract.DataType.Date,
                name: "START.DATE",
                data: "4/21/24",
                editable: true
            }),
            SmartContract.Field({
                ID: 8,
                dataType: SmartContract.DataType.Date,
                name: "END.DATE",
                data: "4/21/25",
                editable: true
            }),
            SmartContract.Field({
                ID: 9,
                dataType: SmartContract.DataType.TextBox,
                name: "RENT_AMOUNT",
                data: "$1000",
                editable: true
            }),
            SmartContract.Field({
                ID: 10,
                dataType: SmartContract.DataType.Date,
                name: "DUE_DATE",
                data: "1st of each month",
                editable: true
            }),
            SmartContract.Field({
                ID: 11,
                dataType: SmartContract.DataType.TextBox,
                name: "SECURITY_DEPOSIT_AMOUNT",
                data: "$1500",
                editable: true
            }),
            SmartContract.Field({
                ID: 12,
                dataType: SmartContract.DataType.TextBox,
                name: "UTILITY_DETAILS",
                data: "Tenant responsible for all utilities",
                editable: true
            }),
            SmartContract.Field({
                ID: 13,
                dataType: SmartContract.DataType.TextBox,
                name: "NOTICE_PERIOD",
                data: "30 days",
                editable: true
            }),
            SmartContract.Field({
                ID: 14,
                dataType: SmartContract.DataType.Location,
                name: "STATE/COUNTRY",
                data: "USA",
                editable: true
            }),
            SmartContract.Field({
                ID: 15,
                dataType: SmartContract.DataType.Signature,
                name: "LANDLORD.SIGNATURE",
                data: "",
                editable: true
            }),
            SmartContract.Field({
                ID: 16,
                dataType: SmartContract.DataType.Name,
                name: "LANDLORD.NAME",
                data: "John Doe",
                editable: true
            }),
            SmartContract.Field({
                ID: 17,
                dataType: SmartContract.DataType.Date,
                name: "LANDLORD.SIGNDATE",
                data: "",
                editable: true
            }),
            SmartContract.Field({
                ID: 18,
                dataType: SmartContract.DataType.Signature,
                name: "TENANT.SIGNATURE",
                data: "",
                editable: true
            }),
            SmartContract.Field({
                ID: 19,
                dataType: SmartContract.DataType.Name,
                name: "TENANT.NAME",
                data: "Alice Smith",
                editable: true
            }),
            SmartContract.Field({
                ID: 20,
                dataType: SmartContract.DataType.Date,
                name: "TENANT.SIGNDATE",
                data: "",
                editable: true
            })
        ];
        SmartContract.Field[] memory dynamicArray = new SmartContract.Field[](
            fixedArray.length
        );
        for (uint i = 0; i < fixedArray.length; i++) {
            dynamicArray[i] = fixedArray[i];
        }

        SmartContractPacket(contractPacket).updateFields(
            racontract,
            dynamicArray
        );
    }
}
