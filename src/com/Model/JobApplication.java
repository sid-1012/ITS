package com.Model;

public class JobApplication {
	
	private int jobApplicationID;
	private String jobTitle;
	private String department;
	private String jobType;
	private int expectedSalary;
	private String readyToRelocate;
	private String source;
	private int applicantID;
	private String username;
	private String applicantName;
	
	
	public String getUserName() {
		return username;
	}
	public void setUserName(String username) {
		this.username = username;
	}
	public int getJobApplicationID() {
		return jobApplicationID;
	}
	public void setJobApplicationID(int jobApplicationID) {
		this.jobApplicationID = jobApplicationID;
	}
	public String getJobTitle() {
		return jobTitle;
	}
	public void setJobTitle(String jobTitle) {
		this.jobTitle = jobTitle;
	}
	public String getDepartment() {
		return department;
	}
	public void setDepartment(String department) {
		this.department = department;
	}
	public String getJobType() {
		return jobType;
	}
	public void setJobType(String jobType) {
		this.jobType = jobType;
	}
	public int getExpectedSalary() {
		return expectedSalary;
	}
	public void setExpectedSalary(int expectedSalary) {
		this.expectedSalary = expectedSalary;
	}
	public String getReadyToRelocate() {
		return readyToRelocate;
	}
	public void setReadyToRelocate(String readyToRelocate) {
		this.readyToRelocate = readyToRelocate;
	}
	public String getSource() {
		return source;
	}
	public void setSource(String source) {
		this.source = source;
	}
	public int getApplicantID() {
		return applicantID;
	}
	public void setApplicantID(int applicantID) {
		this.applicantID = applicantID;
	}
	public String getApplicantName() {
		return applicantName;
	}
	public void setApplicantName(String applicantName) {
		this.applicantName = applicantName;
	}
	
	
}
