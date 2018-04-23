package com.Model;

public class ForgetPassword {

	private int forgetPasswordID;
	private int applicantID;
	private String email;
	private String activationKey;
	public int getForgetPasswordID() {
		return forgetPasswordID;
	}
	public void setForgetPasswordID(int forgetPasswordID) {
		this.forgetPasswordID = forgetPasswordID;
	}
	public int getApplicantID() {
		return applicantID;
	}
	public void setApplicantID(int applicantID) {
		this.applicantID = applicantID;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getActivationKey() {
		return activationKey;
	}
	public void setActivationKey(String activationKey) {
		this.activationKey = activationKey;
	}
	
	
	
}
