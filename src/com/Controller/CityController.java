package com.Controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.Util.DbUtil;

/**
 * Servlet implementation class CityController
 */
public class CityController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CityController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String state = request.getParameter("count");  
	 	String buffer="<select name='city' class='form-control input-sm' style='font-size: 15px' required><option value=''>Select</option>";  
	 	try{
	 		Connection con = DbUtil.getCon();  
	 		Statement stmt = con.createStatement();  
	 		ResultSet rs = stmt.executeQuery("Select * from cities where state_id='"+state+"' ");  
	   
	 		while(rs.next()){
	   			buffer=buffer+"<option value='"+rs.getString(1)+"'>"+rs.getString(2)+"</option>";  
	   		}  
	 		buffer=buffer+"</select>";  
	 		response.getWriter().println(buffer); 

	 	}
	 	catch(Exception e){
	     	System.out.println(e);
	 	}
	}
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
