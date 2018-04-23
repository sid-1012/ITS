package com.Dao;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.*;
import javax.mail.*;
import javax.mail.internet.*;

import com.Model.ForgetPassword;
import com.Util.DbUtil;

public class SendMailDao {

    /*private static String USER_NAME = "panchalsiddharth1994";  // GMail user name (just the part before "@gmail.com")
    private static String PASSWORD = "NINJA1994"; // GMail password
    private static String RECIPIENT = "hkchandwani1994";*/

    /*public static void main(String[] args) {
        String from = USER_NAME;
        String pass = PASSWORD;
        String to = RECIPIENT; // list of recipient email addresses
        String subject = "Java send mail example";
        String body = "Welcome to JavaMail!";

        sendFromGMail(from, pass, to, subject, body);
    }*/
    
	public static String GetEmail(int applicantID) {
		// TODO Auto-generated method stub
		String email=null;
    	ResultSet rs = null;
    	Connection connection = DbUtil.getCon();
    	try {
			PreparedStatement ps = connection.prepareStatement("select email from signup where applicantID = ?");
			ps.setInt(1, applicantID);
			rs = ps.executeQuery();
			while(rs.next())
			{
				email = rs.getString("email");
				System.out.println(email);
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
    	
    	return email;
	}
    
	public static String GetBody(ForgetPassword forgetPassword) {
		String result=null;
		String applicantName = null;
		int applicantID=forgetPassword.getApplicantID();
		String activationKey=forgetPassword.getActivationKey();
		
    	ResultSet rs = null;
    	Connection connection = DbUtil.getCon();
    	try {
			PreparedStatement ps = connection.prepareStatement("select * from signup where applicantID = ?");
			ps.setInt(1, applicantID);
			rs = ps.executeQuery();
			while(rs.next())
			{
				applicantName = rs.getString("firstName") + " " + rs.getString("lastName");
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
    	result = "Dear Mr./Ms." + " " + applicantName + "," + System.lineSeparator()
    				 + System.lineSeparator()
    				 + "It seems that you are having trouble signing in to the ITS application." + System.lineSeparator() + System.lineSeparator() 
    				 + "Enter the below mentioned activation key to activate your account and reset your password." + System.lineSeparator()
    				 +  System.lineSeparator() + System.lineSeparator()
    				 + "Activation Key :"+ " " + activationKey + System.lineSeparator()
    				 + System.lineSeparator()
    				 + "Regards," + System.lineSeparator()
    				 + "Team ITS";
    	
    	System.out.println(result);
    	return result;
    	
	}
	
	
    public static String sendFromGMail(String from, String pass, String email, String subject, String body) {
        Properties props = System.getProperties();
        String host = "smtp.gmail.com";
        props.put("mail.smtp.starttls.enable", "true");
        props.put("mail.smtp.host", host);
        props.put("mail.smtp.user", from);
        props.put("mail.smtp.password", pass);
        props.put("mail.smtp.port", "587");
        props.put("mail.smtp.auth", "true");

        Session session = Session.getDefaultInstance(props);
        MimeMessage message = new MimeMessage(session);

        try {
            message.setFrom(new InternetAddress(from));
            InternetAddress[] toAddress = new InternetAddress[email.length()];

            // To get the array of addresses
            for( int i = 0; i < email.length(); i++ ) {
                toAddress[i] = new InternetAddress(email);
            }

            for( int i = 0; i < toAddress.length; i++) {
                message.addRecipient(Message.RecipientType.TO, toAddress[i]);
            }

            message.setSubject(subject);
            message.setText(body);
            Transport transport = session.getTransport("smtp");
            transport.connect(host, from, pass);
            transport.sendMessage(message, message.getAllRecipients());
            transport.close();
        }
        catch (Exception ex) {
            ex.printStackTrace();
            return "Failure";
        }
        return "Success";
    }

	
}