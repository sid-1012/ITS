<%@page import="java.io.File"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="com.Util.DbUtil"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" session="true" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Interview Tracking System</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
<link href="css/bootstrap-3.1.1.min.css" rel='stylesheet' type='text/css' />

<script src="js/jquery.min.js"></script>
<script src="js/bootstrap.min.js"></script>

<link href="css/style.css" rel='stylesheet' type='text/css' />
<link href='//fonts.googleapis.com/css?family=Roboto:100,200,300,400,500,600,700,800,900' rel='stylesheet' type='text/css'>

<link href="css/font-awesome.css" rel="stylesheet"> 

    
    <link href="assets/css/bootstrap.css" rel="stylesheet">
    
    
    <!-- Animate css -->
    <link rel="stylesheet" type="text/css" href="assets/css/animate.css"/>  
     <!-- Theme color -->
    <link id="switcher" href="assets/css/theme-color/default.css" rel="stylesheet">

    <!-- Main Style -->
    <link href="style1.css" rel="stylesheet">


</head>

<body>

<nav class="navbar navbar-default" role="navigation">
	<div class="container">
	    <div class="navbar-header">
	        <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
		        <span class="sr-only">Toggle navigation</span>
		        <span class="icon-bar"></span>
		        <span class="icon-bar"></span>
		        <span class="icon-bar"></span>
	        </button>
	        <a class="navbar-brand"><img src="images/logo2.png" alt=""/></a>
	    </div>
	    <!--/.navbar-header-->
	    <div class="navbar-collapse collapse" id="bs-example-navbar-collapse-1" style="height: 1px;">
	        <ul class="nav navbar-nav">
		        <br/>
		        <li style="font-size: 20px;"><a href="LogoutServlet">Logout</a></li>
		        <li style="font-size: 20px;"><a href="WelcomePage.jsp">Profile</a></li>
	        </ul>
	    </div>
	    <div class="clearfix"> </div>
	</div>
	    <!--/.navbar-collapse-->	
</nav>

 		<%
        if(!(session.getAttribute("authenticated")!=null && session.getAttribute("authenticated").equals(true)))
        {
           request.setAttribute("msg", "Please Login first!!!!");
           request.getRequestDispatcher("Login.jsp").forward(request, response);
        }
        %>
        
        <%
        if(session.getAttribute("applicantID")!=null)
        {
        	
        	Integer applicantID = (Integer)session.getAttribute("applicantID");
        	String username = (String)session.getAttribute("username");
            Connection connection = DbUtil.getCon();
            PreparedStatement ps = null;
            ResultSet rs = null;
            
            ps = connection.prepareStatement("select * from registration where applicantID = ?");
            ps.setInt(1, applicantID);
            rs = ps.executeQuery();
            if(rs.next())
            	session.setAttribute("register", true);
            
            ps = connection.prepareStatement("select * from educationaldetails where applicantID = ?");
            ps.setInt(1, applicantID);
            rs = ps.executeQuery();
            if(rs.next())
            	session.setAttribute("education", true);
            
            ps = connection.prepareStatement("select * from experience where applicantID = ?");
            ps.setInt(1, applicantID);
            rs = ps.executeQuery();
            if(rs.next())
            	session.setAttribute("experience", true);
            
            ps = connection.prepareStatement("select * from agency where applicantID = ?");
            ps.setInt(1, applicantID);
            rs = ps.executeQuery();
            if(rs.next())
            	session.setAttribute("agency", true);
            
            ps = connection.prepareStatement("select * from jobapplication where applicantID = ?");
            ps.setInt(1, applicantID);
            rs = ps.executeQuery();
            if(rs.next())
            	session.setAttribute("jobApplication", true);
        	
           	ps = connection.prepareStatement("select * from upload where applicantID = ?");
           	ps.setInt(1, applicantID);
           	rs = ps.executeQuery();
           	if(rs.next())
           		session.setAttribute("upload", true);
           	
           	ps = connection.prepareStatement("select * from interviewprocess where applicantID = ?");
           	ps.setInt(1, applicantID);
           	rs = ps.executeQuery();
           	if(rs.next())
           		session.setAttribute("scheduled", true);
           	
           	ps = connection.prepareStatement("select * from checklist where applicantID = ?");
           	ps.setInt(1, applicantID);
           	rs = ps.executeQuery();
           	if(rs.next())
           		session.setAttribute("selected", true);
            
        }
        %>
        
        
   <div class="container">
    <div class="single">  
	   <div class="form-container">
        <h2>Welcome</h2>
        
        <center style="color: red;">
        <% if(request.getAttribute("msg")!=null) {
        		out.println(request.getAttribute("msg").toString());
        	}
        %>
        </center>
        <section id="service">
    <div class="container">
      <div class="row">
        <div class="col-md-12">
          <div class="service-area">
       		 <div class="service-content">
              <ul class="service-table" >
              	
                <li class="col-md-3 col-sm-6">
                <% if(session.getAttribute("register")!=null && session.getAttribute("register").equals(true)) { %>
            	  <span style="font-family: wingdings; font-size: 300%; color: green;">&#252;</span>
            	<% } else { %>
            	  <span style="font-family: wingdings; font-size: 300%; color: white;">&#252;</span>
        		<% } %> 
                  <div class="single-service wow slideInUp">
                    <span class="fa fa-edit service-icon"></span>
                    <h4 class="service-title"><a href="RegistrationForm.jsp">Registration</a></h4>
                    <p>Complete the Registration</p>
                  </div>
                </li>
                
                
                <li class="col-md-3 col-sm-6">
                <% if(session.getAttribute("education")!=null && session.getAttribute("education").equals(true)) { %>
            	  <span style="font-family: wingdings; font-size: 300%; color: green;">&#252;</span>
            	<% } else { %>
            	  <span style="font-family: wingdings; font-size: 300%; color: white;">&#252;</span>
        		<% } %>
                  <div class="single-service wow slideInUp">
                    <span class="fa fa-edit service-icon"></span>
                    <h4 class="service-title"><a href="EducationalDetails.jsp">Education</a></h4> 
                    <p>Add the Qualifications</p>
                  </div>
                </li>
                
                
                <li class="col-md-3 col-sm-6">
                <% if(session.getAttribute("experience")!=null && session.getAttribute("experience").equals(true)) { %>
            	  <span style="font-family: wingdings; font-size: 300%; color: green;">&#252;</span>
            	<% } else { %>
            	  <span style="font-family: wingdings; font-size: 300%; color: white;">&#252;</span>
        		<% } %>
                  <div class="single-service wow slideInUp">
                    <span class="fa fa-edit service-icon"></span>
					<h4 class="service-title"><a href="Experience.jsp">Experience</a></h4>
                    <p>Have any Work Experience ?</p>
                  </div>
                </li>
                
                
                <li class="col-md-3 col-sm-6">
                <% if(session.getAttribute("agency")!=null && session.getAttribute("agency").equals(true)) { %>
            	  <span style="font-family: wingdings; font-size: 300%; color: green;">&#252;</span>
            	<% } else { %>
            	  <span style="font-family: wingdings; font-size: 300%; color: white;">&#252;</span>
        		<% } %>
                  <div class="single-service wow slideInUp">
                    <span class="fa fa-edit service-icon"></span>
                    <h4 class="service-title"><a href="Agency.jsp">Agency</a></h4>
                    <p>Through an Agency ?</p>
                  </div>
                </li>
              </ul>
              
              <ul class="service-table">
              
              
                <li class="col-md-3 col-sm-6">
                <% if(session.getAttribute("upload")!=null && session.getAttribute("upload").equals(true)) { %>
            	  <span style="font-family: wingdings; font-size: 300%; color: green;">&#252;</span>
        		<% } else { %>
            	  <span style="font-family: wingdings; font-size: 300%; color: white;">&#252;</span>
        		<% } %>
                  <div class="single-service wow slideInUp">
                    <span class="fa fa-edit service-icon"></span>
                    <h4 class="service-title"><a href="UploadResume.jsp">Upload</a></h4>
                    <p>Upload photo & resume</p>
                  </div>
                </li>
                
                
                <li class="col-md-3 col-sm-6">
                <% if(session.getAttribute("jobApplication")!=null && session.getAttribute("jobApplication").equals(true)) { %>
            	  <span style="font-family: wingdings; font-size: 300%; color: green;">&#252;</span>
        		<% } else { %>
            	  <span style="font-family: wingdings; font-size: 300%; color: white;">&#252;</span>
        		<% } %>
                  <div class="single-service wow slideInUp">
                    <span class="fa fa-edit service-icon"></span>
                    <h4 class="service-title"><a href="JobApplication.jsp">Job Application</a></h4>
                    <p>Apply for a job</p>
                  </div>
                </li>
                
                <li class="col-md-3 col-sm-6">
                <% if(session.getAttribute("scheduled")!=null && session.getAttribute("scheduled").equals(true)) { %>
            	  <span style="font-family: wingdings; font-size: 300%; color: green;">&#252;</span>
        		<% } else { %>
            	  <span style="font-family: wingdings; font-size: 300%; color: white;">&#252;</span>
        		<% } %>
                <div class="single-service wow slideInUp">
                    <span class="fa fa-edit service-icon"></span>
                    <h4 class="service-title"><a href="InterviewSchedule.jsp">Schedule</a></h4>
                    <p>Find your Interview Schedule</p>
                  </div>
                </li>
                
                <li class="col-md-3 col-sm-6">
                <span style="font-family: wingdings; font-size: 300%; color: white;">&#252;</span>
                <div class="single-service wow slideInUp">
                    <span class="fa fa-edit service-icon"></span>
                    <h4 class="service-title"><a href="CheckStatus.jsp">CheckStatus</a></h4>
                    <p>Track your application status</p>
                  </div>
                
                </li>
              </ul>
              
        	 </div>
          </div>
        </div>
      </div>
    </div>
        </section>
    </div>
    </div>
    </div>    
 </body>
</html>