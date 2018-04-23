package com.Controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.Dao.SendMailDao;
import com.Model.ForgetPassword;

/**
 * Servlet implementation class MailApp
 */
public class MailAppController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	final String from = "team.its46326";  // GMail user name (just the part before "@gmail.com")
    final String pass = "its46326"; // GMail password
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MailAppController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @param ApplicantID 
	 * @param jobApplicationID 
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	
	public void doPost(HttpServletRequest request, HttpServletResponse response, ForgetPassword forgetPassword) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/html;charset=UTF-8");
        /*out.println("in the mail app servlet");*/
        final String subject = "Account Activation";
        
        String email = SendMailDao.GetEmail(forgetPassword.getApplicantID());
        String body = SendMailDao.GetBody(forgetPassword);
       
        
        String str = SendMailDao.sendFromGMail(from, pass, email, subject, body);
        while(str.equals("Failure")) {
        	str = SendMailDao.sendFromGMail(from, pass, email, subject, body);
        }
	}
	
}
