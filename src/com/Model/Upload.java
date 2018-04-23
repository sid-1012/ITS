package com.Model;

public class Upload {

	private int uploadID;
	private String photoPath;
	private String resumePath;
	private int applicantID;
	public int getUploadID() {
		return uploadID;
	}
	public void setUploadID(int uploadID) {
		this.uploadID = uploadID;
	}
	public String getPhotoPath() {
		return photoPath;
	}
	public void setPhotoPath(String photoPath) {
		this.photoPath = photoPath;
	}
	public String getResumePath() {
		return resumePath;
	}
	public void setResumePath(String resumePath) {
		this.resumePath = resumePath;
	}
	public int getApplicantID() {
		return applicantID;
	}
	public void setApplicantID(int applicantID) {
		this.applicantID = applicantID;
	}
}
