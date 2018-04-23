package com.Controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.Dao.ForgetPasswordDao;
import com.Model.ForgetPassword;

/**
 * Servlet implementation class Controller
 */
public class ForgetPasswordController extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * Default constructor. 
     */
    public ForgetPasswordController() {
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

			String email = request.getParameter("email");
			int applicantID = ForgetPasswordDao.getApplicantID(email);
			String activationKey = ForgetPasswordDao.getActivationKey(applicantID);
						
			ForgetPassword forgetPassword = new ForgetPassword();
			forgetPassword.setApplicantID(applicantID);
			forgetPassword.setActivationKey(activationKey);
			forgetPassword.setEmail(email);
			
			int i = ForgetPasswordDao.addActivationKey(forgetPassword);
			if(i>0) {
				MailAppController ob=new MailAppController();
				ob.doPost(request, response, forgetPassword);
			}
			
			request.setAttribute("activation", true);
			request.getRequestDispatcher("AccountActivation.jsp").forward(request, response);
		}

	}
}