<%@page import="java.sql.ResultSet"%>
<%@page import="com.Util.DbUtil"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
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

<script>
    function run() {
        if(document.getElementById("no_radio").checked == 1){
        	
        	document.getElementById("agencyName").disabled=true;
        	document.getElementById("agencyAddress").disabled=true;
        	document.getElementById("contactPerson").disabled=true;
        	document.getElementById("contactNumber").disabled=true;
        	document.getElementById("email").disabled=true;
        }
        else {
        	document.getElementById("agencyName").disabled=false;
        	document.getElementById("agencyAddress").disabled=false;
        	document.getElementById("contactPerson").disabled=false;
        	document.getElementById("contactNumber").disabled=false;
        	document.getElementById("email").disabled=false;
        }
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

<br>	
<div class="container">
    <div class="single">  
	   <div class="form-container">
        <h2>Agency Details</h2>
        
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
        		PreparedStatement ps = connection.prepareStatement("select * from agency where applicantID = ?");
        		ps.setInt(1, applicantID);
        		ResultSet rs = ps.executeQuery(); 
        		if(rs.next()) {
         %>
        
        <form action="AgencyController" method="post" id="form1">
        
        
        <input type="hidden" id="applicantID" name="applicantID" value="<%= session.getAttribute("applicantID") %>" />
         
         <div class="row">
            <div class="form-group col-md-12">
                <label class="col-md-3 control-lable" for="fromAnAgency">From an Agency?</label>
                <div class="col-md-9" class="form-control input-sm">
                    <div class="radios">
				        <label for="radio-01" class="label_radio">
				        <% if(rs.getString("fromAnAgency").equals("Yes")) { %>
				            <input type="radio" name="fromAnAgency" id="yes_radio" onchange="run();" value="Yes" checked="true" required> Yes
				        <% } else { %>
				        	<input type="radio" name="fromAnAgency" id="yes_radio" onchange="run();" value="Yes" required> Yes
				        <% } %>
				        </label>
				        <label for="radio-02" class="label_radio">
				        <% if(rs.getString("fromAnAgency").equals("No")) { %>
				            <input type="radio" name="fromAnAgency" id="no_radio" onchange="run();" value="No" checked="true"> No
				        <% } else { %>
				        	<input type="radio" name="fromAnAgency" id="no_radio" onchange="run();" value="No"> No
				        <% } %>
				        </label>
	                </div>
                </div>
            </div>
        </div>
        <br>
         
         <div class="row">
            <div class="form-group col-md-12">
                <label class="col-md-3 control-lable" style="padding-top: 10px" for="agencyName"> Agency Name </label>
                <div class="col-md-9" style="padding-right:500px;">
                    <input type="text" path="agencyName" value="<%=rs.getString("agencyName") %>"
                    title="Agency Name must contain only letters"  
                    required pattern="^[A-Z][-a-zA-Z ]+$" name ="agencyName" 
                    onchange="this.setCustomValidity(this.validity.patternMismatch ? this.title : '');"
                    id="agencyName" class="form-control input-sm" />
                </div>
            </div>
         </div>
            <br>     
         <div class="row">
            <div class="form-group col-md-12">
                <label class="col-md-3 control-lable" style="padding-top: 10px" for="agencyAddress">Address of Agency</label>
                <div class="col-md-9">
                    <textarea cols="87" rows="5" title="Agency address must contain only Letters and numbers"  
                            required pattern="^[\d]*[a-z-,\/.]+[[\d]*[a-z-,\/.]+]*$" name ="agencyAddress" id ="agencyAddress"
                            onchange="this.setCustomValidity(this.validity.patternMismatch ? this.title : '');"><%=rs.getString("agencyAddress") %></textarea>
                </div>
            </div>
        </div>
        <br>
         <div class="row">
            <div class="form-group col-md-12">
                <label class="col-md-3 control-lable" style="padding-top: 10px" for="contactPerson">Contact Person</label>
                <div class="col-md-9" style="padding-right:500px;">
                    <input type="text" path="contactPerson" value="<%=rs.getString("contactPerson") %>" 
                    title="Contact Person must contain only Letters"  
                    required pattern="^[A-Z][-a-zA-Z ]+$" name ="contactPerson" 
                    onchange="this.setCustomValidity(this.validity.patternMismatch ? this.title : '');"
                    id="contactPerson" class="form-control input-sm"/>
                </div>
            </div>
        </div>
        <br>
        <div class="row">
            <div class="form-group col-md-12">
                <label class="col-md-3 control-lable" style="padding-top: 10px" for="contactNumber">Contact Number</label>
                <div class="col-md-9" style="padding-right:500px;">
                    <input type="text" path="contactNumber" placeholder="Enter 10-digit mobile number"
                    title="Please enter 10 digit mobile number"  value="<%=rs.getLong("contactNumber") %>"
                    required pattern="^[789]\d{9}$" name="contactNumber" 
                    onchange="this.setCustomValidity(this.validity.patternMismatch ? this.title : '');"
                    id="contactNumber" class="form-control input-sm"/>
                </div>
            </div>
        </div>
        <br>
        <div class="row">
            <div class="form-group col-md-12">
                <label class="col-md-3 control-lable" style="padding-top: 10px" for="email">Email</label>
                <div class="col-md-9" style="padding-right:500px;">
                    <input type="email" path="email" id="email" placeholder="abc@example.com" 
                    title="Please enter a valid email address" value="<%=rs.getString("email") %>" 
                    required pattern="^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z.]{3}$" name="email" 
                    onchange="this.setCustomValidity(this.validity.patternMismatch ? this.title : '');"
                    class="form-control input-sm" />
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
    
    <form action="AgencyController" method="post" id="form1">
        
        
        <input type="hidden" id="applicantID" name="applicantID" value="<%= session.getAttribute("applicantID") %>" />
         
         <div class="row">
            <div class="form-group col-md-12">
                <label class="col-md-3 control-lable" for="fromAnAgency">From an Agency?</label>
                <div class="col-md-9" class="form-control input-sm">
                    <div class="radios">
				        <label for="radio-01" class="label_radio" >
				            <input type="radio" name="fromAnAgency" id="yes_radio" onchange="run();" value="Yes"  onclick="run();" required> Yes
				        </label>
				        <label for="radio-02" class="label_radio">
				            <input type="radio" name="fromAnAgency" id="no_radio" onchange="run();" onclick="run();" value="No"> No
				        </label>
	                </div>
                </div>
            </div>
        </div>
        <br>
         
         <div class="row">
            <div class="form-group col-md-12">
                <label class="col-md-3 control-lable" style="padding-top: 10px" for="agencyName"> Agency Name </label>
                <div class="col-md-9" style="padding-right:500px;">
                    <input type="text" path="agencyName" 
                    title="Agency Name must contain only letters"  
                    required pattern="^[A-Z][-a-zA-Z ]+$" name ="agencyName" 
                    onchange="this.setCustomValidity(this.validity.patternMismatch ? this.title : '');"
                    id="agencyName" class="form-control input-sm" />
                </div>
            </div>
         </div>
            <br>     
         <div class="row">
            <div class="form-group col-md-12">
                <label class="col-md-3 control-lable" style="padding-top: 10px" for="agencyAddress">Address of Agency</label>
                <div class="col-md-9">
                    <textarea cols="87" rows="5" title="Agency address must contain only Letters and numbers"  
                            required pattern="^[\d]*[a-z-,\/.]+[[\d]*[a-z-,\/.]+]*$" name ="agencyAddress" id ="agencyAddress"
                            onchange="this.setCustomValidity(this.validity.patternMismatch ? this.title : '');"
                    onblur="if (this.value == '') {Plz Enter Some Content;}"></textarea>
                </div>
            </div>
        </div>
        <br>
         <div class="row">
            <div class="form-group col-md-12">
                <label class="col-md-3 control-lable" style="padding-top: 10px" for="contactPerson">Contact Person</label>
                <div class="col-md-9" style="padding-right:500px;">
                    <input type="text" path="contactPerson" 
                    title="Contact Person must contain only Letters"  
                    required pattern="^[A-Z][-a-zA-Z ]+$" name ="contactPerson" 
                    onchange="this.setCustomValidity(this.validity.patternMismatch ? this.title : '');"
                    id="contactPerson" class="form-control input-sm"/>
                </div>
            </div>
        </div>
        <br>
        <div class="row">
            <div class="form-group col-md-12">
                <label class="col-md-3 control-lable" style="padding-top: 10px" for="contactNumber">Contact Number</label>
                <div class="col-md-9" style="padding-right:500px;">
                    <input type="text" path="contactNumber" placeholder="Enter 10-digit mobile number"
                    title="Please enter 10 digit mobile number"  
                    required pattern="^[789]\d{9}$" name="contactNumber" 
                    onchange="this.setCustomValidity(this.validity.patternMismatch ? this.title : '');"
                    id="contactNumber" class="form-control input-sm"/>
                </div>
            </div>
        </div>
        <br>
        <div class="row">
            <div class="form-group col-md-12">
                <label class="col-md-3 control-lable" style="padding-top: 10px" for="email">Email</label>
                <div class="col-md-9" style="padding-right:500px;">
                    <input type="email" path="email" id="email" placeholder="abc@example.com" 
                    title="Please enter a valid email address"  
                    required pattern="^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z.]{3}$" name="email" 
                    onchange="this.setCustomValidity(this.validity.patternMismatch ? this.title : '');"
                    class="form-control input-sm" />
                </div>
            </div>
        </div>
        <br>
        
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

</body>
</html>