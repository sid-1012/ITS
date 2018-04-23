<%@page import="java.io.PrintWriter"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="com.Util.DbUtil"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
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

<style>
table, th, td {
    border: 1px solid black;
    border-collapse: separate;
}
th, td {
    padding: 5px;
}
</style>

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
		        <li style="font-size: 20px;font-weight: bold;"><a href="LogoutServlet">Logout</a></li>
		        <li style="font-size: 20px;font-weight: bold;"><a href="WelcomePage.jsp">Profile</a></li>
	        </ul>
	    </div>
	    <div class="clearfix"> </div>
	  </div>
	    <!--/.navbar-collapse-->
	</nav>
	

<br>
<div class="container">
    <div class="single">  
	   <div class="form-container">
        <h2>Current Status</h2>
        <%
        if(!(session.getAttribute("authenticated")!=null && session.getAttribute("authenticated").equals(true)))
        {
        	request.setAttribute("msg", "Please Login first!!!!");
            request.getRequestDispatcher("Login.jsp").forward(request, response);
        }
        %>
        <form method="post">
         
        	<input type="hidden" id="applicantID" path="applicantID" name="applicantID" value="<%=session.getAttribute("applicantID") %>" /> 
            
            <center><table style="width:50%">
  				<tr>
   					<th style="text-align: center;">Activity</th>
    				<th style="text-align: center;">Status</th>
  				</tr>
  				<tr>
    				<td style="text-align: center;">Applicant Registration</td>
    				<td style="text-align: center;">
    				<% if(session.getAttribute("register")!=null && session.getAttribute("register").equals(true)) { %>
            	  		<span style="font-family: inherit; font-size: 100%; color: green;">Registered</span>
        			<% } else { %>
            	  		<span style="font-family: inherit; font-size: 100%; color: red;">Pending</span>
        			<% } %></td>
  				</tr>
  				<tr>
    				<td style="text-align: center;">Applied for Job</td>
    				<td style="text-align: center;">
    				<% if(session.getAttribute("jobApplication")!=null && session.getAttribute("jobApplication").equals(true)) { %>
            	  		<span style="font-family: inherit; font-size: 100%; color: green;">Applied</span>
        			<% } else { %>
            	  		<span style="font-family: inherit; font-size: 100%; color: red;">Pending</span>
        			<% } %></td>
  				</tr>
  				<tr>
   					<td style="text-align: center;">Interview Scheduled</td>
    				<td style="text-align: center;">
    				<% if(session.getAttribute("scheduled")!=null && session.getAttribute("scheduled").equals(true)) { %>
            	  		<span style="font-family: inherit; font-size: 100%; color: green;">Scheduled</span>
        			<% } else { %>
            	  		<span style="font-family: inherit; font-size: 100%; color: red;">Pending</span>
        			<% } %></td>
  				</tr>
  				<tr>
    				<td style="text-align: center;">Final Status</td>
    				<td style="text-align: center;">
    				<% if(session.getAttribute("selected")!=null && session.getAttribute("selected").equals(true)) { %>
            	  		<span style="font-family: inherit; font-size: 100%; color: green;">Selected</span>
        			<% } else { %>
            	  		<span style="font-family: inherit; font-size: 100%; color: red;">Pending</span>
        			<% } %></td>
  				</tr>
			</table></center>
        </form>
    
    </div>
 </div>
</div>

</body>
</html>