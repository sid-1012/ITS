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
public class StateController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public StateController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String country=request.getParameter("count");
	 	String buffer="<select name='state' class='form-control input-sm' style='font-size: 15px' onchange='showCity(this.value);' required><option value=''>Select</option>";  
	 	Statement stmt = null;
	 	ResultSet rs = null;
	 	try{ 
	 		Connection con = DbUtil.getCon();   
	 		stmt = con.createStatement();  
	 		rs = stmt.executeQuery("Select * from states where country_id='"+country+"' ");  
	 		
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
