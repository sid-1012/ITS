package com.Controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.Dao.LoginDao;
import com.Model.User;

/**
 * Servlet implementation class Loginontroller
 */
public class LoginController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		HttpSession session = null;
		
		String username = request.getParameter("username");
		String passwordtemp = request.getParameter("password");
		
		System.out.println(username);
		System.out.println(passwordtemp);
		
		String password = LoginDao.generateMD5(passwordtemp);
		
		int i = LoginDao.checkWhetherClosed(username);
		if(i==1) {
			request.setAttribute("msg", "Your application process has been closed!!!");
			request.getRequestDispatcher("Login.jsp").forward(request, response);
		}
		else {
			User user = new User();
			user.setUsername(username);
			user.setPassword(password);
			User user2 = LoginDao.authenticate(user);
			
			
			if(user2!=null)
			{
				session = request.getSession(true);
				//session.setMaxInactiveInterval(30);
				session.setAttribute("authenticated", true);
				session.setAttribute("applicantID", user2.getApplicantID());
				session.setAttribute("username", user2.getUsername());
				//if(rs.next()){
				response.sendRedirect("WelcomePage.jsp");
				
			}
			else
			{
				request.setAttribute("msg", "Incorrect Username / Password!!!");
				request.getRequestDispatcher("Login.jsp").forward(request, response);
			}
		}
				
	}

}

