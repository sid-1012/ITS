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

 <link rel="stylesheet" href="css/datepicker.css">
        <!-- <link rel="stylesheet" href="css/bootstrap.css"> -->
        <script src="js/jquery-1.9.1.min.js"></script>
        <script src="js/bootstrap-datepicker.js"></script>
        <script type="text/javascript">
            // When the document is ready
            $(document).ready(function () {
                
                $('#datepicker').datepicker({
                    format: "yyyy-mm-dd"
                });  
            
            });
        </script>
	<script language="javascript" type="text/javascript"> 
	  var xmlHttp
      function showState(str){
      if (typeof XMLHttpRequest != "undefined"){
	  	xmlHttp= new XMLHttpRequest();
      }
      else if (window.ActiveXObject){
      	xmlHttp= new ActiveXObject("Microsoft.XMLHTTP");
      }

      if (xmlHttp==null){
	  	alert("Browser does not support XMLHTTP Request")
    	return;
      } 

      var url="StateController";
      url +="?count=" +str;
      xmlHttp.onreadystatechange = stateChange;
      xmlHttp.open("GET", url, true);
      xmlHttp.send(null);
      }

      function stateChange(){   
      	if (xmlHttp.readyState==4 || xmlHttp.readyState=="complete"){   
      		document.getElementById("state").innerHTML=xmlHttp.responseText   
      	}   
      }

      function showCity(str){
      	if (typeof XMLHttpRequest != "undefined"){
        	xmlHttp= new XMLHttpRequest();
        }
      	else if (window.ActiveXObject){
        	xmlHttp= new ActiveXObject("Microsoft.XMLHTTP");
        }
      	if (xmlHttp==null){
      		alert("Browser does not support XMLHTTP Request")
      		return;
      	} 
      	
      	var url="CityController";
      	url +="?count=" +str;
      	xmlHttp.onreadystatechange = stateChange1;
	    xmlHttp.open("GET", url, true);
      	xmlHttp.send(null);
      }
      
      function stateChange1(){   
      	if (xmlHttp.readyState==4 || xmlHttp.readyState=="complete"){   
      		document.getElementById("city").innerHTML=xmlHttp.responseText   
      	}   
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
	        <a class="navbar-brand" href="Index.jsp"><img src="images/logo2.png" alt=""/></a>
	    </div>
	    <!--/.navbar-header-->
	    <div class="navbar-collapse collapse" id="bs-example-navbar-collapse-1" style="height: 1px;">
	        <ul class="nav navbar-nav">
		        <li><a href="Index.jsp">Home</a></li>
		        <li><a href="LogoutServlet">Logout</a></li>
		        <li><a href="WelcomePage.jsp">Profile</a></li>
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
        <h2>Registration Form</h2>
        
		 
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
        		PreparedStatement ps = connection.prepareStatement("select * from registration where applicantID = ?");
        		ps.setInt(1, applicantID);
        		ResultSet rs = ps.executeQuery(); 
        		if(rs.next()) {
         %>
        
        <form action="RegistrationFormController" method="post" id="myform">
        
        <input type="hidden" id="applicantID" path="applicantID" name="applicantID" value="<%= session.getAttribute("applicantID") %>" />
         <div class="row">
            <div class="form-group col-md-12">
                <label class="col-md-3 control-lable" style="padding-top: 10px" for="firstName"> First Name</label>
                <div class="col-md-9" style="padding-right: 500px;">
                    <input type="text" class="form-control input-sm" path="firstName" title="First Name must contain only Letters"  
                    required pattern="^[A-Z][-a-zA-Z]+$" name ="firstName" value="<%=rs.getString("firstName") %>"
                    onchange="this.setCustomValidity(this.validity.patternMismatch ? this.title : '');" id="firstName"/>
                </div>
            </div>
         </div>
            <br>     
         <div class="row">
            <div class="form-group col-md-12">
                <label class="col-md-3 control-lable" style="padding-top: 10px" for="middleName">Middle Name</label>
                <div class="col-md-9" style="padding-right: 500px;">
                    <input type="text" path="middleName"  class="form-control input-sm" title="Middle Name must contain only Letters"  
                    required pattern="^[A-Z][-a-zA-Z]+$" name="middleName" value="<%=rs.getString("middleName") %>"
                    onchange="this.setCustomValidity(this.validity.patternMismatch ? this.title : '');" id="middleName"/>
                </div>
            </div>
        </div>
        <br>
         <div class="row">
            <div class="form-group col-md-12">
                <label class="col-md-3 control-lable" style="padding-top: 10px" for="lastName">Last Name</label>
                <div class="col-md-9" style="padding-right: 500px;">
                    <input type="text" path="lastName"  class="form-control input-sm" title="Last Name must contain only Letters"  
                    required pattern="^[A-Z][-a-zA-Z]+$" name="lastName" value="<%=rs.getString("lastName") %>"
                    onchange="this.setCustomValidity(this.validity.patternMismatch ? this.title : '');" id="lastName"/>
                </div>
            </div>
        </div>
        <br>
        <div class="row">
            <div class="form-group col-md-12">
                <label class="col-md-3 control-lable" style="padding-top: 10px" for="contactNumber">Contact Number</label>
                <div class="col-md-9" style="padding-right: 500px;">
                    <input type="text" path="contactNumber"  class="form-control input-sm" title="Please enter 10 digit Contact Number"  
                    required pattern="^[789]\d{9}$" name="contactNumber" value="<%=rs.getLong("contactNumber") %>"
                    onchange="this.setCustomValidity(this.validity.patternMismatch ? this.title : '');"
                    placeholder="Enter 10-digit mobile number" id="contactNumber"/>
                </div>
            </div>
        </div>
        <br>
        <div class="row">
            <div class="form-group col-md-12">
                <label class="col-md-3 control-lable" for="gender">Gender</label>
                <div class="col-md-9" class="form-control input-sm">
                    <div class="radios">
				        <label for="radio-01" class="label_radio">
				        <% if(rs.getString("gender").equals("Male")) { %>
				            <input type="radio" name="gender" value="Male" checked="true" required> Male
				        <% } else { %>
				        	<input type="radio" name="gender" value="Male" required> Male
				        <% } %>
				        </label>
				        <label for="radio-02" class="label_radio">
				        <% if(rs.getString("gender").equals("Female")) { %>
				            <input type="radio" name="gender" value="Female" checked="true"> Female
				        <% } else { %>
				        	<input type="radio" name="gender" value="Female"> Female
				        <% } %>
				        </label>
	                </div>
                </div>
            </div>
        </div>
        <br>
        <div class="row">
            <div class="form-group col-md-12">
                <label class="col-md-3 control-lable" style="padding-top: 10px" for="dateOfBirth">Date Of Birth</label>
                <div class="col-md-9" style="padding-right: 631px;">
                    <input type="text" path="dateOfBirth" id="datepicker" name="dateOfBirth"
                     placeholder="yyyy-mm-dd" value="<%=rs.getDate("dateOfBirth") %>" class="form-control input-sm" required/>
                </div>
            </div>
        </div>
        <br>
        <div class="row">
            <div class="form-group col-md-12">
                <label class="col-md-3 control-lable" style="padding-top: 10px" for="email">Email</label>
                <div class="col-md-9" style="padding-right: 500px;">
                    <input type="text" path="email"  placeholder="abc@example.com" class="form-control input-sm" 
                     title="Please enter a valid email address" value="<%=rs.getString("email") %>" 
                    required pattern="^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z.]{3}$" name="email" 
                    onchange="this.setCustomValidity(this.validity.patternMismatch ? this.title : '');"
                     name="email"  id="email" required/>
                </div>
            </div>
        </div>
        <br>
        <div class="row">
            <div class="form-group col-md-12">
                <label class="col-md-3 control-lable" style="padding-top: 10px" for="address1">Address Line 1</label>
                <div class="col-md-9" style="padding-right: 250px;">
                    <input type="text" path="address1" id="address1" class="form-control input-sm" 
                    title="Please enter a valid address" value="<%=rs.getString("address1") %>"
                    name="address1" required pattern="[0-9]*[A-Za-z-/, ]+.{5,75}"
                    onchange="this.setCustomValidity(this.validity.patternMismatch ? this.title : '');" />
                </div>
            </div>
        </div>
        <br>        
        <div class="row">
            <div class="form-group col-md-12">
                <label class="col-md-3 control-lable" style="padding-top: 10px" for="address2">Address Line 2</label>
                <div class="col-md-9" style="padding-right: 250px;">
                    <input type="text" path="address2" 
                    title="Please enter a valid address" value="<%=rs.getString("address2") %>" 
                    required pattern="[A-Za-z-/, ]+.{5,75}" name ="address2" 
                    onchange="this.setCustomValidity(this.validity.patternMismatch ? this.title : '');"
                    id="address2" class="form-control input-sm"/>
                </div>
            </div>
        </div>
        <br>
  		<div class="row">
            <div class="form-group col-md-12">
                <label class="col-md-3 control-lable" style="padding-top: 10px" for="area">Area</label>
                <div class="col-md-9" style="padding-right: 500px;">
                    <input type="text" path="area" 
                    title="Area must contain only letters"  
                    required pattern="^[A-Z][-a-zA-Z]+$" name ="area" value="<%=rs.getString("area") %>"
                    onchange="this.setCustomValidity(this.validity.patternMismatch ? this.title : '');"
                    id="area" class="form-control input-sm"/>
                </div>
            </div>
        </div>
        <br>
        <div class="row">
            <div class="form-group col-md-12">
                <label class="col-md-3 control-lable" style="padding-top: 10px" for="pincode">Pincode</label>
                <div class="col-md-9" style="padding-right: 500px;">
                    <input type="text" path="pincode"
                    title="Pincode must contain only 6 digits"  value="<%=rs.getLong("pincode") %>"
                    required pattern="^[^0]\d{5}$" name="pincode" 
                    onchange="this.setCustomValidity(this.validity.patternMismatch ? this.title : '');"
                    id="pincode" class="form-control input-sm"/>
                </div>
            </div>
        </div>
        <br>
        <div class="row">
            <div class="form-group col-md-12">
                <label class="col-md-3 control-lable" style="padding-top: 10px" for="country">Country</label>
                <div class="col-md-9" style="padding-right: 500px;"  id="country">
                    <select name='country' onchange="showState(this.value)">  

      					<option value="none">Select</option>  

    					<%  
    							Connection con = DbUtil.getCon();   
 								Statement stmt = con.createStatement();  
 								ResultSet rs1 = stmt.executeQuery("Select * from countries");
 
 								while(rs1.next()){
    					 %>
      					<option value="<%=rs1.getString(1)%>"><%=rs1.getString(3)%></option>  

      					<% } %>
					</select>
                </div>
            </div>
        </div>
		<br>
        <div class="row">
            <div class="form-group col-md-12" >
                <label class="col-md-3 control-lable" style="padding-top: 10px" for="state">State</label>
                <div class="col-md-9" style="padding-right: 500px;" id="state">
                    <select name='state' >  
      					<option value='-1'></option>  
    				</select> 
                </div>
            </div>
        </div>
        <br>
  	    <div class="row">
            <div class="form-group col-md-12">
                <label class="col-md-3 control-lable" style="padding-top: 10px" for="city">City</label>
                <div class="col-md-9" style="padding-right: 500px;" id="city">
                    <select name='city' >  
      					<option value='-1'></option>  
    				</select>
                </div>
            </div>
        </div>
        <br>
               
        <div class="row">
            <div class="form-actions floatRight">
            	<br/>
                <br/><input type="submit" name="submit" value="Update and Next" class="btn btn-primary btn-sm">
               
            </div>
        </div>
       
    </form>
    
    <% } else { %>
    
    <form action="RegistrationFormController" method="post" id="myform">
        
        <input type="hidden" id="applicantID" path="applicantID" name="applicantID" value="<%= session.getAttribute("applicantID") %>" />
         <div class="row">
            <div class="form-group col-md-12">
                <label class="col-md-3 control-lable" style="padding-top: 10px" for="firstName"> First Name</label>
                <div class="col-md-9" style="padding-right: 500px;">
                    <input type="text" class="form-control input-sm" path="firstName" title="First Name must contain only Letters"  
                    required pattern="^[A-Z][-a-zA-Z]+$" name ="firstName" 
                    onchange="this.setCustomValidity(this.validity.patternMismatch ? this.title : '');" id="firstName"/>
                </div>
            </div>
         </div>
            <br>     
         <div class="row">
            <div class="form-group col-md-12">
                <label class="col-md-3 control-lable" style="padding-top: 10px" for="middleName">Middle Name</label>
                <div class="col-md-9" style="padding-right: 500px;">
                    <input type="text" path="middleName"  class="form-control input-sm" title="Middle Name must contain only Letters"  
                    required pattern="^[A-Z][-a-zA-Z]+$" name="middleName" 
                    onchange="this.setCustomValidity(this.validity.patternMismatch ? this.title : '');" id="middleName"/>
                </div>
            </div>
        </div>
        <br>
         <div class="row">
            <div class="form-group col-md-12">
                <label class="col-md-3 control-lable" style="padding-top: 10px" for="lastName">Last Name</label>
                <div class="col-md-9" style="padding-right: 500px;">
                    <input type="text" path="lastName"  class="form-control input-sm" title="Last Name must contain only Letters"  
                    required pattern="^[A-Z][-a-zA-Z]+$" name="lastName" 
                    onchange="this.setCustomValidity(this.validity.patternMismatch ? this.title : '');" id="lastName"/>
                </div>
            </div>
        </div>
        <br>
        <div class="row">
            <div class="form-group col-md-12">
                <label class="col-md-3 control-lable" style="padding-top: 10px" for="contactNumber">Contact Number</label>
                <div class="col-md-9" style="padding-right: 500px;">
                    <input type="text" path="contactNumber"  class="form-control input-sm" title="Please enter 10 digit Contact Number"  
                    required pattern="^[789]\d{9}$" name="contactNumber" 
                    onchange="this.setCustomValidity(this.validity.patternMismatch ? this.title : '');"
                    placeholder="Enter 10-digit mobile number" id="contactNumber"/>
                </div>
            </div>
        </div>
        <br>
        <div class="row">
            <div class="form-group col-md-12">
                <label class="col-md-3 control-lable" for="gender">Gender</label>
                <div class="col-md-9" class="form-control input-sm">
                    <div class="radios">
				        <label for="radio-01" class="label_radio">
				            <input type="radio" name="gender" value="male" required> Male
				        </label>
				        <label for="radio-02" class="label_radio">
				            <input type="radio" name="gender" value="female"> Female
				        </label>
	                </div>
                </div>
            </div>
        </div>
        <br>
        <div class="row">
            <div class="form-group col-md-12">
                <label class="col-md-3 control-lable" style="padding-top: 10px" for="dateOfBirth">Date Of Birth</label>
                <div class="col-md-9" style="padding-right: 631px;">
                    <input type="text" path="dateOfBirth" id="datepicker" name="dateOfBirth" placeholder="dd/mm/yyyy" class="form-control input-sm" required/>
                </div>
            </div>
        </div>
        <br>
        <div class="row">
            <div class="form-group col-md-12">
                <label class="col-md-3 control-lable" style="padding-top: 10px" for="email">Email</label>
                <div class="col-md-9" style="padding-right: 500px;">
                    <input type="text" path="email"  placeholder="abc@example.com" class="form-control input-sm" 
                     title="Please enter a valid email address"  
                    required pattern="^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z.]{3}$" name="email" 
                    onchange="this.setCustomValidity(this.validity.patternMismatch ? this.title : '');"
                     name="email"  id="email" required/>
                </div>
            </div>
        </div>
        <br>
        <div class="row">
            <div class="form-group col-md-12">
                <label class="col-md-3 control-lable" style="padding-top: 10px" for="address1">Address Line 1</label>
                <div class="col-md-9" style="padding-right: 250px;">
                    <input type="text" path="address1" id="address1" class="form-control input-sm" 
                    title="Please enter a valid address"
                    name="address1" required pattern="[0-9]*[A-Za-z-/, ]+.{5,75}"
                    onchange="this.setCustomValidity(this.validity.patternMismatch ? this.title : '');" />
                </div>
            </div>
        </div>
        <br>        
        <div class="row">
            <div class="form-group col-md-12">
                <label class="col-md-3 control-lable" style="padding-top: 10px" for="address2">Address Line 2</label>
                <div class="col-md-9" style="padding-right: 250px;">
                    <input type="text" path="address2" 
                    title="Please enter a valid address"  
                    required pattern="[A-Za-z-/, ]+.{5,75}" name ="address2" 
                    onchange="this.setCustomValidity(this.validity.patternMismatch ? this.title : '');"
                    id="address2" class="form-control input-sm"/>
                </div>
            </div>
        </div>
        <br>
  		<div class="row">
            <div class="form-group col-md-12">
                <label class="col-md-3 control-lable" style="padding-top: 10px" for="area">Area</label>
                <div class="col-md-9" style="padding-right: 500px;">
                    <input type="text" path="area" 
                    title="Area must contain only letters"  
                    required pattern="^[A-Z][-a-zA-Z]+$" name ="area" 
                    onchange="this.setCustomValidity(this.validity.patternMismatch ? this.title : '');"
                    id="area" class="form-control input-sm"/>
                </div>
            </div>
        </div>
        <br>
        <div class="row">
            <div class="form-group col-md-12">
                <label class="col-md-3 control-lable" style="padding-top: 10px" for="pincode">Pincode</label>
                <div class="col-md-9" style="padding-right: 500px;">
                    <input type="text" path="pincode"
                    title="Pincode must contain only 6 digits"  
                    required pattern="^[^0]\d{5}$" name="pincode" 
                    onchange="this.setCustomValidity(this.validity.patternMismatch ? this.title : '');"
                    id="pincode" class="form-control input-sm"/>
                </div>
            </div>
        </div>
        <br>
        <div class="row">
            <div class="form-group col-md-12">
                <label class="col-md-3 control-lable" style="padding-top: 10px" for="country">Country</label>
                <div class="col-md-9" style="padding-right: 500px;">
                    <select name='country' onchange="showState(this.value)">  

      					<option value="none">Select</option>  

    					<%  
    							Connection con = DbUtil.getCon();  
 								Statement stmt = con.createStatement();  
 								ResultSet rs1 = stmt.executeQuery("Select * from countries");
 
 								while(rs1.next()){
    					 %>
      					<option value="<%=rs1.getString(1)%>"><%=rs1.getString(3)%></option>  

      					<% } %>
					</select>
                </div>
            </div>
        </div>
		<br>
        <div class="row">
            <div class="form-group col-md-12">
                <label class="col-md-3 control-lable" style="padding-top: 10px" for="state">State</label>
                <div class="col-md-9" style="padding-right: 500px;" id="state">
                    <select name='state' >  
      					<option value='-1'></option>  
    				</select>
                </div>
            </div>
        </div>
        <br>
  	    <div class="row">
            <div class="form-group col-md-12">
                <label class="col-md-3 control-lable" style="padding-top: 10px" for="city">City</label>
                <div class="col-md-9" style="padding-right: 500px;" id="city">
                    <select name='city' >  
      					<option value='-1'></option>  
    				</select>
                </div>
            </div>
        </div>
  	           
        <div class="row">
            <div class="form-actions floatRight">
            	<br/>
                <br/><input type="submit" name="submit" value="Save and Next" class="btn btn-primary btn-sm">
               
            </div>
        </div>
       
    </form>
    
    <% } } %>
    
    </div>
 </div>
</div>
<div class="footer">
	<div class="container">
		<div class="col-md-3 grid_3">
			<h4>Navigate</h4>
			<ul class="f_list f_list1">
				<li><a href="index.html">Home</a></li>
				<li><a href="login.html">Sign In</a></li>
				<li><a href="login.html">Join Now</a></li>
				<li><a href="about.html">About</a></li>
			</ul>
			<ul class="f_list">
				<li><a href="features.html">Features</a></li>
				<li><a href="terms.html">Terms of use</a></li>
				<li><a href="contact.html">Contact Us</a></li>
				<li><a href="jobs.html">Post a Job</a></li>
			</ul>
			<div class="clearfix"> </div>
		</div>
		<div class="col-md-3 grid_3">
			<h4>Twitter Widget</h4>
			<div class="footer-list">
			  <ul>
				<li><i class="fa fa-twitter tw1"> </i><p><span class="yellow"><a href="#">consectetuer</a></span> adipiscing elit web design</p></li>
				<li><i class="fa fa-twitter tw1"> </i><p><span class="yellow"><a href="#">consectetuer</a></span> adipiscing elit web design</p></li>
				<li><i class="fa fa-twitter tw1"> </i><p><span class="yellow"><a href="#">consectetuer</a></span> adipiscing elit web design</p></li>
			  </ul>
			</div>
		</div>
		<div class="col-md-3 grid_3">
			<h4>Seeking</h4>
			<p>There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don't look even slightly believable. </p>
		</div>
		<div class="col-md-3 grid_3">
			<h4>Sign up for our newsletter</h4>
			<p>Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam.</p>
			<form>
				<input type="text" class="form-control" placeholder="Enter your email">
				<button type="button" class="btn red">Subscribe now!</button>
		    </form>
		</div>
		<div class="clearfix"> </div>
	</div>
</div>
<div class="footer_bottom">	
  <div class="container">
    <div class="col-sm-2">
  		<ul class="f_list2">
			<li><a href="jobs.html">Russia Jobs</a></li>
			<li><a href="jobs.html">Australia Jobs</a></li>
			<li><a href="jobs.html">Srilanka Jobs</a></li>
			<li><a href="jobs.html">Poland Jobs</a></li>
	    </ul>
  	</div>
  	<div class="col-sm-2">
  		<ul class="f_list2">
			<li><a href="jobs.html">Newzland Jobs</a></li>
			<li><a href="jobs.html">Pakistan Jobs</a></li>
			<li><a href="jobs.html">Srilanka Jobs</a></li>
			<li><a href="jobs.html">Irland Jobs</a></li>
	    </ul>
  	</div>
  	<div class="col-sm-2">
  		<ul class="f_list2">
			<li><a href="jobs.html">Canada Jobs</a></li>
			<li><a href="jobs.html">Germany Jobs</a></li>
			<li><a href="jobs.html">China Jobs</a></li>
			<li><a href="jobs.html">Nepal Jobs</a></li>
	    </ul>
  	</div>


</body>
</html>