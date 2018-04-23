<%@page import="java.sql.ResultSet"%>
<%@page import="com.Util.DbUtil"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
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
        <h2>Interview Schedule</h2>
        
		 
		<%
        if(!(session.getAttribute("authenticated")!=null && session.getAttribute("authenticated").equals(true)))
        {
    		request.setAttribute("msg", "Please Login first!!!!");
            request.getRequestDispatcher("Login.jsp").forward(request, response);
        }
        %>        
        
        
        <% if(session.getAttribute("applicantID")!=null) 
           { 
        		Integer applicantID = (Integer)session.getAttribute("applicantID");
        		Connection connection = DbUtil.getCon();
        		PreparedStatement ps = connection.prepareStatement("select * from interviewprocess where applicantID = ? and roundID in "
        														+ "(select max(roundID) from interviewprocess where applicantID = ?)");
        		ps.setInt(1, applicantID);
        		ps.setInt(2, applicantID);
        		ResultSet rs = ps.executeQuery();
        		
        		while(rs.next()) {
         %>
        
        <form action="" method="post" id="myform">
         	
         
         <div class="row">
            <div class="form-group col-md-12">
                <label class="col-md-3 control-lable" style="padding-top: 10px" for="interviewWith"> Interview With </label>
                <div class="col-md-9" style="padding-right: 500px;">
                    <input type="text" class="form-control input-sm" path="interviewWith"  
                    value="<%=rs.getString("interviewWith") %>" id="interviewWith" readonly="readonly"/>
                </div>
            </div>
         </div>
         <br/>
         <br/>
         <div class="row">
            <div class="form-group col-md-12">
                <label class="col-md-3 control-lable" style="padding-top: 10px" for="interviewDate"> Interview Date</label>
                <div class="col-md-9" style="padding-right: 500px;">
                    <input type="text" class="form-control input-sm" path="interviewDate" 
                    value="<%=rs.getString("interviewDate") %>" id="interviewDate" readonly="readonly"/>
                </div>
            </div>
         </div>
         <br/>
         <br/>
         <div class="row">
            <div class="form-group col-md-12">
                <label class="col-md-3 control-lable" style="padding-top: 10px" for="interviewTime"> Interview Time</label>
                <div class="col-md-9" style="padding-right: 500px;">
                    <input type="text" class="form-control input-sm" path="interviewTime"  
                    value="<%=rs.getString("interviewTime") %>" id="interviewTime" readonly="readonly"/>
                </div>
            </div>
         </div>
         <br/>
         <br/>
         <div class="row">
            <div class="form-group col-md-12">
                <label class="col-md-3 control-lable" style="padding-top: 10px" for="jobTitle"> Job Title</label>
                <div class="col-md-9" style="padding-right: 500px;">
                    <input type="text" class="form-control input-sm" path="jobTitle"  
                    value="<%=rs.getString("jobTitle") %>" id="jobTitle" readonly="readonly"/>
                </div>
            </div>
         </div>
         <br/>
         <br/>
       <div class="row">
            <div class="form-group col-md-12">
                <label class="col-md-3 control-lable" style="padding-top: 10px" for="department"> Department </label>
                <div class="col-md-9" style="padding-right: 500px;">
                    <input type="text" class="form-control input-sm" path="department" value="<%=rs.getString("department") %>" 
                    id="department" readonly="readonly"/>
                </div>
            </div>
         </div>
         <br/>
         <br/>
         <div class="row">
            <div class="form-group col-md-12">
                <label class="col-md-3 control-lable" style="padding-top: 10px" for="roundType"> Type of Round </label>
                <div class="col-md-9" style="padding-right: 500px;">
                    <input type="text" class="form-control input-sm" path="roundType"  
                    value="<%=rs.getString("roundName") %>" id="roundType" readonly="readonly"/>
                </div>
            </div>
         </div>
         <br/>
         <br/>
    	</form>
    
    <% } %>
    
    	<form action="" method="post" id="myform">
        
        <%
        if(!((session.getAttribute("register")!=null && session.getAttribute("register").equals(true)) && 
        		(session.getAttribute("education")!=null && session.getAttribute("education").equals(true)) &&
        		(session.getAttribute("experience")!=null && session.getAttribute("experience").equals(true)) &&
        		(session.getAttribute("agency")!=null && session.getAttribute("agency").equals(true)) &&
        		(session.getAttribute("upload")!=null && session.getAttribute("upload").equals(true)) &&
        		(session.getAttribute("jobApplication")!=null && session.getAttribute("jobApplication").equals(true)))) {
        %>
        <center style="color: red;">
        Please fill all the details, upload your photo and resume, and then apply for a job.
        </center>
 		<% } else if(!(session.getAttribute("scheduled")!=null && session.getAttribute("scheduled").equals(true))) { %>   
    	<center style="color: red;">
        Your interview will be scheduled soon. You will also receive a mail regarding the same.
        </center>
        <% } %>
    	</form>
    
    <% } %>
    
    </div>
 </div>
</div>

</body>
</html>