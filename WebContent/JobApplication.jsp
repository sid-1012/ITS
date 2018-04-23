<%@page import="java.sql.ResultSet"%>
<%@page import="com.Util.DbUtil"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Statement"%>
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

<script language="javascript" type="text/javascript"> 
	  var xmlHttp
      function showJobTitle(str){
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

      var url="JobOpeningsController";
      url +="?count=" +str;
      xmlHttp.onreadystatechange = stateChange;
      xmlHttp.open("GET", url, true);
      xmlHttp.send(null);
      }

      function stateChange(){   
      	if (xmlHttp.readyState==4 || xmlHttp.readyState=="complete"){   
      		document.getElementById("jobTitle").innerHTML=xmlHttp.responseText   
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
        <h2>Application Form</h2>
        
        <%
        if(!(session.getAttribute("authenticated")!=null && session.getAttribute("authenticated").equals(true)))
        {
        	request.setAttribute("msg", "Please Login first!!!!");
            request.getRequestDispatcher("Login.jsp").forward(request, response);
        }
        else if(!((session.getAttribute("register")!=null && session.getAttribute("register").equals(true)) && 
        		(session.getAttribute("education")!=null && session.getAttribute("education").equals(true)) &&
        		(session.getAttribute("experience")!=null && session.getAttribute("experience").equals(true)) &&
        		(session.getAttribute("agency")!=null && session.getAttribute("agency").equals(true)) &&
        		(session.getAttribute("upload")!=null && session.getAttribute("upload").equals(true))))
        {
        	request.setAttribute("msg", "Please fill all the details and upload your photo and resume before applying for a job!!!");
        	request.getRequestDispatcher("WelcomePage.jsp").forward(request, response);
        }
        %>
        
        <% if(request.getAttribute("msg")!=null) { %>
        	<center style="color: red;">
        	<% out.println(request.getAttribute("msg")); } %>
        	</center>
        	<br />
        	<br /> 
        <%
        if(session.getAttribute("applicantID")!=null) 
        { 
        	Integer applicantID = (Integer)session.getAttribute("applicantID");
        	Connection connection = DbUtil.getCon();
        	PreparedStatement ps = connection.prepareStatement("select * from jobapplication where applicantID = ?");
        	ps.setInt(1, applicantID);
        	ResultSet rs = ps.executeQuery(); 
        	if(rs.next()) {
         %>
        <form action="JobApplicationController" method="post">
        
        
        <input type="hidden" id="applicantID" name="applicantID" value="<%= session.getAttribute("applicantID") %>" />
        
        <div class="row">
            <div class="form-group col-md-12">
                <label class="col-md-3 control-lable" style="padding-top: 10px" for="department">Department</label>
                <div class="col-md-9" style="padding-right: 500px;">
                   <select path="department" id="department" name="department" onchange="showJobTitle(this.value);" class="form-control input-sm" style="font-size: 15px" required>
                        	<option value="">Select</option>
                        <%  
    							Connection con = DbUtil.getCon();   
 								Statement stmt = con.createStatement();  
 								ResultSet rs1 = stmt.executeQuery("Select distinct(department) from jobopenings");
 
 								while(rs1.next()){
    					 %>
    					<% if((rs1.getString("department")).equals(rs.getString("department"))) { %>
						<option value="<%=rs1.getString("department")%>" selected="selected"><%=rs1.getString("department")%></option>
						<% } else { %>
						<option value="<%=rs1.getString("department")%>"><%=rs1.getString("department")%></option>  
						<% } } %>
                   </select>
                </div>
            </div>
        </div>
        <br>
          <div class="row">
            <div class="form-group col-md-12">
                <label class="col-md-3 control-lable" style="padding-top: 5px" for="jobTitle">Job Title</label>
                <div class="col-md-9" style="padding-right: 500px;">
                    <select path="jobTitle" id="jobTitle" name="jobTitle" class="form-control input-sm" style="font-size: 15px" required>
                        	<option value=""></option>
                        	<%  
    							Connection con2 = DbUtil.getCon();   
 								Statement stmt2 = con.createStatement();  
 								ResultSet rsJob = stmt.executeQuery("Select jobTitle from jobapplication where department = '" + rs.getString("department") + "'"
 																+ "and applicantID = '" + rs.getString("applicantID") + "'");
 								while(rsJob.next()){
    					 %>
    					 <% if((rsJob.getString("jobTitle")).equals(rs.getString("jobTitle"))) { %>
						<option value="<%=rsJob.getString("jobTitle")%>" selected = 'selected'><%=rsJob.getString("jobTitle")%></option>
						 <% } else { %>  
						<option value="<%=rsJob.getString("jobTitle")%>"><%=rsJob.getString("jobTitle")%></option>
						<% } } %> 
                    </select>
                    
                </div>
            </div>
        </div>
            <br>     
        <div class="row">
            <div class="form-group col-md-12">
                <label class="col-md-3 control-lable" for="jobType">Job Type</label>
                <div class="col-md-9" class="form-control input-sm">
                    <div class="radios">
				        <label for="radio-01" class="label_radio">
				        <% if(rs.getString("jobType").equals("Full Time")) { %>
				            <input type="radio" name="jobType" value="Full Time" checked="checked" required> Full Time
				        <% } else { %>
				        	<input type="radio" name="jobType" value="Full Time" required> Full Time
				        <% } %>
				        </label>
				        <label for="radio-02" class="label_radio">
				        <% if(rs.getString("jobType").equals("Part Time")) { %>
				            <input type="radio" name="jobType" value="Part Time" checked="checked"> Part Time
				        <% } else { %>
				        	<input type="radio" name="jobType" value="Part Time"> Part Time
				        <% } %>
				        </label>
	                </div>
                </div>
            </div>
        </div>
        <br>
        <div class="row">
            <div class="form-group col-md-12">
                <label class="col-md-3 control-lable" style="padding-top: 10px" for="expectedSalary">Expected Salary</label>
                <div class="col-md-9" style="padding-right: 500px;">
                    <input type="text" path="expectedSalary" 
                    title="6 digits required"  value="<%=rs.getLong("expectedSalary") %>"
                    required pattern="^[1-9]\d{5}$" name="expectedSalary" 
                    onchange="this.setCustomValidity(this.validity.patternMismatch ? this.title : '');"
                    id="expectedSalary" class="form-control input-sm"/>
                </div>
            </div>
        </div>
        <br>
        <div class="row">
            <div class="form-group col-md-12">
                <label class="col-md-3 control-lable" for="readyToRelocate">Ready to Relocate</label>
                <div class="col-md-9" class="form-control input-sm">
                    <div class="radios">
				        <label for="radio-01" class="label_radio">
				        <% if(rs.getString("readyToRelocate").equals("Yes")) { %>
				            <input type="radio" name="readyToRelocate" value="Yes" checked="checked" required> Yes
				        <% } else { %>
				        	<input type="radio" name="readyToRelocate" value="Yes" required> Yes
				        <% } %>
				        </label>
				        <label for="radio-02" class="label_radio">
				        <% if(rs.getString("readyToRelocate").equals("No")) { %>
				            <input type="radio" name="readyToRelocate" value="No" checked="checked"> No
				        <% } else { %>
				        	<input type="radio" name="readyToRelocate" value="No"> No
				        <% } %>
				        </label>
	                </div>
                </div>
            </div>
        </div>
        <br>
        <div class="row">
            <div class="form-group col-md-12">
                <label class="col-md-3 control-lable" for="source">Source</label>
                <div class="col-md-9" class="form-control input-sm">
                    <div class="radios">
				        <label for="radio-01" class="label_radio">
				        <% if(rs.getString("source").equals("Internet")) { %>
				            <input type="radio" name="source" value="Internet" checked="checked" required> Internet
				        <% } else { %>
				        	<input type="radio" name="source" value="Internet" required> Internet
				        <% } %>
				        </label>
				        <label for="radio-02" class="label_radio">
				        <% if(rs.getString("source").equals("News Paper")) { %>
				            <input type="radio" name="source" value="News Paper" checked="checked"> News Paper
				        <% } else { %>
				        	<input type="radio" name="source" value="News Paper"> News Paper
				        <% } %>
				        </label>
				        <label for="radio-02" class="label_radio">
				        <% if(rs.getString("source").equals("Others")) { %>
				            <input type="radio" name="source" value="Others" checked="checked"> Others
				        <% } else { %>
				        	<input type="radio" name="source" value="Others"> Others
				        <% } %>
				        </label>
	                </div>
                </div>
            </div>
        </div>
                
        <div class="row">
            <div class="form-actions floatRight">
            	<br/>
                <input type="submit" name="submit" value="Apply" class="btn btn-primary btn-sm">
            </div>
        </div>
        
        
        
    </form>
    
    <% } else { %>
    
    <form action="JobApplicationController" method="post">
        
        
        <input type="hidden" id="applicantID" name="applicantID" value="<%= session.getAttribute("applicantID") %>" />
            
          <div class="row">
            <div class="form-group col-md-12">
                <label class="col-md-3 control-lable" style="padding-top: 10px" for="department">Department</label>
                <div class="col-md-9" style="padding-right: 500px;">
                   <select path="department" id="department" name="department" onchange="showJobTitle(this.value);" class="form-control input-sm" style="font-size: 15px" required>
                        <option value="">Select</option>
                         <%  
    							Connection con = DbUtil.getCon();   
 								Statement stmt = con.createStatement();  
 								ResultSet rs1 = stmt.executeQuery("Select distinct(department) from jobopenings");
 
 								while(rs1.next()){
    					 %>
						<option value="<%=rs1.getString("department")%>"><%=rs1.getString("department")%></option>  
						<% } %>    
                    </select>
                </div>
            </div>
        </div>
        <br>
        <div class="row">
            <div class="form-group col-md-12">
                <label class="col-md-3 control-lable" style="padding-top: 5px" for="jobTitle">Job Title</label>
                <div class="col-md-9" style="padding-right: 500px;">
                    <select path="jobTitle" id="jobTitle" name="jobTitle" class="form-control input-sm" style="font-size: 15px" required>
                        <option value="">Select</option>
                    </select>
                    
                </div>
            </div>
        </div>
            <br>     
        <div class="row">
            <div class="form-group col-md-12">
                <label class="col-md-3 control-lable" for="jobType">Job Type</label>
                <div class="col-md-9" class="form-control input-sm">
                    <div class="radios">
				        <label for="radio-01" class="label_radio">
				            <input type="radio" name="jobType" value="Full Time" required> Full Time
				        </label>
				        <label for="radio-02" class="label_radio">
				            <input type="radio" name="jobType" value="Part Time"> Part Time
				        </label>
	                </div>
                </div>
            </div>
        </div>
        <br>
        <div class="row">
            <div class="form-group col-md-12">
                <label class="col-md-3 control-lable" style="padding-top: 10px" for="expectedSalary">Expected Salary</label>
                <div class="col-md-9" style="padding-right: 500px;">
                    <input type="text" path="expectedSalary" 
                    title="6 digits required" 
                    required pattern="^[1-9]\d{5}$" name="expectedSalary" 
                    onchange="this.setCustomValidity(this.validity.patternMismatch ? this.title : '');"
                    id="expectedSalary" class="form-control input-sm"/>
                </div>
            </div>
        </div>
        <br>
        <div class="row">
            <div class="form-group col-md-12">
                <label class="col-md-3 control-lable" for="readyToRelocate">Ready to Relocate</label>
                <div class="col-md-9" class="form-control input-sm">
                    <div class="radios">
				        <label for="radio-01" class="label_radio">
				            <input type="radio" name="readyToRelocate" value="Yes" required> Yes
				        </label>
				        <label for="radio-02" class="label_radio">
				            <input type="radio" name="readyToRelocate" value="No"> No
				        </label>
	                </div>
                </div>
            </div>
        </div>
        <br>
        <div class="row">
            <div class="form-group col-md-12">
                <label class="col-md-3 control-lable" for="source">Source</label>
                <div class="col-md-9" class="form-control input-sm">
                    <div class="radios">
				        <label for="radio-01" class="label_radio">
				            <input type="radio" name="source" value="Internet" required> Internet
				        </label>
				        <label for="radio-02" class="label_radio">
				            <input type="radio" name="source" value="News Paper"> News Paper
				        </label>
				        <label for="radio-02" class="label_radio">
				            <input type="radio" name="source" value="Others"> Others
				        </label>
	                </div>
                </div>
            </div>
        </div>
                
        <div class="row">
            <div class="form-actions floatRight">
            	<br/>
                <input type="submit" name="submit" value="Apply" class="btn btn-primary btn-sm">
            </div>
        </div>
        
        
        
    </form>
    
    <% }  } %>
    </div>
 </div>
</div>

</body>
</html>