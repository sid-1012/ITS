package com.Dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.Model.Register;
import com.Util.DbUtil;

public class RegistrationDao {

	public static int Register(Register register) {
		Connection connection = DbUtil.getCon();
		PreparedStatement ps = null, pstmt = null;
		ResultSet rs = null;
		int i =0;
		
		try {
			
			 pstmt = connection.prepareStatement("select * from registration where applicantID = ?");
			 pstmt.setInt(1, register.getApplicantID());
			 rs = pstmt.executeQuery();
			 if(rs.next())
			 {
				 ps = connection.prepareStatement("update registration set firstName = ?, middleName = ?,"
				 								+ "lastName = ?, contactNumber = ?, gender = ?, dateOfBirth = ?,"
				 								+ "email = ?, address1 = ?, address2 = ?, area = ?, city = ?,"
				 								+ "pincode = ?, state = ?, country = ? where applicantID = ?");
			 }
			 else
			 {
				 ps = connection.prepareStatement("insert into registration(firstName , middleName, "
			 								+ "lastName, contactNumber, gender, dateOfBirth, email , address1, "
			 								+ "address2 , area, city, pincode, state, country, applicantID) "
			 								+ "values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)");
			 }
			 
			 ps.setString(1, register.getFirstName());
			 ps.setString(2, register.getMiddleName());
			 ps.setString(3, register.getLastName());
			 ps.setLong(4, register.getContactNumber());
			 ps.setString(5, register.getGender());
			 ps.setDate(6, register.getDateOfBirth());
			 ps.setString(7, register.getEmail());
			 ps.setString(8, register.getAddress1());
			 ps.setString(9, register.getAddress2());
			 ps.setString(10, register.getArea());
			 ps.setString(11, register.getCity());
			 ps.setLong(12, register.getPincode());
			 ps.setString(13, register.getState());
			 ps.setString(14, register.getCountry());
			 ps.setInt(15, register.getApplicantID());
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

	public static String getCity(int city) {
		// TODO Auto-generated method stub
		Connection connection = DbUtil.getCon();
		PreparedStatement ps = null;
		ResultSet rs =null;
		String city1 = "";
		try {
			ps = connection.prepareStatement("select * from cities where city_id=?");
			ps.setInt(1, city);
			rs = ps.executeQuery();
			while(rs.next())
			{
				city1 = rs.getString("city_name");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return city1;
	}
	
	public static String getState(int state) {
		// TODO Auto-generated method stub
		Connection connection = DbUtil.getCon();
		PreparedStatement ps = null;
		ResultSet rs =null;
		String state1 = "";
		try {
			ps = connection.prepareStatement("select * from states where state_id=?");
			ps.setInt(1, state);
			rs = ps.executeQuery();
			while(rs.next())
			{
				state1 = rs.getString("state_name");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return state1;
	}
	
	public static String getCountry(int country) {
		// TODO Auto-generated method stub
		Connection connection = DbUtil.getCon();
		PreparedStatement ps = null;
		ResultSet rs =null;
		String country1 = "";
		try {
			ps = connection.prepareStatement("select * from countries where country_id=?");
			ps.setInt(1, country);
			rs = ps.executeQuery();
			while(rs.next())
			{
				country1 = rs.getString("country_name");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return country1;
	}
}
