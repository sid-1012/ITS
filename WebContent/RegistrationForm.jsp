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
                    <select name='country' class="form-control input-sm" style="font-size: 15px" onchange="showState(this.value)" required>  

      					<option value="">Select</option>  

    					<%  
    							Connection con = DbUtil.getCon();   
 								Statement stmt = con.createStatement();  
 								ResultSet rsCountry = stmt.executeQuery("Select * from countries");
 
 								while(rsCountry.next()){
    					 %>
    					 <% if((rsCountry.getString("country_name")).equals(rs.getString("country"))) { %>
						<option value="<%=rsCountry.getString(1)%>" selected = 'selected'><%=rsCountry.getString(3)%></option>
						 <% } else { %>  
						<option value="<%=rsCountry.getString(1)%>"><%=rsCountry.getString(3)%></option>
						<% } } %>
					</select>
                </div>
            </div>
        </div>
		<br>
        <div class="row">
            <div class="form-group col-md-12" >
                <label class="col-md-3 control-lable" style="padding-top: 10px" for="state">State</label>
                <div class="col-md-9" style="padding-right: 500px;"  id="state">
                    <select name='state' class="form-control input-sm" onchange="showCity(this.value);" style="font-size: 15px" required>  
      					<option value=''></option>
      					<%  
    							Connection con1 = DbUtil.getCon();   
 								Statement stmt1 = con.createStatement();  
 								ResultSet rsState = stmt.executeQuery("Select * from states where country_id IN "
 											+ "(select country_id from countries where country_name = '" + rs.getString("country") + "')");
 
 								while(rsState.next()){
    					 %>
    					 <% if((rsState.getString("state_name")).equals(rs.getString("state"))) { %>
						<option value="<%=rsState.getString(1)%>" selected = 'selected'><%=rsState.getString(2)%></option>
						 <% } else { %>  
						<option value="<%=rsState.getString(1)%>"><%=rsState.getString(2)%></option>
						<% } } %>  
    				</select> 
                </div>
            </div>
        </div>
        <br>
  	    <div class="row">
            <div class="form-group col-md-12">
                <label class="col-md-3 control-lable" style="padding-top: 10px" for="city">City</label>
                <div class="col-md-9" style="padding-right: 500px;" id="city">
                    <select name='city' class="form-control input-sm" style="font-size: 15px" required>  
      					<option value=''></option>
      					<%  
    							Connection con2 = DbUtil.getCon();   
 								Statement stmt2 = con.createStatement();  
 								ResultSet rsCity = stmt.executeQuery("Select * from cities where state_id IN "
 											+ "(select state_id from states where state_name = '" + rs.getString("state") + "')");
 
 								while(rsCity.next()){
    					 %>
    					 <% if((rsCity.getString("city_name")).equals(rs.getString("city"))) { %>
						<option value="<%=rsCity.getString(1)%>" selected = 'selected'><%=rsCity.getString(2)%></option>
						 <% } else { %>  
						<option value="<%=rsCity.getString(1)%>"><%=rsCity.getString(2)%></option>
						<% } } %>  
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
        
        <%
        PreparedStatement pstmt = connection.prepareStatement("select * from signup where applicantID = ?");
		pstmt.setInt(1, applicantID);
		ResultSet rs2 = pstmt.executeQuery();
		if(rs2.next()) {
        %>
        
        <input type="hidden" id="applicantID" path="applicantID" name="applicantID" value="<%= session.getAttribute("applicantID") %>" />
         <div class="row">
            <div class="form-group col-md-12">
                <label class="col-md-3 control-lable" style="padding-top: 10px" for="firstName"> First Name</label>
                <div class="col-md-9" style="padding-right: 500px;">
                    <input type="text" class="form-control input-sm" path="firstName" title="First Name must contain only Letters"  
                    required pattern="^[A-Z][-a-zA-Z]+$" name ="firstName" value="<%=rs2.getString("firstName") %>"
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
                    required pattern="^[A-Z][-a-zA-Z]+$" name="lastName" value="<%=rs2.getString("lastName") %>"
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
                    <input type="text" path="dateOfBirth" id="datepicker" name="dateOfBirth" placeholder="yyyy-mm-dd" class="form-control input-sm" required/>
                </div>
            </div>
        </div>
        <br>
        <div class="row">
            <div class="form-group col-md-12">
                <label class="col-md-3 control-lable" style="padding-top: 10px" for="email">Email</label>
                <div class="col-md-9" style="padding-right: 500px;">
                    <input type="text" path="email"  placeholder="abc@example.com" class="form-control input-sm" 
                     title="Please enter a valid email address" value="<%=rs2.getString("email") %>" 
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
                    <select name='country' class="form-control input-sm" style="font-size: 15px" onchange="showState(this.value)">  

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
                    <select name='state' class="form-control input-sm" style="font-size: 15px" required>  
      					<option value=''></option>  
    				</select>
                </div>
            </div>
        </div>
        <br>
  	    <div class="row">
            <div class="form-group col-md-12">
                <label class="col-md-3 control-lable" style="padding-top: 10px" for="city">City</label>
                <div class="col-md-9" style="padding-right: 500px;" id="city">
                    <select name='city' class="form-control input-sm" style="font-size: 15px" required>  
      					<option value=''></option>  
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
    
    <% } } } %>
    
    </div>
 </div>
</div>

</body>
</html>