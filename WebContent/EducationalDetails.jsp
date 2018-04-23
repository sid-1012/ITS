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
        <h2>Educational Details</h2>
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
        		PreparedStatement ps = connection.prepareStatement("select * from educationaldetails where applicantID = ?");
        		ps.setInt(1, applicantID);
        		ResultSet rs = ps.executeQuery(); 
        		if(rs.next()) {
         %>
        
        <form action="EducationalDetailsController" method="post">
        
        
        <input type="hidden" id="applicantID" path="applicantID" name="applicantID" value="<%=session.getAttribute("applicantID") %>" /> 
         <div class="row">
            <div class="form-group col-md-12">
                <label class="col-md-3 control-lable" style="padding-top: 10px" for="secondary">Percentage in 10th</label>
                <div class="col-md-9" style="padding-right: 500px;">
                    <input type="text" path="secondary" name="secondary" placeholder="Enter only percentage" 
                    title="Enter only percentage"
                    required pattern="^\d{0,2}(\.\d{1,4})?$" value="<%=rs.getInt("secondary") %>"
                    onchange="this.setCustomValidity(this.validity.patternMismatch ? this.title : '');"
                    id="secondary" class="form-control input-sm"/>
                </div>
            </div>
         </div>
            <br>     
         <div class="row">
            <div class="form-group col-md-12">
                <label class="col-md-3 control-lable" style="padding-top: 10px" for="higherSecondary">Percentage in 12th</label>
                <div class="col-md-9" style="padding-right: 500px;">
                    <input type="text" path="higherSecondary"
                    title="Enter only percentage" value="<%=rs.getInt("higherSecondary") %>"
                     required pattern="^\d{0,2}(\.\d{1,4})?$" placeholder="Enter only percentage. Type 0 if not applicable."
                    onchange="this.setCustomValidity(this.validity.patternMismatch ? this.title : '');"
                    id="higherSecondary" name="higherSecondary" class="form-control input-sm"/>
                </div>
            </div>
        </div>
        <br>
        <div class="row">
            <div class="form-group col-md-12">
                <label class="col-md-3 control-lable" style="padding-top: 5px" for="stream">Stream</label>
                <div class="col-md-9" style="padding-right: 500px;">
                    <select path="stream" id="stream" name="stream" class="form-control input-sm"
                     style="font-size: 15px;" placeholder="Select" required>
                        	<option value="">Select</option>
                        <% if(rs.getString("stream").equals("Computer Science/Engineering")) { %>
                        	<option value="Computer Science/Engineering" selected="true">Computer Science/Engineering</option>
                        <% } else { %>
                        	<option value="Computer Science/Engineering">Computer Science/Engineering</option>
                        <% } if(rs.getString("stream").equals("Information Technology")) { %>
                        	<option value="Information Technology" selected="true">Information Technology</option>
                        <% } else { %>
                        	<option value="Information Technology">Information Technology</option>
                        <% } if(rs.getString("stream").equals("Electronics and Communication")) { %>
                        	<option value="Electronics and Communication" selected="true">Electronics and Communication</option>
                        <% } else { %>
                        	<option value="Electronics and Communication">Electronics and Communication</option>
                        <% } %>
                    </select>
                    
                </div>
            </div>
        </div>
        <br>
        <div class="row">
            <div class="form-group col-md-12">
                <label class="col-md-3 control-lable" style="padding-top: 10px" for="diploma">Percentage in Diploma</label>
                <div class="col-md-9" style="padding-right: 500px;">
                    <input type="text" path="diploma" name="diploma"
                    title="Enter only percentage" value="<%=rs.getInt("diploma") %>"
                    required pattern="^\d{0,2}(\.\d{1,4})?$"
                    onchange="this.setCustomValidity(this.validity.patternMismatch ? this.title : '');"
                    id="diploma" placeholder="Enter only percentage. Type 0 if not applicable." class="form-control input-sm"/>
                </div>
            </div>
        </div>
        <br>
         <div class="row">
            <div class="form-group col-md-12">
                <label class="col-md-3 control-lable" style="padding-top: 10px" for="graduation">Percentage in Graduation</label>
                <div class="col-md-9" style="padding-right: 500px;">
                    <input type="text" path="graduation" name="graduation"
                    title="Enter only percentage" value="<%=rs.getInt("graduation") %>"
                     required pattern="^\d{0,2}(\.\d{1,4})?$"
                    onchange="this.setCustomValidity(this.validity.patternMismatch ? this.title : '');"
                    id="graduation" placeholder="If CPI, convert it to an equivalent percentage." class="form-control input-sm"/>
                </div>
            </div>
        </div>
        
        
        <br>
        <div class="row">
            <div class="form-group col-md-12">
                <label class="col-md-3 control-lable" style="padding-top: 10px" for="universityUG">University (U.G.)</label>
                <div class="col-md-9">
                    <input type="text" path="universityUG" name="universityUG"
                    title="Enter only letters" value="<%=rs.getString("universityUG") %>"
                     required pattern="^[A-Z][-a-zA-Z ]+$" placeholder="University Name"
                    onchange="this.setCustomValidity(this.validity.patternMismatch ? this.title : '');"
                    id="universityUG" class="form-control input-sm"/>
                </div>
            </div>
        </div>
        <br>
        <div class="row">
            <div class="form-group col-md-12">
                <label class="col-md-3 control-lable" style="padding-top: 10px" for="postGraduation">Percentage in Post Graduation</label>
                <div class="col-md-9" style="padding-right: 500px;">
                    <input type="text" path="postGraduation" name="postGraduation"
                    title="Enter only percentage" value="<%=rs.getInt("postGraduation") %>"
                    required pattern="^\d{0,2}(\.\d{1,4})?$"
                    onchange="this.setCustomValidity(this.validity.patternMismatch ? this.title : '');"
                    id="postGraduation" placeholder="Enter only percentage. Type 0 if not applicable." class="form-control input-sm"/>
                </div>
            </div>
        </div>
        <br>
        <div class="row">
            <div class="form-group col-md-12">
                <label class="col-md-3 control-lable" style="padding-top: 10px" for="universityPG">University (P.G.)</label>
                <div class="col-md-9">
                    <input type="text" path="universityPG" name="universityPG"
                    title="Enter only letters" value="<%=rs.getString("universityPG") %>"
                    pattern="^[A-Z][-a-zA-Z ]+$" placeholder="Leave blank if not applicable."
                    onchange="this.setCustomValidity(this.validity.patternMismatch ? this.title : '');"
                    id="universityPG" class="form-control input-sm"/>
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
    
    <form action="EducationalDetailsController" method="post">
        
        
        <input type="hidden" id="applicantID" path="applicantID" name="applicantID" value="<%=session.getAttribute("applicantID") %>" /> 
         <div class="row">
            <div class="form-group col-md-12">
                <label class="col-md-3 control-lable" style="padding-top: 10px" for="secondary">Percentage in 10th</label>
                <div class="col-md-9" style="padding-right: 500px;">
                    <input type="text" path="secondary" name="secondary" placeholder="Enter only percentage" 
                    title="Enter only percentage"
                    required pattern="^\d{0,2}(\.\d{1,4})?$"
                    onchange="this.setCustomValidity(this.validity.patternMismatch ? this.title : '');"
                    id="secondary" class="form-control input-sm"/>
                </div>
            </div>
         </div>
            <br>     
         <div class="row">
            <div class="form-group col-md-12">
                <label class="col-md-3 control-lable" style="padding-top: 10px" for="higherSecondary">Percentage in 12th</label>
                <div class="col-md-9" style="padding-right: 500px;">
                    <input type="text" path="higherSecondary"
                    title="Enter only percentage"  placeholder="Enter only percentage. Type 0 if not applicable."
                    required pattern="^\d{0,2}(\.\d{1,4})?$"
                    onchange="this.setCustomValidity(this.validity.patternMismatch ? this.title : '');"
                     id="higherSecondary" name="higherSecondary" class="form-control input-sm"/>
                </div>
            </div>
        </div>
        <br>
        <div class="row">
            <div class="form-group col-md-12">
                <label class="col-md-3 control-lable" style="padding-top: 5px" for="stream">Stream</label>
                <div class="col-md-9" style="padding-right: 500px;">
                    <select path="stream" id="stream" name="stream" class="form-control input-sm"
                     placeholder="Select" style="font-size: 15px;" required>
                        <option value="">Select</option>
                        <option value="Computer Science/Engineering">Computer Science/Engineering</option>
                        <option value="Information Technology">Information Technology</option>
                        <option value="Electronics and Communication">Electronics and Communication</option>
                    </select>
                    
                </div>
            </div>
        </div>
        <br>
        <div class="row">
            <div class="form-group col-md-12">
                <label class="col-md-3 control-lable" style="padding-top: 10px" for="diploma">Percentage in Diploma</label>
                <div class="col-md-9" style="padding-right: 500px;">
                    <input type="text" path="diploma" name="diploma"
                    title="Enter only percentage"
                    required pattern="^\d{0,2}(\.\d{1,4})?$"
                    onchange="this.setCustomValidity(this.validity.patternMismatch ? this.title : '');"
                    id="diploma" placeholder="Enter only percentage. Type 0 if not applicable." class="form-control input-sm"/>
                </div>
            </div>
        </div>
        <br>
         <div class="row">
            <div class="form-group col-md-12">
                <label class="col-md-3 control-lable" style="padding-top: 10px" for="graduation">Percentage in Graduation</label>
                <div class="col-md-9" style="padding-right: 500px;">
                    <input type="text" path="graduation" name="graduation"
                    title="Enter only percentage"
                     required pattern="^\d{0,2}(\.\d{1,4})?$"
                    onchange="this.setCustomValidity(this.validity.patternMismatch ? this.title : '');"
                    id="graduation" placeholder="If CPI, convert it to an equivalent percentage." class="form-control input-sm"/>
                </div>
            </div>
        </div>
        
        
        <br>
        <div class="row">
            <div class="form-group col-md-12">
                <label class="col-md-3 control-lable" style="padding-top: 10px" for="universityUG">University (U.G.)</label>
                <div class="col-md-9">
                    <input type="text" path="universityUG" name="universityUG"
                    title="Enter only letters" placeholder="University Name"
                     required pattern="^[A-Z][-a-zA-Z ]+$"
                    onchange="this.setCustomValidity(this.validity.patternMismatch ? this.title : '');"
                    id="universityUG" class="form-control input-sm"/>
                </div>
            </div>
        </div>
        <br>
        <div class="row">
            <div class="form-group col-md-12">
                <label class="col-md-3 control-lable" style="padding-top: 10px" for="postGraduation">Percentage in Post Graduation</label>
                <div class="col-md-9" style="padding-right: 500px;">
                    <input type="text" path="postGraduation" name="postGraduation"
                    title="Enter only percentage"
                    required pattern="^\d{0,2}(\.\d{1,4})?$"
                    onchange="this.setCustomValidity(this.validity.patternMismatch ? this.title : '');"
                    id="postGraduation" placeholder="Enter only percentage. Type 0 if not applicable." class="form-control input-sm"/>
                </div>
            </div>
        </div>
        <br>
        <div class="row">
            <div class="form-group col-md-12">
                <label class="col-md-3 control-lable" style="padding-top: 10px" for="universityPG">University (P.G.)</label>
                <div class="col-md-9">
                    <input type="text" path="universityPG" name="universityPG"
                    title="Enter only letters" placeholder="Leave blank if not applicable"
                    pattern="^[A-Z][-a-zA-Z ]+$"
                    onchange="this.setCustomValidity(this.validity.patternMismatch ? this.title : '');"
                    id="universityPG" class="form-control input-sm"/>
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
    
    <%} } %>
    
    </div>
 </div>
</div>

</body>
</html>