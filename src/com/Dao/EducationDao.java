package com.Dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.Model.Education;
import com.Util.DbUtil;

public class EducationDao {

	public static int addEducation(Education education) {
		// TODO Auto-generated method stub
		Connection connection = DbUtil.getCon();
		PreparedStatement ps = null, pstmt = null;
		ResultSet rs = null;
		
		int i =0;
		
		try {
			 pstmt = connection.prepareStatement("select * from educationaldetails where applicantID = ?");
			 pstmt.setInt(1, education.getApplicantID());
			 rs = pstmt.executeQuery();
			 if(rs.next())
			 {
				 ps = connection.prepareStatement("update educationaldetails set secondary = ?, higherSecondary = ?, stream = ?,"
			 									+ "diploma = ?, graduation = ?, universityUG = ? , postGraduation = ?, "
			 									+ "universityPG = ? where applicantID = ?");
			 }
			 else
			 {
				 ps = connection.prepareStatement("insert into educationaldetails (secondary , higherSecondary , stream ,"
												+ "diploma , graduation , universityUG , postGraduation, "
												+ "universityPG , applicantID) values (?,?,?,?,?,?,?,?,?) ");
			 }
			 ps.setFloat(1, education.getSecondary());
			 ps.setFloat(2, education.getHigherSecondary());
			 ps.setString(3, education.getStream());
			 ps.setFloat(4, education.getDiploma());
			 ps.setFloat(5, education.getGraduation());
			 ps.setString(6, education.getUniversityUG());
			 ps.setFloat(7, education.getPostGraduation());
			 ps.setString(8, education.getUniversityPG());
			 ps.setInt(9, education.getApplicantID());
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
