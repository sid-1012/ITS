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

<script type="text/javascript">
	function loadXMLDoc()
	{
		var xmlhttp;
		var k=document.getElementById("username").value;
		var urls="UsernameCheck.jsp?ver="+k;
 
		if (window.XMLHttpRequest)
  		{
  			xmlhttp=new XMLHttpRequest();
  		}
		else
  		{
  			xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
  		}
		xmlhttp.onreadystatechange=function()
  		{
  			if (xmlhttp.readyState==4)
    		{
       	 			document.getElementById("err").style.color="red";
        			document.getElementById("err").innerHTML=xmlhttp.responseText;
 
    		}
  		}
		xmlhttp.open("GET",urls,true);
		xmlhttp.send();
	}
</script>

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
	   <div class="form-container">
        <h2>Sign Up</h2>
        <form action="SignUpController"  name="myform" method="post" id="myform">
        <center style="color: red;">
        <% if(request.getAttribute("msg")!=null) {
        		out.println(request.getAttribute("msg").toString());
        	}
        %>
        </center>
        <br>
        <br>
         <div class="row" style="margin-right: 100px; margin-left: 214px;">
            <div class="form-group col-md-12">
                <div class="col-md-9" style="float: left; width: 350px" >
                    <input type="text" style="font-size: 20px" path="firstName"  name ="firstName" id="firstName" 
                    title="First Name must contain only Letters"  
                    required pattern="^[A-Z][-a-zA-Z]+$" onchange="this.setCustomValidity(this.validity.patternMismatch ? this.title : '');"
                    placeholder="First Name" class="form-control input-sm"/>                    
                </div>
                <div class="col-md-9" style="width: 350px">
                    <input type="text" style="font-size: 20px" path="lastName"  name ="lastName" id="lastName" 
                    title="Last Name must contain only Letters"  
                    required pattern="^[A-Z][-a-zA-Z]+$" onchange="this.setCustomValidity(this.validity.patternMismatch ? this.title : '');"
                    placeholder="Last Name" class="form-control input-sm"/>                   
                </div>
            </div>
         </div>
         <br>     
         <div class="row" style="margin-right: 100px; margin-left: 214px;">
            <div class="form-group col-md-12">
                <div class="col-md-9" style="width:700px">
                    <input type="text" style="font-size: 20px" path="email" id="email" placeholder="Email" 
                    title="Please enter a valid email address"  
                    required pattern="^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z.]{2,3}$" name="email" 
                    onchange="this.setCustomValidity(this.validity.patternMismatch ? this.title : '');"
                    class="form-control input-sm"/>
                </div>
            </div>
        </div>
        <br>
        <div class="row" style="margin-right: 100px; margin-left: 214px;">
            <div class="form-group col-md-12">
                <div class="col-md-9" style="width:700px">
                    <input type="text" style="font-size: 20px" path="username" id="username" 
                    title="Username must contain at least 6 characters, including UPPER & LOWER case and numbers"  
                    required pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{6,}" name="username" 
                    onchange="this.setCustomValidity(this.validity.patternMismatch ? this.title : '');"
                    placeholder="Username" class="form-control input-sm" onkeyup="loadXMLDoc()"/><span id="err"></span>
                </div>
            </div>
        </div>
        <br>
        <div class="row" style="margin-right: 100px; margin-left: 214px;">
            <div class="form-group col-md-12">
                <div class="col-md-9" style="width:700px">
                    <input type="password" style="font-size: 20px" path="password" id="password" 
                    title="Password must contain at least 6 characters, including UPPER & LOWER case and numbers"  
                    required pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{6,}" name="password" 
                    onchange="form.confirmPassword.pattern = this.value;"
                    placeholder="Password" class="form-control input-sm"/>
                </div>
            </div>
        </div>
        <br>
        <div class="row" style="margin-right: 100px; margin-left: 214px;">
            <div class="form-group col-md-12">
                <div class="col-md-9" style="width:700px">
                    <input type="password" style="font-size: 20px" path="confirmPassword" id="confirmPassword" 
                    title="Passwords don't match"  
                    required pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{6,}" name="confirmPassword"
                    placeholder="Confirm Password" class="form-control input-sm"/>
                </div>
            </div>
        </div>
        
        <div class="row" style="margin-right: 380px; margin-left: 414px;">
            <div class="form-actions floatRight">
                <br/><input type="submit" name="submit" value="Submit" class="btn btn-primary btn-sm">
            </div>
        </div>
       
    </form>
    </div>
 </div>
</div>

</body>
</html>