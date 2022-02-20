<%@page import="java.sql.DriverManager" %>
<%@page import="java.sql.ResultSet" %>
<%@page import="java.sql.Statement" %>
<%@page import="java.sql.Connection" %>
<%@page import="java.sql.PreparedStatement" %>
<%
String orderId = request.getParameter("orderId");
String amount = request.getParameter("amount");
String paymentName = request.getParameter("payment");


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
	       PreparedStatement ps = conn.prepareStatement("INSERT INTO payment(paymentName,amount,orderId) VALUES (?,?,LAST_INSERT_ID())");
	       ps.setString(1,paymentName);
	       ps.setString(2, amount);
	       ps.setString(3, orderId);
	       
	       ps.executeUpdate();
	       %>
	       <script>
	       	alert("Payment successfull");
	       	window.location.href = "customer-home.jsp";
	       </script>
	       <%
	       // response.sendRedirect("customer-home.jsp");
	}
	catch(Exception e)
	{
		System.out.println(e.getMessage());
		response.sendRedirect("customer-home.jsp?msg=invalid");	
	}

%>
