<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.PreparedStatement" %>
<%@page import="java.sql.Connection" %>
<%@page import="java.sql.DriverManager" %>
<%@page import="java.sql.Statement" %>
<%@page import="java.sql.ResultSet" %>
<%
try{
	String id = request.getParameter("id");
	String DB_DRIVER = "com.mysql.jdbc.Driver";
    String DB_HOST = "jdbc:mysql://us-cdbr-east-05.cleardb.net:3306/heroku_2dc6a5dedcbc8ba";
    String DB_USER = "be932bb0361058";
    String DB_PASSWORD = "38a03779";
     Connection conn = null;
     Statement st;
     PreparedStatement ps = null;
     Class.forName(DB_DRIVER);
     conn = DriverManager.getConnection(DB_HOST, DB_USER, DB_PASSWORD);
     st = conn.createStatement();
     st.executeUpdate("delete from admin where adminId ='"+ id +"'");
     response.sendRedirect("admin-user.jsp");
	
	
}
catch (Exception e){
	
}
%>