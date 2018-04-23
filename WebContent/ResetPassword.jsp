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
		        <li style="font-size: 20px;font-weight: bold;"><a href="Login.jsp">Login</a></li>
		        <li style="font-size: 20px;font-weight: bold;"><a href="SignUp.jsp">Sign Up</a></li>
	        </ul>
	    </div>
	    <div class="clearfix"> </div>
	  </div>
	    <!--/.navbar-collapse-->
	</nav>

<%
	if(!(request.getAttribute("reset")!=null && request.getAttribute("reset").equals(true)))
		response.sendRedirect("Login.jsp");
%>

<br>	
<div class="container">
    <div class="single">  
	   <div class="form-container">
        <h2>Reset your Password</h2>
        <br>
        <form action="ResetPasswordController" method="post" id="myform" >
          <center style="color: red;">
          <%
			if(request.getAttribute("msg")!=null)
				out.print(request.getAttribute("msg"));
          %>
          </center>
          <br>
          <input type="hidden" name="email" id="email" value="<%=session.getAttribute("email") %>" />   
             <br>
         <div class="row">
            <div class="form-group col-md-12">
                <label class="col-md-3 control-lable" style="padding-top: 10px" for="newPassword">New Password</label>       
                <div class="col-md-9" style="padding-right: 500px;">
                    <input type="password" style="font-size: 17px;" path="newPassword" id="newPassword" 
                    title="Password must contain at least 6 characters, including UPPER & LOWER case and numbers"  
                    required pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{6,}" name="newPassword" 
                    onchange="form.confirmPassword.pattern = this.value;"
                    placeholder="Password" class="form-control input-sm"/>
                </div>
            </div>
        </div>
        <br>
        <br>
        <div class="row">
            <div class="form-group col-md-12">
                <label class="col-md-3 control-lable" style="padding-top: 10px" for="confirmNewPassword">Confirm New Password</label>       
                <div class="col-md-9" style="padding-right: 500px;">
                    <input type="password" style="font-size: 17px;" path="confirmNewPassword" id="confirmNewPassword" 
                    title="Passwords don't match"  
                    required pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{6,}" name="confirmNewPassword"
                    placeholder="Confirm Password" class="form-control input-sm"/>
                </div>
            </div>
        </div>
        <br>

        <div class="row" style="margin-right: 380px; margin-left: 414px;">
            <div class="form-actions floatRight">
                <br/><input type="submit" name="submit" value="Reset" class="btn btn-primary btn-sm">
            </div>
        </div>
       
    </form>
    </div>
 </div>
</div>

</body>
</html>