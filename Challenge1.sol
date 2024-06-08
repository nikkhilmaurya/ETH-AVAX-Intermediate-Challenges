// SPDX-License-Identifier: MIT
pragma solidity >=0.6.12 <0.9.0;
contract AdminRestrict{
    address public owner;
    constructor(){
        owner = msg.sender;
    } 

    modifier onlyOwner() {
        require(msg.sender == owner, "Only admin can call this function");
        _;
    }
    
    modifier exceptAdmin(){
        require(msg.sender != owner, "Except admin everyone can call" );
        _;
    }

    function notAdmin() public exceptAdmin view returns (string memory){
        return "Except Admin anyone can call.";
    }

    function adminFunction() public onlyOwner view returns (string memory) {
        return "This function is restricted to the admin.";
    }
}
