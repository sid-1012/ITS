package com.Controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.Dao.JobApplicationDao;
import com.Model.JobApplication;

/**
 * Servlet implementation class Controller
 */
public class JobApplicationController extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * Default constructor. 
     */
    public JobApplicationController() {
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
		
		if(request.getParameter("submit").equalsIgnoreCase("Apply")){
			int applicantID = Integer.parseInt(request.getParameter("applicantID"));
			String jobTitle = request.getParameter("jobTitle");
			String department = request.getParameter("department");
			String jobType = request.getParameter("jobType");
			int expectedSalary = Integer.parseInt(request.getParameter("expectedSalary"));
			String readyToRelocate = request.getParameter("readyToRelocate");
			String source = request.getParameter("source");
			String username = JobApplicationDao.getUserName(applicantID);
			String applicantName = JobApplicationDao.getApplicantName(applicantID);
			
			System.out.println(applicantID);
			System.out.println(jobTitle);
			System.out.println(department);
			System.out.println(jobType);
			System.out.println(expectedSalary);
			System.out.println(readyToRelocate);
			System.out.println(source);
			System.out.println(applicantName);
			System.out.println(username);
			
			JobApplication application = new JobApplication();
			application.setApplicantID(applicantID);
			application.setJobTitle(jobTitle);
			application.setDepartment(department);
			application.setJobType(jobType);
			application.setExpectedSalary(expectedSalary);
			application.setReadyToRelocate(readyToRelocate);
			application.setSource(source);
			application.setApplicantName(applicantName);
			application.setUserName(username);
			
			int i = JobApplicationDao.applyForJob(application);
			System.out.println(i);
			
			if(i>0){
				
				session.setAttribute("jobApplication", true);
				response.sendRedirect("WelcomePage.jsp");
				/*List<User> list = UserDao.getUsers();
				request.setAttribute("list", list);
				request.getRequestDispatcher("login.jsp").forward(request, response);*/
			}else {
				request.setAttribute("msg", "Job Application unsuccessful!!!");
				request.getRequestDispatcher("JobApplication.jsp").forward(request, response);
			}
		}
		
	}

}
