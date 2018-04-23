package com.Controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.Dao.AccountActivationDao;

/**
 * Servlet implementation class Controller
 */
public class AccountActivationController extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * Default constructor. 
     */
    public AccountActivationController() {
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
		
		HttpSession session = request.getSession();
		
		if(request.getParameter("submit").equalsIgnoreCase("Submit")){

			String email = request.getParameter("email");
			String activationKey = request.getParameter("activationKey");
			
			int i = AccountActivationDao.authenticateKey(email, activationKey);
			if(i>0) {
				session.setAttribute("email", email);
				request.setAttribute("reset", true);
				request.getRequestDispatcher("ResetPassword.jsp").forward(request, response);
			}
			else {
				request.setAttribute("msg", "Incorrect Activation Key");
				request.setAttribute("activation", true);
				request.getRequestDispatcher("AccountActivation.jsp").forward(request, response);
			}
			
			
		}

	}
}