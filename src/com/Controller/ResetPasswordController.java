package com.Controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.Dao.UserDao;

/**
 * Servlet implementation class Controller
 */
public class ResetPasswordController extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * Default constructor. 
     */
    public ResetPasswordController() {
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
		
		if(request.getParameter("submit").equalsIgnoreCase("Reset")){

			String email = request.getParameter("email");
			String passwordtemp = request.getParameter("newPassword");
			String confirmPasswordtemp = request.getParameter("confirmNewPassword");
			
			System.out.println(email);
			System.out.println(passwordtemp);
			System.out.println(confirmPasswordtemp);
			
			String password = UserDao.generateMD5(passwordtemp);
			String confirmPassword = UserDao.generateMD5(confirmPasswordtemp);
			
			int result = UserDao.checkPassword(email,password);
	
			if(result==0){
				request.setAttribute("msg", "You cannot use the same password. Please choose a different one !!!");
				request.setAttribute("reset", true);
				request.getRequestDispatcher("ResetPassword.jsp").forward(request, response);
			}
			else 
			{
				int i = UserDao.updatePassword(email, password, confirmPassword);
				System.out.println(i);
				
				if(i>0){
					response.sendRedirect("Login.jsp");
					/*List<User> list = UserDao.getUsers();
					request.setAttribute("list", list);
					request.getRequestDispatcher("login.jsp").forward(request, response);*/
				}else {
					request.setAttribute("msg", "Error in resetting the password !!!");
					request.getRequestDispatcher("ResetPassword.jsp").forward(request, response);
				}
			}
		}

	}
}