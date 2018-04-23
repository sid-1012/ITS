package com.Dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.Model.JobApplication;
import com.Util.DbUtil;

public class JobApplicationDao {

public static String getApplicantName(int applicantID) {
		
		Connection connection = DbUtil.getCon();
		PreparedStatement ps = null;
		ResultSet rs = null;
		String applicantName = "";
		try {
			ps = connection.prepareStatement("SELECT firstName, lastName FROM signup where applicantID = '" + applicantID + "'");
			rs = ps.executeQuery();
			while(rs.next()) {
				applicantName = rs.getString("firstName") + " " + rs.getString("lastName");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return applicantName;
	}
	
	public static String getUserName(int applicantID) {
		String username=" ";
		Connection connection = DbUtil.getCon();
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		try {
			ps = connection.prepareStatement("SELECT * from signup where applicantID = '" + applicantID + "'");
			rs = ps.executeQuery();
			while(rs.next()) {
				System.out.println("hello " + rs.getString("username"));
				username = rs.getString("username");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return username;
	}
	
	public static int applyForJob(JobApplication application) {
		// TODO Auto-generated method stub
		Connection connection = DbUtil.getCon();
		PreparedStatement ps = null, pstmt = null;
		ResultSet rs = null;
		
		int i =0;
		
		try {
			 pstmt = connection.prepareStatement("select * from jobapplication where applicantID = ?");
			 pstmt.setInt(1, application.getApplicantID());
			 rs = pstmt.executeQuery();
			 if(rs.next())
			 {
				 ps = connection.prepareStatement("update jobapplication set jobTitle = ?, department = ?, jobType = ?, "
				 							+ "expectedSalary = ?, readyToRelocate = ?, source = ?, username = ?, applicantName = ? where applicantID = ?");
			 }
			 else
			 {
				 ps = connection.prepareStatement("insert into jobapplication (jobTitle, department, jobType, expectedSalary, "
							+ "readyToRelocate, source, username, applicantName, applicantID) values (?,?,?,?,?,?,?,?,?)");
			 }
			 ps.setString(1, application.getJobTitle());
			 ps.setString(2, application.getDepartment());
			 ps.setString(3, application.getJobType());
			 ps.setLong(4, application.getExpectedSalary());
			 ps.setString(5, application.getReadyToRelocate());
			 ps.setString(6, application.getSource());
			 ps.setString(7, application.getUserName());
			 ps.setString(8, application.getApplicantName());
			 ps.setInt(9, application.getApplicantID());
			 i = ps.executeUpdate();
			 pstmt.close();
			 ps.close();
			 rs.close();
			 connection.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return i;
	}
	
}
