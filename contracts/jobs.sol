// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract JobBoard {
    uint256 public jobCounter;

    struct Job {
        uint256 id;
        address employer;
        string title;
        string description;
        string location;
        uint256 salary; // In wei
        bool isOpen;
    }

    struct Application {
        address applicant;
        string resumeIPFS;
        string coverLetter;
    }

    mapping(uint256 => Job) public jobs;
    mapping(uint256 => Application[]) public applications;

    event JobPosted(uint256 indexed jobId, address indexed employer);
    event AppliedToJob(uint256 indexed jobId, address indexed applicant);
    event JobClosed(uint256 indexed jobId, address indexed employer);

    modifier onlyEmployer(uint256 jobId) {
        require(msg.sender == jobs[jobId].employer, "Not job owner");
        _;
    }

    function postJob(
        string memory _title,
        string memory _description,
        string memory _location,
        uint256 _salary
    ) external {
        jobCounter++;
        jobs[jobCounter] = Job(
            jobCounter,
            msg.sender,
            _title,
            _description,
            _location,
            _salary,
            true
        );
        emit JobPosted(jobCounter, msg.sender);
    }

    function applyToJob(uint256 _jobId, string memory _resumeIPFS, string memory _coverLetter) external {
        require(jobs[_jobId].isOpen, "Job closed");
        applications[_jobId].push(Application(msg.sender, _resumeIPFS, _coverLetter));
        emit AppliedToJob(_jobId, msg.sender);
    }

    function closeJob(uint256 _jobId) external onlyEmployer(_jobId) {
        jobs[_jobId].isOpen = false;
        emit JobClosed(_jobId, msg.sender);
    }

    function getApplications(uint256 _jobId) external view onlyEmployer(_jobId) returns (Application[] memory) {
        return applications[_jobId];
    }

    function getAllJobs() external view returns (Job[] memory) {
        Job[] memory jobList = new Job[](jobCounter);
        for (uint256 i = 1; i <= jobCounter; i++) {
            jobList[i - 1] = jobs[i];
        }
        return jobList;
    }
}
