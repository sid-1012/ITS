package com.Dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.Model.Experience;
import com.Util.DbUtil;


public class ExperienceDao {
	
	public static int addExperience(Experience experience) {
		Connection connection = DbUtil.getCon();
		PreparedStatement ps = null, pstmt = null;
		ResultSet rs = null;
		
		int i =0;
		try {
			 pstmt = connection.prepareStatement("select * from experience where applicantID = ?");
			 pstmt.setInt(1, experience.getApplicantID());
			 rs = pstmt.executeQuery();
			 if (rs.next())
			 {	
				 ps = connection.prepareStatement("update experience set workExperience = ?, currentEmployer = ?,"
							+ " addressCE = ?, contactPerson = ?, contactNumber = ?, email = ?, currentSalary = ?,"
							+ " reasonForLeaving = ? where applicantID = ?");			 

			 }
			 else
			 {
				 ps = connection.prepareStatement("insert into experience(workExperience, currentEmployer,"
							+ " addressCE, contactPerson, contactNumber, email, currentSalary,"
							+ " reasonForLeaving, applicantID) values(?, ?, ?, ?, ?, ?, ?, ?,?)");			 
			 } 
			 
			 ps.setInt(1, experience.getWorkExperience());
			 ps.setString(2, experience.getCurrentEmployer());
			 ps.setString(3, experience.getAddressCE());
			 ps.setString(4, experience.getContactPerson());
			 ps.setLong(5, experience.getContactNumber());
			 ps.setString(6, experience.getEmail());
			 ps.setInt(7, experience.getCurrentSalary());
			 ps.setString(8, experience.getReasonForLeaving());
			 ps.setInt(9, experience.getApplicantID());
			 
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
