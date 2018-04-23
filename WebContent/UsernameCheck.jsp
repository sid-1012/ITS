<%@page import="java.sql.ResultSet"%>
<%@page import="com.Util.DbUtil"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@ page contentType="text/html" pageEncoding="UTF-8"%>
 
<%
 
            		String username = request.getParameter("ver");
                    Connection connection = DbUtil.getCon();
                    PreparedStatement ps = connection.prepareStatement("select * from signup where username = ?");
                    ps.setString(1, username);
                    
                    ResultSet rs = ps.executeQuery();  // this is for name
                    if(rs.next())
                    {    
                        out.println("<font color=red>");
                        out.println("Username already taken");
                        out.println("</font>");
 
                    }else {
 
                        out.println("<font color=green>");
                        out.println("Available");
                        out.println("</font>");
 
                    }
 
rs.close();
ps.close();
connection.close();
 
%>