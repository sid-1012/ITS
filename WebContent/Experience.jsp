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
        if(document.getElementById("workExperience").value == 0){
        	
        	document.getElementById("currentEmployer").disabled=true;
        	document.getElementById("addressCE").disabled=true;
        	document.getElementById("contactPerson").disabled=true;
        	document.getElementById("contactNumber").disabled=true;
        	document.getElementById("email").disabled=true;
        	document.getElementById("currentSalary").disabled=true;
        	document.getElementById("reasonForLeaving").disabled=true;
        }
        else {
        	document.getElementById("currentEmployer").disabled=false;
        	document.getElementById("addressCE").disabled=false;
        	document.getElementById("contactPerson").disabled=false;
        	document.getElementById("contactNumber").disabled=false;
        	document.getElementById("email").disabled=false;
        	document.getElementById("currentSalary").disabled=false;
        	document.getElementById("reasonForLeaving").disabled=false;
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
        <h2>Work Experience</h2>
        
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
        		PreparedStatement ps = connection.prepareStatement("select * from experience where applicantID = ?");
        		ps.setInt(1, applicantID);
        		ResultSet rs = ps.executeQuery(); 
        		if(rs.next()) {
         %>
        <form action="ExperienceController" method="post">
        
       
        <input type="hidden" id="applicantID" name="applicantID" value="<%=session.getAttribute("applicantID") %>" />
        <div class="row">
            <div class="form-group col-md-12">
                <label class="col-md-3 control-lable" style="padding-top: 5px" for="workExperience">Work Experience</label>
                <div class="col-md-9" style="padding-right: 500px;">
                    <select path="workExperience" id="workExperience" name="workExperience" class="form-control input-sm" 
                    style="font-size: 15px" placeholder="Select" onchange="run()" required>
                        	<option value="">Select</option>
                        <% if(rs.getInt("workExperience")==0) { %>
                        	<option value="0" selected="true">Fresher</option>
                        <% } else { %>
                        	<option value="0">Fresher</option>
                        <% } if(rs.getInt("workExperience")==1) { %>	
                        	<option value="1" selected="true">1 year</option>
                        <% } else { %>
                        	<option value="1">1 year</option>	
                        <% } if(rs.getInt("workExperience")==2) { %>
                        	<option value="2" selected="true">2 years</option>
                        <% } else { %>
                        	<option value="2">2 years</option>
                        <% } if(rs.getInt("workExperience")==3) { %>
                        	<option value="3" selected="true">3 years</option>
                        <% } else { %>
                        	<option value="3">3 years</option>
                        <% } if(rs.getInt("workExperience")==4) { %>
                        	<option value="4" selected="true">4 years</option>
                        <% } else { %>
                        	<option value="4">4 years</option>
                        <% } if(rs.getInt("workExperience")==5) { %>
                        	<option value="5" selected="true">5 years</option>
                        <% } else { %>
                        	<option value="5">5 years</option>
                        <% } if(rs.getInt("workExperience")==6) { %>
                        	<option value="6" selected="true">6 years</option>
                        <% } else { %>
                        	<option value="6">6 years</option>
                        <% } if(rs.getInt("workExperience")==7) { %>
                        	<option value="7" selected="true">7 years</option>
                        <% } else { %>
                        	<option value="7">7 years</option>
                        <% } %> 
                    </select>
                    
                </div>
            </div>
        </div>
        <br>
       
         <div class="row">
            <div class="form-group col-md-12">
                <label class="col-md-3 control-lable" style="padding-top: 10px" for="currentEmployer"> Current Employer</label>
                <div class="col-md-9" style="padding-right: 500px;">
                    <input type="text" path="currentEmployer"
                    title="Current Employer must contain only letters" value="<%=rs.getString("currentEmployer") %>" 
                    required pattern="^[A-Z][-a-zA-Z ]+$" name ="currentEmployer" 
                    onchange="this.setCustomValidity(this.validity.patternMismatch ? this.title : '');"
                     id="currentEmployer" class="form-control input-sm" />
                </div>
             </div>
         </div>
         
            <br>     
         <div class="row">
            <div class="form-group col-md-12">
                <label class="col-md-3 control-lable" style="padding-top: 10px" for="addressCE">Address of Current Employer</label>
                <div class="col-md-9" style="padding-right: 500px;">
                    <textarea cols="87" rows="5" title="Address must contain only Letters and numbers"  
                    required pattern="^[\d]*[a-z-,\/.]+[[\d]*[a-z-,\/.]+]*$" 
                    name ="addressCE" id="addressCE"
                    onchange="this.setCustomValidity(this.validity.patternMismatch ? this.title : '');"><%=rs.getString("addressCE") %></textarea>
                </div>
            </div>
        </div>
        <br>
         <div class="row">
            <div class="form-group col-md-12">
                <label class="col-md-3 control-lable" style="padding-top: 10px" for="contactPerson">Contact Person</label>
                <div class="col-md-9" style="padding-right: 500px;">
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
                <div class="col-md-9" style="padding-right: 500px;">
                    <input type="text" path="contactNumber"
                    title="Please enter 10 digit mobile number" value="<%=rs.getLong("contactNumber") %>" 
                    required pattern="^[789]\d{9}$" name="contactNumber" 
                    onchange="this.setCustomValidity(this.validity.patternMismatch ? this.title : '');"
                     id="contactNumber" placeholder="Enter 10-digit mobile number" class="form-control input-sm"/>
                </div>
            </div>
        </div>
        <br>
        <div class="row">
            <div class="form-group col-md-12">
                <label class="col-md-3 control-lable" style="padding-top: 10px" for="email">Email</label>
                <div class="col-md-9" style="padding-right: 500px;">
                    <input type="text" path="email" id="email" placeholder="abc@example.com"
                    title="Please enter a valid email address" id="email" 
                    required pattern="^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z.]{3}$" name="email" 
                    onchange="this.setCustomValidity(this.validity.patternMismatch ? this.title : '');"
                    class="form-control input-sm" value="<%=rs.getString("email")%>" />
                </div>
            </div>
        </div>
        <br>
        <div class="row">
            <div class="form-group col-md-12">
                <label class="col-md-3 control-lable" style="padding-top: 10px" for="currentSalary">Current Salary (P.A.)</label>
                <div class="col-md-9" style="padding-right: 500px;">
                    <input type="text" path="currentSalary" 
                    title="6 digits required" value="<%=rs.getInt("currentSalary") %>" 
                    required pattern="^[1-9]\d{5}$" name="currentSalary" 
                    onchange="this.setCustomValidity(this.validity.patternMismatch ? this.title : '');"
                    id="currentSalary" class="form-control input-sm"/>
                </div>
            </div>
        </div>
        <br>
        <div class="row">
            <div class="form-group col-md-12">
                <label class="col-md-3 control-lable" style="padding-top: 10px" for="reasonForLeaving">Reason for Leaving</label>
                <div class="col-md-9" >
                    <input type="text" path="reasonForLeaving"
                    title="Reason must contain only letters"  value="<%=rs.getString("reasonForLeaving") %>"
                    required pattern="^[A-Z][-a-zA-Z ]+$" name ="reasonForLeaving" 
                    onchange="this.setCustomValidity(this.validity.patternMismatch ? this.title : '');"
                     id="reasonForLeaving" class="form-control input-sm"/>
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
    
     <form action="ExperienceController" method="post">
        
       
        <input type="hidden" id="applicantID" name="applicantID" value="<%=session.getAttribute("applicantID") %>" />
        <div class="row">
            <div class="form-group col-md-12">
                <label class="col-md-3 control-lable" style="padding-top: 5px" for="workExperience">Work Experience</label>
                <div class="col-md-9" style="padding-right: 500px;">
                    <select path="workExperience" id="workExperience" name="workExperience" class="form-control input-sm" style="font-size: 15px" placeholder="Select" onchange="run()" required>
                        <option value="">Select</option>
                        <option value="0">Fresher</option>
                        <option value="1">1 year</option>
                        <option value="2">2 years</option>
                        <option value="3">3 years</option> 
                        <option value="4">4 years</option> 
                        <option value="5">5 years</option> 
                        <option value="6">6 years</option> 
                        <option value="7">7 years and Above</option> 
                    </select>
                    
                </div>
            </div>
        </div>
        <br>
       
         <div class="row">
            <div class="form-group col-md-12">
                <label class="col-md-3 control-lable" style="padding-top: 10px" for="currentEmployer"> Current Employer</label>
                <div class="col-md-9" style="padding-right: 500px;">
                    <input type="text" path="currentEmployer"
                    title="Current Employer must contain only letters"  
                    required pattern="^[A-Z][-a-zA-Z ]+$" name ="currentEmployer" 
                    onchange="this.setCustomValidity(this.validity.patternMismatch ? this.title : '');"
                     id="currentEmployer" class="form-control input-sm"/>
                </div>
            </div>
         </div>
            <br>     
         <div class="row">
            <div class="form-group col-md-12">
                <label class="col-md-3 control-lable" style="padding-top: 10px" for="addressCE">Address of Current Employer</label>
                <div class="col-md-9" style="padding-right: 500px;">
                    <textarea cols="87" rows="5" title="Address must contain only Letters and numbers"  
                            required pattern="^[\d]*[a-z-,\/.]+[[\d]*[a-z-,\/.]+]*$" name ="addressCE" id="addressCE" 
                            onchange="this.setCustomValidity(this.validity.patternMismatch ? this.title : '');"
                    onblur="if (this.value == '') {Plz Enter Some Content;}"></textarea>
                </div>
            </div>
        </div>
        <br>
         <div class="row">
            <div class="form-group col-md-12">
                <label class="col-md-3 control-lable" style="padding-top: 10px" for="contactPerson">Contact Person</label>
                <div class="col-md-9" style="padding-right: 500px;">
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
                <div class="col-md-9" style="padding-right: 500px;">
                    <input type="text" path="contactNumber"
                    title="Please enter 10 digit mobile number"  
                    required pattern="^[789]\d{9}$" name="contactNumber" 
                    onchange="this.setCustomValidity(this.validity.patternMismatch ? this.title : '');"
                     id="contactNumber" placeholder="Enter 10-digit mobile number" class="form-control input-sm"/>
                </div>
            </div>
        </div>
        <br>
        <div class="row">
            <div class="form-group col-md-12">
                <label class="col-md-3 control-lable" style="padding-top: 10px" for="email">Email</label>
                <div class="col-md-9" style="padding-right: 500px;">
                    <input type="text" path="email" id="email" placeholder="abc@example.com"
                    title="Please enter a valid email address" id="email" 
                    required pattern="^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z.]{3}$" name="email" 
                    onchange="this.setCustomValidity(this.validity.patternMismatch ? this.title : '');"
                    class="form-control input-sm"/>
                </div>
            </div>
        </div>
        <br>
        <div class="row">
            <div class="form-group col-md-12">
                <label class="col-md-3 control-lable" style="padding-top: 10px" for="currentSalary">Current Salary (P.A.)</label>
                <div class="col-md-9" style="padding-right: 500px;">
                    <input type="text" path="currentSalary" 
                    title="6 digits required"  
                    required pattern="^[1-9]\d{5}$" name="currentSalary" 
                    onchange="this.setCustomValidity(this.validity.patternMismatch ? this.title : '');"
                    id="currentSalary" class="form-control input-sm"/>
                </div>
            </div>
        </div>
        <br>
        <div class="row">
            <div class="form-group col-md-12">
                <label class="col-md-3 control-lable" style="padding-top: 10px" for="reasonForLeaving">Reason for Leaving</label>
                <div class="col-md-9" >
                    <input type="text" path="reasonForLeaving"
                    title="Reason must contain only letters"  
                    required pattern="^[A-Z][-a-zA-Z ]+$" name ="reasonForLeaving" 
                    onchange="this.setCustomValidity(this.validity.patternMismatch ? this.title : '');"
                     id="reasonForLeaving" class="form-control input-sm"/>
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
    
    <% }  } %>
    </div>
 </div>
</div>

</body>
</html>