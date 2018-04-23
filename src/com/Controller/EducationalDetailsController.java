package com.Controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.Dao.EducationDao;
import com.Model.Education;

/**
 * Servlet implementation class Controller
 */
public class EducationalDetailsController extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * Default constructor. 
     */
    public EducationalDetailsController() {
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
		
		float higherSecondary, diploma, postGraduation;
		String universityPG;
		HttpSession session = request.getSession();
		
		if(request.getParameter("submit").equalsIgnoreCase("Save and Next") ||
				request.getParameter("submit").equalsIgnoreCase("Update and Next")){
			
			float secondary = Float.parseFloat(request.getParameter("secondary"));
			String stream = request.getParameter("stream");
			float graduation = Float.parseFloat(request.getParameter("graduation"));
			String universityUG = request.getParameter("universityUG");
			int applicantID = Integer.parseInt(request.getParameter("applicantID"));
			
			if(request.getParameter("higherSecondary")!=null) {
				higherSecondary = Float.parseFloat(request.getParameter("higherSecondary"));
			} else {
				higherSecondary = 0;
			}
			if(request.getParameter("diploma")!=null) {
				System.out.println(request.getParameter("diploma"));
				diploma = Float.parseFloat(request.getParameter("diploma"));
			} else {
				diploma = 0;
			}
			if(request.getParameter("postGraduation")!=null) {
				postGraduation = Float.parseFloat(request.getParameter("postGraduation"));
			} else {
				postGraduation = 0;
			}
			if(request.getParameter("universityPG")!=null) {
				universityPG = request.getParameter("universityPG");
			} else {
				universityPG = "";
			}
			
			
			System.out.println(secondary);
			System.out.println(higherSecondary);
			System.out.println(stream);
			System.out.println(diploma);
			System.out.println(graduation);
			System.out.println(universityUG);
			System.out.println(postGraduation);
			System.out.println(universityPG);
			System.out.println(applicantID);
			
			
			Education education = new Education();
			education.setSecondary(secondary);
			education.setHigherSecondary(higherSecondary);
			education.setStream(stream);
			education.setDiploma(diploma);
			education.setGraduation(graduation);
			education.setUniversityUG(universityUG);
			education.setPostGraduation(postGraduation);
			education.setUniversityPG(universityPG);
			education.setApplicantID(applicantID);
			
			int i = EducationDao.addEducation(education);
			System.out.println(i);
			
			if(i>0){
				
				session.setAttribute("education", true);
				response.sendRedirect("WelcomePage.jsp");
				/*List<User> list = UserDao.getUsers();
				request.setAttribute("list", list);*/
				
			}else {
				request.setAttribute("msg", "sorry data not inserted");
				request.getRequestDispatcher("EducationalDetails.jsp").forward(request, response);
			}
		}

	}

}
