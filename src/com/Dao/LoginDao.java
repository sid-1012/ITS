package com.Dao;

import java.math.BigInteger;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.Model.User;
import com.Util.DbUtil;


public class LoginDao {
	
	public static User authenticate(User user) {
		Connection connection = DbUtil.getCon();
		PreparedStatement ps = null;
		java.sql.ResultSet rs = null;
		User user1 = null;
		
		try {
			 ps = connection.prepareStatement("select * from signup where username = '" + user.getUsername() +"' and password = '" + user.getPassword() +"'");
			 rs= ps.executeQuery();
			 
			 while(rs.next()){
				 
				 user1 = new User();
				 user1.setApplicantID(rs.getInt("applicantID"));
				 user1.setUsername(rs.getString("username"));
				 user1.setPassword(rs.getString("password"));
			 }
		}
			 catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
		return user1;
}

	public static String generateMD5(String passwordtemp) {
		// TODO Auto-generated method stub
		String md5 = null;
        if(null == passwordtemp) return null;
         
        try {
             
        //Create MessageDigest object for MD5
        MessageDigest digest = MessageDigest.getInstance("MD5");
        //Update input string in message digest
        digest.update(passwordtemp.getBytes(), 0, passwordtemp.length());
        //Converts message digest value in base 16 (hex) 
        md5 = new BigInteger(1, digest.digest()).toString(16);
        } catch (NoSuchAlgorithmException e) {
            e.printStackTrace();
        }
        return md5;
	}

	public static int checkWhetherClosed(String username) {
		// TODO Auto-generated method stub
		Connection connection = DbUtil.getCon();
		PreparedStatement ps = null;
		ResultSet rs = null;
		int i = 0;
		
		try {
			ps = connection.prepareStatement("select * from signup where username = '" + username + "'");
			rs = ps.executeQuery();
			while(rs.next()) {
				i = rs.getInt("flag");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return i;
	}

}
