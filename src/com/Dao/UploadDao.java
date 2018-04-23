package com.Dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.Util.DbUtil;

public class UploadDao {

	public static int upload(int applicantID, String resumePath, String photoPath) {
		// TODO Auto-generated method stub
		Connection connection = DbUtil.getCon();
        PreparedStatement ps = null, pstmt = null;
        ResultSet rs = null;
        int i = 0;
        
        try {
        	pstmt = connection.prepareStatement("select * from upload where applicantID = ?");
        	pstmt.setInt(1, applicantID);
        	rs = pstmt.executeQuery();
        	
        	if(rs.next()) {
        		ps = connection.prepareStatement("update upload set resumePath = ?, photopath = ? where applicantID = ?");
        	}
        	else {
        		ps = connection.prepareStatement("insert into upload (resumePath, photopath, applicantID) values (?, ?, ?)");
        	}
			ps.setString(1, resumePath);
	        ps.setString(2, photoPath);
	        ps.setInt(3, applicantID);
	        i = ps.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
        return i;
	}

}
