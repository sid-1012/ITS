package com.Dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.Model.ForgetPassword;
import com.Util.DbUtil;

public class ForgetPasswordDao {

	public static int getApplicantID(String email) {
		// TODO Auto-generated method stub
		Connection connection = DbUtil.getCon();
		PreparedStatement ps = null;
		ResultSet rs = null;
		int i = 0;
		
		try {
			ps = connection.prepareStatement("select * from signup where email = ?");
			ps.setString(1, email);
			rs = ps.executeQuery();
			while(rs.next()) {
				i = rs.getInt("applicantID");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}	
		
		return i;
	}

	public static String getActivationKey(int applicantID) {
		// TODO Auto-generated method stub
		Connection connection = DbUtil.getCon();
		PreparedStatement ps = null;
		ResultSet rs = null;
		String key = "";
		
		try {
			ps = connection.prepareStatement("select * from signup where applicantID = ?");
			ps.setInt(1, applicantID);
			rs = ps.executeQuery();
			while(rs.next()) {
				key = rs.getString("password");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}	
		
		return key;
	}

	public static int addActivationKey(ForgetPassword forgetPassword) {
		// TODO Auto-generated method stub
		Connection connection = DbUtil.getCon();
		PreparedStatement ps = null, pstmt = null;
		ResultSet rs = null;
		int i = 0;
		
		try {
			pstmt = connection.prepareStatement("select * from forgetpassword where applicantID = ?");
			pstmt.setInt(1, forgetPassword.getApplicantID());
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				ps = connection.prepareStatement("update forgetpassword set email = ?, activationKey = ? where applicantID = ?");
			}
			else {
				ps = connection.prepareStatement("insert into forgetpassword(email, activationKey, applicantID) values(?, ?, ?)");
			}
			ps.setString(1, forgetPassword.getEmail());
			ps.setString(2, forgetPassword.getActivationKey());
			ps.setInt(3, forgetPassword.getApplicantID());
			
			i = ps.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return i;
	}

}
