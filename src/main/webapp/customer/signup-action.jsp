<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%@page import="java.sql.DriverManager" %>
<%@page import="java.sql.ResultSet" %>
<%@page import="java.sql.Statement" %>
<%@page import="java.sql.PreparedStatement" %>
<%@page import="java.sql.Connection" %>

<%
String custEmail=request.getParameter("custEmail");
String custName=request.getParameter("custName");
String custPassword=request.getParameter("custPassword");
String custConfirmPassword=request.getParameter("custConfirmPassword");


try {
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
    PreparedStatement ps = conn.prepareStatement("INSERT INTO customer (custName,custEmail,custPassword,custConfirmPassword) values (?,?,?,?)");
    ps.setString(1,custName);
    ps.setString(2,custEmail);
    ps.setString(3,custPassword);
    ps.setString(4,custConfirmPassword);
    
    ps.executeUpdate();
    response.sendRedirect("customer-login.jsp");
}
catch(Exception e)
{ 
	response.sendRedirect("customer-signup.jsp?msg=notsuccess");
	System.out.println(e);
}
%>
