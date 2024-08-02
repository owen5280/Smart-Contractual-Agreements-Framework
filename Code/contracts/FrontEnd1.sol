// SPDX-License-Identifier: MIT

// Authors:
// @ Owen Joslin (otj8625@rit.edu)
// @ William Joslin (wpj3799@rit.edu)

pragma solidity ^0.8.0;

import "./SmartContractFactory.sol";
import "./SmartContractPacketFactory.sol";
import "./SmartContract.sol";

contract FrontEnd1 {
    // Variables
    address private smartContractFactory;
    address private smartContractPacketFactory;

    // FrontEnd1 constructor
    constructor(
        address _smartContractPacketFactory,
        address _smartContractFactory
    ) {
        smartContractPacketFactory = address(_smartContractPacketFactory);
        smartContractFactory = address(_smartContractFactory);
    }

    // Deploy a SmartContractPacket
    function DeployPacket() public {
        address[] memory parties = new address[](2);
        parties[0] = 0x4B20993Bc481177ec7E8f571ceCaE8A9e22C02db;
        parties[1] = 0x78731D3Ca6b7E34aC0F824c42a7cC18A495cabaB;
        SmartContractPacketFactory(smartContractPacketFactory)
            .createContractPacket(
                "Joslin, Owen & Joslin, William - Packet",
                0xAb8483F64d9C6d1EcF9b849Ae677dD3315835cb2,
                parties
            );
    }

    // Create a NDA Template
    function NDATemplate() public returns (address) {
        address NDAAddress = SmartContractFactory(smartContractFactory)
            .createTemplate(
                "Scottsville Mini Storage NON-DISCLOSURE AGREEMENT (NDA)",
                0xAb8483F64d9C6d1EcF9b849Ae677dD3315835cb2
            );
        SmartContract.Field[11] memory fixedArray = [
            SmartContract.Field({
                ID: 1,
                dataType: SmartContract.DataType.Date,
                name: "CONTRACT.DATE",
                data: "",
                editable: true
            }),
            SmartContract.Field({
                ID: 2,
                dataType: SmartContract.DataType.Name,
                name: "PARTY1.NAME",
                data: "",
                editable: true
            }),
            SmartContract.Field({
                ID: 3,
                dataType: SmartContract.DataType.Location,
                name: "PARTY1.ADDRESS",
                data: "",
                editable: true
            }),
            SmartContract.Field({
                ID: 4,
                dataType: SmartContract.DataType.Name,
                name: "PARTY2.NAME",
                data: "",
                editable: true
            }),
            SmartContract.Field({
                ID: 5,
                dataType: SmartContract.DataType.Location,
                name: "PARTY2.ADDRESS",
                data: "",
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
                data: "",
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
                data: "",
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
        SmartContractFactory(smartContractFactory).updateContract(
            NDAAddress,
            "Scottsville Mini Storage NON-DISCLOSURE AGREEMENT (NDA) This Nondisclosure Agreement or ('Agreement') has been entered into on the date of [CONTRACT.DATE] and is by and between: Party Disclosing Information: [PARTY1.NAME] with a mailing address of [PARTY1.ADDRESS] ('Disclosing Party'). Party Receiving Information: [PARTY2.NAME] with a mailing address of [PARTY2.ADDRESS] ('Receiving Party'). For the purpose of preventing the unauthorized disclosure of Confidential Information as defined below. The parties agree to enter into a confidential relationship concerning the disclosure of certain proprietary and confidential information ('Confidential Information'). 1. Definition of Confidential Information: For purposes of this Agreement, 'Confidential Information' shall include all information or material that has or could have commercial value or other utility in the business in which Disclosing Party is engaged. If Confidential Information is in written form, the Disclosing Party shall label or stamp the materials with the word 'Confidential' or some similar warning. If Confidential Information is transmitted orally, the Disclosing Party shall promptly provide writing indicating that such oral communication constituted Confidential Information. 2. Exclusions from Confidential Information: Receiving Party's obligations under this Agreement do not extend to information that is: (a) publicly known at the time of disclosure or subsequently becomes publicly known through no fault of the Receiving Party; (b) discovered or created by the Receiving Party before disclosure by Disclosing Party; (c) learned by the Receiving Party through legitimate means other than from the Disclosing Party or Disclosing Party's representatives; or (d) is disclosed by Receiving Party with Disclosing Party's prior written approval. 3. Obligations of Receiving Party: Receiving Party shall hold and maintain the Confidential Information in strictest confidence for the sole and exclusive benefit of the Disclosing Party. Receiving Party shall carefully restrict access to Confidential Information to employees, contractors and third parties as is reasonably required and shall require those persons to sign nondisclosure restrictions at least as protective as those in this Agreement. Receiving Party shall not, without the prior written approval of Disclosing Party, use for Receiving Party's benefit, publish, copy, or otherwise disclose to others, or permit the use by others for their benefit or to the detriment of Disclosing Party, any Confidential Information. Receiving Party shall return to Disclosing Party any and all records, notes, and other written, printed, or tangible materials in its possession pertaining to Confidential Information immediately if Disclosing Party requests it in writing. 4. Time Periods: The nondisclosure provisions of this Agreement shall survive the termination of this Agreement and Receiving Party's duty to hold Confidential Information in confidence shall remain in effect until the Confidential Information no longer qualifies as a trade secret or until Disclosing Party sends Receiving Party written notice releasing Receiving Party from this Agreement, whichever occurs first. 5. Relationships: Nothing contained in this Agreement shall be deemed to constitute either party a partner, joint venture or employee of the other party for any purpose. 6. Severability: If a court finds any provision of this Agreement invalid or unenforceable, the remainder of this Agreement shall be interpreted so as best to affect the intent of the parties. 7. Integration: This Agreement expresses the complete understanding of the parties with respect to the subject matter and supersedes all prior proposals, agreements, representations, and understandings. This Agreement may not be amended except in writing signed by both parties. 8. Waiver: The failure to exercise any right provided in this Agreement shall not be a waiver of prior or subsequent rights. 9. Notice of Immunity: Employee is provided notice that an individual shall not be held criminally or civilly liable under any federal or state trade secret law for the disclosure of a trade secret that is made (i) in confidence to a federal, state, or local government official, either directly or indirectly, or to an attorney; and (ii) solely for the purpose of reporting or investigating a suspected violation of law; or is made in a complaint or other document filed in a lawsuit or other proceeding, if such filing is made under seal. An individual who files a lawsuit for retaliation by an employer for reporting a suspected violation of law may disclose the trade secret to the attorney of the individual and use the trade secret information in the court proceeding, if the individual (i) files any document containing the trade secret under seal; and (ii) does not disclose the trade secret, except pursuant to court order. This Agreement and each party's obligations shall be binding on the representatives, assigns and successors of such party. Each party has signed this Agreement through its authorized representative. DISCLOSING PARTY Signature: [PARTY1.SIGNATURE] Typed or Printed Name: [PARTY1.NAME] Date: [PARTY1.SIGNDATE] RECEIVING PARTY Signature: [PARTY2.SIGNATURE] Typed or Printed Name: [PARTY2.NAME] Date: [PARTY2.SIGNDATE]",
            dynamicArray
        );
        return NDAAddress;
    }

    // Create a Rental Agreement Template
    function RentalAgreementTemplate() public returns (address) {
        address RentalAgreementAddress = SmartContractFactory(
            smartContractFactory
        ).createTemplate(
                "Scottsville Mini Storage RENTAL AGREEMENT",
                0xAb8483F64d9C6d1EcF9b849Ae677dD3315835cb2
            );
        SmartContract.Field[20] memory fixedArray = [
            SmartContract.Field({
                ID: 1,
                dataType: SmartContract.DataType.Date,
                name: "CONTRACT.DATE",
                data: "",
                editable: true
            }),
            SmartContract.Field({
                ID: 2,
                dataType: SmartContract.DataType.Name,
                name: "LANDLORD.NAME",
                data: "",
                editable: true
            }),
            SmartContract.Field({
                ID: 3,
                dataType: SmartContract.DataType.Location,
                name: "LANDLORD.ADDRESS",
                data: "",
                editable: true
            }),
            SmartContract.Field({
                ID: 4,
                dataType: SmartContract.DataType.Name,
                name: "TENANT.NAME",
                data: "",
                editable: true
            }),
            SmartContract.Field({
                ID: 5,
                dataType: SmartContract.DataType.Location,
                name: "TENANT.ADDRESS",
                data: "",
                editable: true
            }),
            SmartContract.Field({
                ID: 6,
                dataType: SmartContract.DataType.Location,
                name: "PROPERTY.ADDRESS",
                data: "",
                editable: true
            }),
            SmartContract.Field({
                ID: 7,
                dataType: SmartContract.DataType.Date,
                name: "START.DATE",
                data: "",
                editable: true
            }),
            SmartContract.Field({
                ID: 8,
                dataType: SmartContract.DataType.Date,
                name: "END.DATE",
                data: "",
                editable: true
            }),
            SmartContract.Field({
                ID: 9,
                dataType: SmartContract.DataType.TextBox,
                name: "RENT_AMOUNT",
                data: "",
                editable: true
            }),
            SmartContract.Field({
                ID: 10,
                dataType: SmartContract.DataType.Date,
                name: "DUE_DATE",
                data: "",
                editable: true
            }),
            SmartContract.Field({
                ID: 11,
                dataType: SmartContract.DataType.TextBox,
                name: "SECURITY_DEPOSIT_AMOUNT",
                data: "",
                editable: true
            }),
            SmartContract.Field({
                ID: 12,
                dataType: SmartContract.DataType.TextBox,
                name: "UTILITY_DETAILS",
                data: "",
                editable: true
            }),
            SmartContract.Field({
                ID: 13,
                dataType: SmartContract.DataType.TextBox,
                name: "NOTICE_PERIOD",
                data: "",
                editable: true
            }),
            SmartContract.Field({
                ID: 14,
                dataType: SmartContract.DataType.Location,
                name: "STATE/COUNTRY",
                data: "",
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
                data: "",
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
                data: "",
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
        SmartContractFactory(smartContractFactory).updateContract(
            RentalAgreementAddress,
            "Scottsville Mini Storage RENTAL AGREEMENT This Rental Agreement ('Agreement') is made and entered into on [CONTRACT.DATE] between: Landlord: [LANDLORD.NAME], residing at [LANDLORD.ADDRESS] ('Landlord') Tenant: [TENANT.NAME], residing at [TENANT.ADDRESS] ('Tenant') 1. Property Description: The Landlord agrees to rent to the Tenant the property located at [PROPERTY.ADDRESS] ('Property'). 2. Term: The term of this Agreement shall commence on [START.DATE] and continue until [END.DATE]. 3. Rent: Tenant agrees to pay rent in the amount of [RENT_AMOUNT] per month. Rent shall be due on the [DUE_DATE] of each month. 4. Security Deposit: Tenant agrees to pay a security deposit in the amount of [SECURITY_DEPOSIT_AMOUNT] upon signing this Agreement. This deposit will be held by the Landlord as security for any damages to the Property. 5. Use of Property: Tenant agrees to use the Property solely for residential purposes and shall not sublet or assign the Property without the Landlord's written consent. 6. Maintenance and Repairs: Tenant shall maintain the Property in good condition and promptly notify the Landlord of any repairs needed. 7. Utilities: [UTILITY_DETAILS] 8. Termination: Either party may terminate this Agreement by providing [NOTICE_PERIOD] days' written notice to the other party. 9. Governing Law: This Agreement shall be governed by the laws of [STATE/COUNTRY]. IN WITNESS WHEREOF, the parties have executed this Agreement as of the date first above written. LANDLORD Signature: [LANDLORD.SIGNATURE] Printed Name: [LANDLORD.NAME] Date: [LANDLORD.SIGNDATE] TENANT Signature: [TENANT.SIGNATURE] Printed Name: [TENANT.NAME] Date: [TENANT.SIGNDATE]",
            dynamicArray
        );
        return RentalAgreementAddress;
    }

    // Create the Blockchain TOS Template
    function createTOS() public returns (address) {
        address _blockchainTOS = SmartContractFactory(smartContractFactory)
            .createTemplate(
                "BLOCKCHAIN LEGAL AGREEMENT TERMS OF SERVICE (TOS)",
                0x5B38Da6a701c568545dCfcB03FcB875f56beddC4
            );
        SmartContract.Field[7] memory fixedArray = [
            SmartContract.Field({
                ID: 1,
                dataType: SmartContract.DataType.Date,
                name: "CONTRACT.DATE",
                data: "",
                editable: false
            }),
            SmartContract.Field({
                ID: 2,
                dataType: SmartContract.DataType.Signature,
                name: "PARTY1.SIGNATURE",
                data: "",
                editable: false
            }),
            SmartContract.Field({
                ID: 3,
                dataType: SmartContract.DataType.Name,
                name: "PARTY1.NAME",
                data: "",
                editable: false
            }),
            SmartContract.Field({
                ID: 4,
                dataType: SmartContract.DataType.Signature,
                name: "PARTY1.SIGNDATE",
                data: "",
                editable: false
            }),
            SmartContract.Field({
                ID: 5,
                dataType: SmartContract.DataType.Signature,
                name: "PARTY2.SIGNATURE",
                data: "",
                editable: false
            }),
            SmartContract.Field({
                ID: 6,
                dataType: SmartContract.DataType.Name,
                name: "PARTY2.NAME",
                data: "",
                editable: false
            }),
            SmartContract.Field({
                ID: 7,
                dataType: SmartContract.DataType.Signature,
                name: "PARTY2.SIGNDATE",
                data: "",
                editable: false
            })
        ];
        SmartContract.Field[] memory dynamicArray = new SmartContract.Field[](
            fixedArray.length
        );
        for (uint i = 0; i < fixedArray.length; i++) {
            dynamicArray[i] = fixedArray[i];
        }
        SmartContractFactory(smartContractFactory).updateContract(
            _blockchainTOS,
            "This Terms of Service or ('Agreement') has been entered into on the date of [CONTRACT.DATE] This Terms of Service document; agreement ('Agreement') is comprised in part through this document ('Document'), following contractual agreement document ('Document'), and through a smart contract ('Smart Contract') which will be deployed on the Ethereum network ('Blockchain') to an address known to the Agreement's parties. Both the Documents and the Smart Contract are integral to the Agreement. 1. Parties: The parties ('Parties') involved with this agreement: PARTY1, PARTY2, PARTY3, .... The Parties will be identified by their respective public addresses on the Ethereum network. Each involved Parties' address will be stored in their respective Field of the Smart Contract. 2. Proof of Identity: All involved parties certify that the information provided to this contract are true and correct and that the hash ('Hash') created from said information qualifies as said party's reproducible, verifiable identity ('Identity') usable for all signing and verification processes. Each involved Parties' hash will be stored in their respective Field of the Smart Contract. 3. Agreement: Parties involved with this and the following contractual agreement agree that their respective Identities and signatures are true and correct and are binding in the court of law. 4. Transparency: Parties involved acknowledge and understand that the documents being agreed to are forever stored on a public ledger and that even though only the parties involved may access the readable contents, this agreement will forever exist in some state as determined by the 'status' Field. 5. Additional Terms: 5A. In the event there is a conflict between this Document and the Smart Contract, the terms of the Smart Contract will control. 5B. Each of the Parties is responsible for their own costs (e.g., 'gas' on the Ethereum network) for executing transactions against the Smart Contract. 5C. If any provision of this Agreement is held to be unenforceable, the Parties wish that the remaining provisions of the Agreement continue to be enforced. 5D. The terms of this Agreement shall be interpreted by the local laws of the deploying Parties' jurisdiction. Any disputes shall be resolved in a tribunal local to the deploying Parties'. Venue shall be at a location determined by deploying Parties' within the jurisdiction. 6. Performance: The Agreement will be performed when the following functions have been called and/or Fields populated by the Parties in the Smart Contract. To the extent permitted by law, the sequence of events of the Smart Contract is not important to the Agreement. - [PARTY] structures have been populated; - 'Status' has been set to 'Active'; - BLOCKCHAIN LEGAL AGREEMENT TERMS OF SERVICE (TOS) has been signed. - [CONTRACT] has been signed; - a copy of [this] Document has been stored in the 'contract' array[0]; - a copy of the [CONTRACT] Document/s has been stored in the 'contract' array; - contractArray has been hashed and encrypted; - a copy of the contractPacket has been stored on an immutable file system; - parties have recieved their respective 'keys' and the 'location' of the contractPacket within the immutable file system; PARTY1 Signature: [PARTY1.SIGNATURE] Typed or Printed Name: [PARTY1.NAME] Date: [PARTY1.SIGNDATE] PARTY2 Signature: [PARTY2.SIGNATURE] Typed or Printed Name: [PARTY2.NAME] Date: [PARTY2.SIGNDATE] ...",
            dynamicArray
        );
        return address(_blockchainTOS);
    }
}
