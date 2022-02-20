<%@page import="java.sql.DriverManager" %>
<%@page import="java.sql.ResultSet" %>
<%@page import="java.sql.Statement" %>
<%@page import="java.sql.Connection" %>
<%
String email = request.getParameter("email");
String password = request.getParameter("password");
if("email".equals(email) && "password".equals(password)){
	session.setAttribute("email", email);
	response.sendRedirect("admin-home.jsp");
}
else
{
	int z=0;
	int adminId;
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
	       String data = "select * from admin where adminEmail='"+email+"'and adminPassword ='" + password + "'";
	       res = stat.executeQuery(data);
	       while(res.next())
	       {
	    	   z=1;
	    	   session.setAttribute("email",email);
	    	   session.setAttribute("adminId",res.getString("adminId"));
	    	   response.sendRedirect("admin-home.jsp");
	       }
	       if(z==0)
	    	   response.sendRedirect("admin-login.jsp?msg=notexist");
	}
	catch(Exception e)
	{
		response.sendRedirect("admin-login.jsp?msg=invalid");	
	}
}
%>
