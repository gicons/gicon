<%@page import="java.sql.DriverManager" %>
<%@page import="java.sql.ResultSet" %>
<%@page import="java.sql.Statement" %>
<%@page import="java.sql.PreparedStatement" %>
<%@page import="java.sql.Connection" %>
<%@ page import="java.io.*" %>

<% 
String custEmail= session.getAttribute("custEmail").toString();
String name = request.getParameter("name");
String phone = request.getParameter("phone");
String address=request.getParameter("address");
String city = request.getParameter("city");
int postcode = Integer.parseInt(request.getParameter("postcode"));
String state = request.getParameter("state");
String gender = request.getParameter("gender");
try
{   
	String DB_DRIVER = "com.mysql.jdbc.Driver";
    String DB_HOST = "jdbc:mysql://us-cdbr-east-05.cleardb.net:3306/heroku_2dc6a5dedcbc8ba";
    String DB_USER = "be932bb0361058";
    String DB_PASSWORD = "38a03779";
 Connection conn = null;
 Statement stat = null;
 ResultSet res = null;
 Class.forName(DB_DRIVER);
 conn = DriverManager.getConnection(DB_HOST, DB_USER, DB_PASSWORD);
 stat = conn.createStatement();
 
    PreparedStatement ps = conn.prepareStatement("update customer set custPhoneNum=?, custAddress=?, custPostcode=?, custCity=?, custState=?, custGender=?,custName=? where custEmail ='" + custEmail + "'");
    ps.setString(1, phone);
    ps.setString(2, address);
    ps.setInt(3, postcode);
    ps.setString(4, city);
    ps.setString(5, state);
    ps.setString(6, gender);
    ps.setString(7, name);
    ps.executeUpdate();
    response.sendRedirect("customer-account.jsp?msg=valid");
    
    
    
}
catch(Exception e)
{
 response.sendRedirect("customer-account.jsp?msg=invalid");
}


%>