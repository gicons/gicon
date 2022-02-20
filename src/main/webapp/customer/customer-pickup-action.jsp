<%@page import="java.sql.DriverManager" %>
<%@page import="java.sql.ResultSet" %>
<%@page import="java.sql.Statement" %>
<%@page import="java.sql.Connection" %>
<%@page import="java.sql.PreparedStatement" %>
<%@page import = "java.util.Date, java.sql.Time, java.sql.Timestamp,java.text.ParseException,java.text.SimpleDateFormat"%>
<%
String orderPickupDate = request.getParameter("orderPickupDate");
String orderPickupTime = request.getParameter("orderPickupTime");
String custId = request.getParameter("custId");
String store = request.getParameter("pickupStore");
String productId= request.getParameter("productId");
	try
	{
		String DB_DRIVER = "com.mysql.jdbc.Driver";
	     String DB_HOST = "jdbc:mysql://us-cdbr-east-05.cleardb.net:3306/heroku_2dc6a5dedcbc8ba";
	     String DB_USER = "be932bb0361058";
	     String DB_PASSWORD = "38a03779";
	       Connection conn = null;
	       ResultSet rs;
	       Class.forName(DB_DRIVER);
	       conn = DriverManager.getConnection(DB_HOST, DB_USER, DB_PASSWORD);
	       Statement st=conn.createStatement();
	       PreparedStatement ps = conn.prepareStatement("INSERT INTO orders (orderStatus, orderPickupStore, orderPickupDate, orderPickupTime, custId) VALUES (?,?,?,?,?)");
	       ps.setString(1,"Preparing");
	       ps.setString(2,store);
	       ps.setString(3,orderPickupDate);
	       ps.setString(4,orderPickupTime);
	       ps.setString(5,custId);
	       ps.executeUpdate();
	       response.sendRedirect("customer-summary.jsp");
	}
	catch(Exception e)
	{
		System.out.println(e.getMessage());
		response.sendRedirect("customer-home.jsp?msg=invalid");	
	}

%>