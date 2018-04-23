package com.Controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.Dao.ExperienceDao;
import com.Model.Experience;

/**
 * Servlet implementation class ExperienceController
 */
public class ExperienceController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		
		String currentEmployer, addressCE, contactPerson, email, reasonForLeaving;
		long contactNumber;
		int currentSalary;
		HttpSession session = request.getSession();
		
		if(request.getParameter("submit").equalsIgnoreCase("Save and Next") ||
				request.getParameter("submit").equalsIgnoreCase("Update and Next")){
			int workExperience = Integer.parseInt(request.getParameter("workExperience"));
			int applicantID =  Integer.parseInt(request.getParameter("applicantID"));
			
			if(workExperience != 0)
			{
			
				currentEmployer = request.getParameter("currentEmployer");
				addressCE = request.getParameter("addressCE");
				contactPerson = request.getParameter("contactPerson");
				contactNumber = Long.parseLong(request.getParameter("contactNumber"));
				email = request.getParameter("email");
				currentSalary = Integer.parseInt(request.getParameter("currentSalary"));
				reasonForLeaving = request.getParameter("reasonForLeaving");
			}
			else
			{
				currentEmployer = "";
				addressCE = "";
				contactPerson = "";
				email = "";
				reasonForLeaving = "";
				currentSalary = 0;
				contactNumber = 0;
			}
			
		
			
			System.out.println(workExperience);
			System.out.println(currentEmployer);
			System.out.println(addressCE);
			System.out.println(contactPerson);
			System.out.println(contactNumber);
			System.out.println(email);
			System.out.println(currentSalary);
			System.out.println(reasonForLeaving);
			System.out.println(applicantID);
			
			Experience experience = new Experience();
			experience.setWorkExperience(workExperience);
			experience.setCurrentEmployer(currentEmployer);
			experience.setAddressCE(addressCE);
			experience.setContactPerson(contactPerson);
			experience.setContactNumber(contactNumber);
			experience.setEmail(email);
			experience.setCurrentSalary(currentSalary);
			experience.setReasonForLeaving(reasonForLeaving);
			experience.setApplicantID(applicantID);
			
			
			int i = ExperienceDao.addExperience(experience);
			System.out.println(i);
			if(i>0){
				
				session.setAttribute("experience", true);
				response.sendRedirect("WelcomePage.jsp");
				/*List<User> list = UserDao.getUsers();
				request.setAttribute("list", list);*/
				//request.getRequestDispatcher("Agency.jsp").forward(request, response);
			}else {
				request.setAttribute("msg", "sorry data not inserted");
				request.getRequestDispatcher("Experience.jsp").forward(request, response);
			}
		}

		
	}	
	
}




