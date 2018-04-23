package com.Controller;

import java.io.IOException;
import java.sql.Date;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.Dao.RegistrationDao;
import com.Model.Register;

/**
 * Servlet implementation class Controller
 */
public class RegistrationFormController extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * Default constructor. 
     */
    public RegistrationFormController() {
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
		
		if(request.getParameter("submit").equalsIgnoreCase("Save and Next") ||
				request.getParameter("submit").equalsIgnoreCase("Update and Next")){
			int applicantID = Integer.parseInt(request.getParameter("applicantID"));
			String firstName = request.getParameter("firstName");
			String middleName = request.getParameter("middleName");
			String lastName = request.getParameter("lastName");
			long contactNumber = Long.parseLong(request.getParameter("contactNumber"));
			String gender = request.getParameter("gender");

			String date = request.getParameter("dateOfBirth");
			//System.out.println(date);
			DateFormat format = new SimpleDateFormat("yyyy-MM-dd");
			java.util.Date utilDate = null;
			try {
				utilDate = format.parse(date);
			}
			catch (ParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			Date dateOfBirth = new Date(utilDate.getTime());
				
			String email = request.getParameter("email");
			String address1 = request.getParameter("address1");
			String address2 = request.getParameter("address2");
			String area = request.getParameter("area");
			long pincode = Long.parseLong(request.getParameter("pincode"));
			
			String city = RegistrationDao.getCity(Integer.parseInt(request.getParameter("city")));
			String state = RegistrationDao.getState(Integer.parseInt(request.getParameter("state")));
			String country = RegistrationDao.getCountry(Integer.parseInt(request.getParameter("country")));
			
				
			System.out.println(applicantID);
			System.out.println(firstName);
			System.out.println(middleName);
			System.out.println(lastName);
			System.out.println(contactNumber);
			System.out.println(gender);
			System.out.println(dateOfBirth);
			System.out.println(email);
			System.out.println(address1);
			System.out.println(address2);
			System.out.println(area);
			System.out.println(city);
			System.out.println(pincode);
			System.out.println(state);
			System.out.println(country);
			
				
			Register register = new Register();
			register.setApplicantID(applicantID);
			register.setFirstName(firstName);
			register.setMiddleName(middleName);
			register.setLastName(lastName);
			register.setContactNumber(contactNumber);
			register.setGender(gender);
			register.setDateOfBirth(dateOfBirth);
			register.setEmail(email);
			register.setAddress1(address1);
			register.setAddress2(address2);
			register.setArea(area);
			register.setCity(city);
			register.setPincode(pincode);
			register.setCountry(country);
			register.setState(state);
			
				
			int	i = RegistrationDao.Register(register);
			
			System.out.println(i);
			
			if(i>0){
				
					session.setAttribute("register", true);
					response.sendRedirect("WelcomePage.jsp");
				
					//request.setAttribute("list", list);
					//request.getRequestDispatcher("EducationalDetails.jsp").forward(request, response);
			}else {
					request.setAttribute("msg", "sorry data not inserted");
					request.getRequestDispatcher("RegistrationForm.jsp").forward(request, response);
			}
		}
			
	}
			
}
