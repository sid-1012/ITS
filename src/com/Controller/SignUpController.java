package com.Controller;

import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.Dao.UserDao;
import com.Model.User;

/**
 * Servlet implementation class Controller
 */
public class SignUpController extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * Default constructor. 
     */
    public SignUpController() {
		// TODO Auto-generated constructor stub
	}

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
		
		if(request.getParameter("submit").equalsIgnoreCase("Submit")){
			String firstName = request.getParameter("firstName");
			String lastName = request.getParameter("lastName");
			String email = request.getParameter("email");
			String username = request.getParameter("username");
			String passwordtemp = request.getParameter("password");
			String confirmPasswordtemp = request.getParameter("confirmPassword");
			int flag = 0;
			
			System.out.println(firstName);
			System.out.println(lastName);
			System.out.println(email);
			System.out.println(username);
			System.out.println(passwordtemp);
			System.out.println(confirmPasswordtemp);
			
			String password = UserDao.generateMD5(passwordtemp);
			String confirmPassword = UserDao.generateMD5(confirmPasswordtemp);
			
			User user = new User();
			user.setFirstName(firstName);
			user.setLastName(lastName);
			user.setEmail(email);
			user.setUsername(username);
			user.setPassword(password);
			user.setConfirmPassword(confirmPassword);
			user.setFlag(flag);
			
			ResultSet j = UserDao.check(user);
			try {
				if(j.next()){
					request.setAttribute("msg", "User already exists");
					request.getRequestDispatcher("SignUp.jsp").forward(request, response);
				}
				else 
				{
					int i = UserDao.addApplicant(user);
					System.out.println(i);
				
					if(i>0){
						response.sendRedirect("Login.jsp");
					/*List<User> list = UserDao.getUsers();
					request.setAttribute("list", list);
					request.getRequestDispatcher("login.jsp").forward(request, response);*/
					}else {
						request.setAttribute("msg", "sorry data not inserted");
						request.getRequestDispatcher("Signup.jsp").forward(request, response);
					}
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		
		}

	}
}