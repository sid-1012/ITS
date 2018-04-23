package com.Controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.Dao.AgencyDao;
import com.Model.Agency;

/**
 * Servlet implementation class Controller
 */
public class AgencyController extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * Default constructor. 
     */
    public AgencyController() {
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
		
		String agencyName, agencyAddress, contactPerson, email;
		long contactNumber;
		HttpSession session = request.getSession();
		
		if(request.getParameter("submit").equalsIgnoreCase("Save and Next") ||
				request.getParameter("submit").equalsIgnoreCase("Update and Next")){
			
			int applicantID = Integer.parseInt(request.getParameter("applicantID"));
			String fromAnAgency = request.getParameter("fromAnAgency");
			
			if(fromAnAgency.equalsIgnoreCase("Yes"))
			{
				agencyName = request.getParameter("agencyName");
				agencyAddress = request.getParameter("agencyAddress");
				contactPerson = request.getParameter("contactPerson");
				contactNumber = Long.parseLong(request.getParameter("contactNumber"));
				email = request.getParameter("email");
			}
			else
			{
				agencyName = "";
				agencyAddress = "";
				contactPerson = "";
				contactNumber = 0;
				email = "";
			}
			
			System.out.println(agencyName);
			System.out.println(agencyAddress);
			System.out.println(contactPerson);
			System.out.println(contactNumber);
			System.out.println(email);
			System.out.println(applicantID);
			
			Agency agency = new Agency();
			agency.setAgencyName(agencyName);
			agency.setAgencyAddress(agencyAddress);
			agency.setContactPerson(contactPerson);
			agency.setContactNumber(contactNumber);
			agency.setEmail(email);
			agency.setApplicantID(applicantID);
			agency.setFromAnAgency(fromAnAgency);
			
			int i = AgencyDao.addAgency(agency);
			System.out.println(i);
			
			if(i>0){
				
				session.setAttribute("agency", true);
				response.sendRedirect("WelcomePage.jsp");
				/*List<User> list = UserDao.getUsers();*/
				//session.setAttribute("agencyID", agency.getAgencyID());
			
			}else {
				request.setAttribute("msg", "sorry data not inserted");
				request.getRequestDispatcher("Agency.jsp").forward(request, response);
			}
		}
		
	}

}
