<%@ page language="java" session="true" contentType="text/html; charset=ISO-8859-1"
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
<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<script src="js/jquery.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<!-- Custom Theme files -->
<link href="css/style.css" rel='stylesheet' type='text/css' />
<link href='//fonts.googleapis.com/css?family=Roboto:100,200,300,400,500,600,700,800,900' rel='stylesheet' type='text/css'>
<!----font-Awesome----->
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
	
	<br>
	<div class="container">
    <div class="single">  
	   <div class="form-container" >
        <h2>Login to your Account</h2>
        
        <center style="color: red;">
        <% if(request.getAttribute("msg")!=null) {
        		out.println(request.getAttribute("msg").toString());
        	}
        %>
        
        <%
        if(session.getAttribute("authenticated")!=null && session.getAttribute("authenticated").equals(true))
        {
        	request.setAttribute("msg", "Already Logged in!!!!");
            request.getRequestDispatcher("WelcomePage.jsp").forward(request, response);
        }
        %>
        </center>
        <br><br>
	<div class="col-md-8 single_right" style="margin-right: 100px; margin-left: 214px;">
	 	   <div class="login-form-section">
                <div class="login-content">
                    <center>
                    <form action="LoginController"  name="myform" method="post" id="myform" >
                        <div class="textbox-wrap">
                            <div class="input-group">
                                <span class="input-group-addon "><i class="fa fa-user"></i></span>
                                <input type="text" title="Username must contain at least 6 characters, including UPPER & LOWER case and numbers" 
                                required pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{6,}" name="username"
                                onchange="this.setCustomValidity(this.validity.patternMismatch ? this.title : '');" 
                                id="username" text-align="center" class="form-control" placeholder="Username" style="font-size: 20px"  >
                            </div>
                        </div>
                        <div class="textbox-wrap"> 
                            <div class="input-group" >
                                <span class="input-group-addon "><i class="fa fa-key"></i></span>
                                <input type="password" title="Password must contain at least 6 characters, including UPPER & LOWER case and numbers"  
                               	required pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{6,}" name="password" 
                               	onchange="this.setCustomValidity(this.validity.patternMismatch ? this.title : '');" 
  								id="password" text-align="center" class="form-control " placeholder="Password" style="font-size: 20px" >
                            </div> 
                        </div>
                     <center/>
                     <br>
                     <div class="forgot">
		
				 		 <center/><div class="login-para">
				 			<p><a href="ForgetPassword.jsp" style="font-size: 20px">Forgot Password? </a></p>
				 		 </div>
					     <div class="clearfix"> </div>
			         </div>
					<div class="login-btn">
					   <input type="submit" value="Log in" name="Submit" class="btn btn-primary btn-sm">
					</div>
				</form>
					<div class="login-bottom">
					 <!-- <p>With your social media account</p> -->
					 <div class="social-icons">
						<div class="button">
							<!-- <a class="tw" href="#"> <i class="fa fa-twitter tw2"> </i><span>Twitter</span>
							<div class="clearfix"> </div></a>
							<a class="fa" href="#"> <i class="fa fa-facebook tw2"> </i><span>Facebook</span>
							<div class="clearfix"> </div></a>
							<a class="go" href="#"><i class="fa fa-google-plus tw2"> </i><span>Google+</span>
							<div class="clearfix"> </div></a>
							<div class="clearfix"> </div> -->
						</div>
						
						<h4 style="font-size: 20px;">Don't have an Account? <a href="SignUp.jsp">Sign Up</a></h4>
						<br>
					 </div> 
		           </div>
                </div>
         </div>
   </div>
  <div class="clearfix"> </div>
 </div>
</div>

</div>
</body>
</html>