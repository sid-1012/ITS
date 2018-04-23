<%@ page import="java.sql.Connection" %>
<%@page import="com.Util.DbUtil"%>
<%@ page import="java.sql.PreparedStatement" %>
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

<script type="text/javascript">
        function ValidateFile() {
            var allowedFiles = [".doc", ".docx", ".pdf"];
            var fileUpload = document.getElementById("resume");
            var lblError = document.getElementById("lblError");
            var regex = new RegExp("([a-zA-Z0-9\s_\\.\-:])+(" + allowedFiles.join('|') + ")$");
            if (!regex.test(fileUpload.value.toLowerCase())) {
                lblError.innerHTML = "Please upload files having extensions: <b>" + allowedFiles.join(', ') + "</b> only.";
                return false;
            }
            lblError.innerHTML = "";
            return true;
        }
        
        function ValidatePhoto() {
            var allowedFiles1 = [".jpg", ".jpeg", ".png"];
            var fileUpload1 = document.getElementById("photo");
            var lblError1 = document.getElementById("lblError1");
            var regex1 = new RegExp("([a-zA-Z0-9\s_\\.\-:])+(" + allowedFiles1.join('|') + ")$");
            if (!regex1.test(fileUpload1.value.toLowerCase())) {
                lblError1.innerHTML = "Please upload files having extensions: <b>" + allowedFiles1.join(', ') + "</b> only.";
                return false;
            }
            lblError1.innerHTML = "";
            return true;
        }
        function ValidateForm() {
			var isFormValid = true;
			isFormValid &= ValidateFile();
			isFormValid &= ValidatePhoto();
			return isFormValid ? true : false;
		}
    </script>

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

<div class="container">
    <div class="single">  
	   <div class="form-container">
        <h2>Upload Your Photo & Resume</h2>
        
        <%
        if(!(session.getAttribute("authenticated")!=null && session.getAttribute("authenticated").equals(true)))
        {
        	request.setAttribute("msg", "Please Login first!!!!");
            request.getRequestDispatcher("Login.jsp").forward(request, response);
        }
        %>
        
        
        <br><br>
        <div class="search_form1">
		    <form action="UploadServlet" method="post" onsubmit="return ValidateForm();" enctype="multipart/form-data" >
			 
			  <input type="hidden" id="applicantID" name="applicantID" value="<%= session.getAttribute("applicantID") %>" />
			 
			  <label class="col-md-3 control-lable" style="padding-top: 2px; font-size: 18px;" for="fileUpload">Upload Resume</label>
			  <input type="file" path="resume" name="resume" id="resume" onchange="return ValidateFile()" required/>
    		  <br />
    		  <span id="lblError" style="color: red;"></span>
              <br />
			  
			  
			  <label class="col-md-3 control-lable" style="padding-top: 2px; font-size: 18px;" for="fileUpload">Upload Photo</label>
			  <input type="file" path="photo" name="photo" id="photo" onchange="return ValidatePhoto()" required/>
    		  <br />
    		  <span id="lblError1" style="color: red;"></span>
              <br />
			  
			  <div class="row">
              	<div class="form-actions floatRight">
              		<br/>
              		<input type="submit" id="btnUpload" value="Upload" class="btn btn-primary btn-sm" >
            	</div>
        	  </div>
	        </form>
	   		
	   </div>
	  </div>
	</div>
</div>

</body>
</html>