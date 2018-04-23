package com.Dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.Model.Agency;
import com.Util.DbUtil;

public class AgencyDao {

	public static int addAgency(Agency agency) {
		// TODO Auto-generated method stub
		Connection connection = DbUtil.getCon();
		PreparedStatement ps = null, pstmt = null;
		ResultSet rs = null;
		
		int i =0;
		
		try {
			 pstmt = connection.prepareStatement("select * from agency where applicantID = ?");
			 pstmt.setInt(1, agency.getApplicantID());
			 rs = pstmt.executeQuery();
			 if(rs.next())
			 {
				 ps = connection.prepareStatement("update agency set fromAnAgency = ?, agencyName = ?, agencyAddress = ?, contactPerson = ?,"
							+ " contactNumber = ?, email = ? where applicantID = ?");
			 }
			 else
			 {
				 ps = connection.prepareStatement("insert into agency (fromAnAgency, agencyName, agencyAddress, contactPerson,"
							+ " contactNumber, email, applicantID) values (?,?,?,?,?,?,?)");
			 }
			 
			 ps.setString(1, agency.getFromAnAgency());
			 ps.setString(2, agency.getAgencyName());
			 ps.setString(3, agency.getAgencyAddress());
			 ps.setString(4, agency.getContactPerson());
			 ps.setLong(5, agency.getContactNumber());
			 ps.setString(6, agency.getEmail());
			 ps.setInt(7, agency.getApplicantID());
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
