// SPDX-License-Identifier: MIT
pragma solidity ^0.8.3;

contract Payroll {
    address public owner;
    uint256 public age;
    uint256 public hoursWorked;
    uint256 public hourlyRate;
    uint256 public totSal;

    modifier onlyOwner() {
        require(msg.sender == owner, "Not the owner");
        _;
    }

    modifier rateGreaterThanZero(uint256 _rate) {
        require(_rate > 0, "Rate must be greater than zero");
        _;
    }

    modifier hoursGreaterThanZero(uint256 _hours) {
        require(_hours > 0, "Hours worked must be greater than zero");
        _;
    }

    constructor() {
        owner = msg.sender;
    }

    function setAge(uint256 _age) public onlyOwner {
        age = _age;
    }

    function setHrsWrk(uint256 _hours) public hoursGreaterThanZero(_hours) {
        hoursWorked = _hours;
    }

    function setRate(uint256 _rate) external onlyOwner rateGreaterThanZero(_rate) {
        hourlyRate = _rate;
    }

    function calculateTotSal() external onlyOwner{
        require(hourlyRate > 0 && hoursWorked > 0, "Hourly Rate and Hours Worked should be greater than 0.");
        totSal = hoursWorked * hourlyRate;
    }

 
}

