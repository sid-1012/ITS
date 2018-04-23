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

public class UserDao {
	
	public static int addApplicant(User user) {
		Connection connection = DbUtil.getCon();
		PreparedStatement ps = null;
		int i =0;
		try {
			 ps = connection.prepareStatement("insert into signup(firstName, lastName, email, username, password, confirmPassword, flag)"
					 						+ "values(?, ?, ?, ?, ?, ?, ?)");
			 ps.setString(1, user.getFirstName());
			 ps.setString(2, user.getLastName());
			 ps.setString(3, user.getEmail());
			 ps.setString(4, user.getUsername());
			 ps.setString(5, user.getPassword());
			 ps.setString(6, user.getConfirmPassword());
			 ps.setInt(7, user.getFlag());
			 
			 i = ps.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return i;
		
	}
	
	
	/*public static List<User> getUsers() {
		Connection connection = DbUtil.getCon();
		PreparedStatement ps = null;
		ResultSet rs = null;
		List<User> users = new ArrayList<User>();
		try {
			 ps = connection.prepareStatement("select * from signup");
			 rs= ps.executeQuery();
			 
			 while(rs.next()){
				 
				 User user = new User();
				 user.setApplicantID(rs.getInt("applicantID"));
				 user.setFirstName(rs.getString("firstName"));
				 user.setLastName(rs.getString("lastName"));
				 user.setEmail(rs.getString("email"));
				 user.setUsername(rs.getString("username"));
				 user.setPassword(rs.getString("password"));
				 user.setConfirmPassword(rs.getString("confirmPassword"));
				 users.add(user);
			 }
			 
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return users;
	}*/

	/*public static int deleteUser(int id) {
		Connection connection = DbUtil.getCon();
		PreparedStatement ps = null;
		int i =0;
		try {
			 ps = connection.prepareStatement("delete from user where id = ?");
			 ps.setInt(1, id);
			 
			 i = ps.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return i;
		
	}*/
	
	public static User findUser(int id) {
		Connection connection = DbUtil.getCon();
		PreparedStatement ps = null;
		ResultSet rs = null;
	
		User  user = null;
		try {
			 ps = connection.prepareStatement("SELECT * from login where username = ? and password = ? LIMIT 1;");
			 rs= ps.executeQuery();
			 
			 while(rs.next()){
				 
				 user = new User();
				 user.setUsername(rs.getString("username"));
				 user.setPassword(rs.getString("password"));
				 
			 }
			 
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return user;
	}


	public static ResultSet check(User user) {
		// TODO Auto-generated method stub
		Connection connection = DbUtil.getCon();
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		try {
			ps = connection.prepareStatement("select * from signup where email = ?");
			ps.setString(1, user.getEmail());
			rs = ps.executeQuery();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return rs;
	}


	public static String generateMD5(String confirmPassword) {
		// TODO Auto-generated method stub
		String md5 = null;
        if(null == confirmPassword) return null;
         
        try {
             
        //Create MessageDigest object for MD5
        MessageDigest digest = MessageDigest.getInstance("MD5");
        //Update input string in message digest
        digest.update(confirmPassword.getBytes(), 0, confirmPassword.length());
        //Converts message digest value in base 16 (hex) 
        md5 = new BigInteger(1, digest.digest()).toString(16);
        } catch (NoSuchAlgorithmException e) {
            e.printStackTrace();
        }
        return md5;
	}


	public static int checkPassword(String email, String newPassword) {
		// TODO Auto-generated method stub
		Connection connection = DbUtil.getCon();
		PreparedStatement ps = null;
		ResultSet rs = null;
		int result = 0;
		
		try {
			ps = connection.prepareStatement("select * from signup where email = ?");
			ps.setString(1, email);
			rs = ps.executeQuery();
			while(rs.next()) {
				if(!(rs.getString("password").equalsIgnoreCase(newPassword))) {
					result = 1;
				}
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return result;
	}


	public static int updatePassword(String email, String password, String confirmPassword) {
		// TODO Auto-generated method stub
		Connection connection = DbUtil.getCon();
		PreparedStatement ps = null;
		int i = 0;
		
		try {
			ps = connection.prepareStatement("update signup set password = ?, confirmPassword = ? where email = ?");
			ps.setString(1, password);
			ps.setString(2, confirmPassword);
			ps.setString(3, email);
			i = ps.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return i;
	}

}
