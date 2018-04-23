package com.Dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.Util.DbUtil;

public class AccountActivationDao {

	public static int authenticateKey(String email, String activationKey) {
		// TODO Auto-generated method stub
		Connection connection = DbUtil.getCon();
		PreparedStatement ps = null;
		ResultSet rs = null;
		int i =0;
		
		try {
			ps = connection.prepareStatement("select * from forgetpassword where email = ?");
			ps.setString(1, email);
			rs = ps.executeQuery();
			
			while(rs.next()) {
				if(rs.getString("activationKey").equals(activationKey))
					i = 1;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return i;
	}


}
