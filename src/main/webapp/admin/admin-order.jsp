<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.Connection" %>
<%@page import="java.sql.DriverManager" %>
<%@page import="java.sql.ResultSet" %>
<%@page import="java.sql.Statement" %>
<%@page import="java.sql.PreparedStatement" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Giant Hypermarket | Pick-Up</title>
    <!--google font-->
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">

    <!--user icon-->
    <script src='https://kit.fontawesome.com/a076d05399.js'></script>
	<link rel="stylesheet" href="../style/style.css" />
	<link rel="stylesheet" href="https://cdn.datatables.net/1.11.4/css/jquery.dataTables.min.css">
	<style>
	      table,
      table tr,td,th{
        border: 1px solid #cccccc;
      }
      th{
      background-color:#000;color:#fff;}
      tr {
        height: 50px;
        width: 80px;
        text-align: center;
        vertical-align: middle;
      }
      input{
      	border: none;
      	text-align: center;
      }
      input.name{
      	width: 500px;
      }
      .status{
      width:auto;
      color: #fff;
      background-color: green;
      font-size:11px;
      }
      .cancel{
      width:auto;
      color: #fff;
      background-color: orange;
            font-size:11px;
      
      }
    </style>
	
</head>
<body>
<% String email = session.getAttribute("email").toString();%>
<!-- header -->
    <div class="header">
        <div class="c1">
                <div class="navigationbar">
                        <div class="logo">
                            <img src="../images/Giant_logo.png" width="85px"> &nbsp;
                        </div>
                        <div class="title">
						     <h1>Giant Hypermarket Pick-Up System</h1>                            
                        </div>
                        <nav>
                            <ul>
                                <li><a href=" admin-home.jsp">Home</a></li>
                                <li><a href=" admin-about.jsp">About</a></li>
                                <li><%out.println(email); %><i class='fas fa-user-alt'></i>
                                <li><a href="../index.jsp">Logout<i class="fas fa-sign-out-alt"></i></a>
                                </li> 
							 </ul>
                        </nav>
     					<!--cart-->                        
      			</div>
		</div>
	</div>	
	
	<!-- nav bar menu -->
	<div class="navbar">
		<div class="dropdown">
 	 		<button class="dropbtn">Order
    		 <i class="fa fa-caret-down"></i>
   		    </button>
	 	 	<div class="dropdown-content">
	    		 <a href="admin-order.jsp">All Order</a>
	    		 <a href="admin-status.jsp">Delete Order</a>
	  		</div>
  		</div>  		 <a href="admin-account.jsp">Account</a>
  		<div class="dropdown">
    		<button class="dropbtn">Product
    		 <i class="fa fa-caret-down"></i>
   		    </button>
    		<div class="dropdown-content">
    		 <a href="admin-add-product.jsp">New Product</a>
			 <a href=" admin-all-product.jsp">All Product</a>    		
    		 <a href="admin-grocery.jsp">Grocery</a>
    		 <a href="admin-fresh.jsp">Fresh</a>
    		 <a href="admin-frozen.jsp">Frozen</a>
  		  	</div>
 	 	</div>
 	 	<div class="dropdown">
 	 		<button class="dropbtn">Admin
    		 <i class="fa fa-caret-down"></i>
   		    </button>
	 	 	<div class="dropdown-content">
	    		 <a href="admin-user.jsp">Admin List</a>
	    		 <a href="admin-user-add.jsp">Add Admin</a>
	  		</div>
  		</div>
	</div>
		
	<!-- bodypage -->
	<div class="container" style="padding: 10px;">
         
		<div align="center">
		<br>
		<h2 style="font-color: black " align="center">List of All Order</h2>
		</div>
		 
        <table id="example" class="table">
        <thead>
          <% 
          	  double total=0.0;
	          try{
	        	  String DB_DRIVER = "com.mysql.jdbc.Driver";
	     	     String DB_HOST = "jdbc:mysql://us-cdbr-east-05.cleardb.net:3306/heroku_2dc6a5dedcbc8ba";
	     	     String DB_USER = "be932bb0361058";
	     	     String DB_PASSWORD = "38a03779";
			       Connection conn = null;
			       PreparedStatement ps = null;
			       ResultSet rs;
			       Class.forName(DB_DRIVER);
			       conn = DriverManager.getConnection(DB_HOST, DB_USER, DB_PASSWORD);
			       Statement st=conn.createStatement();
			       ResultSet rs5=st.executeQuery("select sum(cartTotalPrice) from cart_item");
			       while (rs5.next()){
			    	   total=rs5.getDouble(1);
			       }
	          }
	          catch(Exception e)
	          {
	        	  System.out.println(e);
	          }
          %>
          <tr>
            <th >Order ID</th>
            <th >Amount</th>
            <th >Cust Name</th>
            <th >Status</th>
            <th >Pickup Time</th>
            <th >Pickup Date</th>
            <th >Admin Inch.</th>
            <th >Order Details</th>
            <th >Update Status</th>
          </tr>
        </thead>
        <tbody>
        <% 
        try{
        	String DB_DRIVER = "com.mysql.jdbc.Driver";
   	     String DB_HOST = "jdbc:mysql://us-cdbr-east-05.cleardb.net:3306/heroku_2dc6a5dedcbc8ba";
   	     String DB_USER = "be932bb0361058";
   	     String DB_PASSWORD = "38a03779";
		       Connection conn = null;
		       PreparedStatement ps = null;
		       ResultSet rs;
		       Class.forName(DB_DRIVER);
		       conn = DriverManager.getConnection(DB_HOST, DB_USER, DB_PASSWORD);
		       Statement st=conn.createStatement();
		       ResultSet rs3=st.executeQuery("select * from orders o inner join customer c on o.custId=c.custId inner join payment p on p.orderId=o.orderId");
		       
		       
     
			while (rs3.next())
	        {
	        	%> 
	          	<tr>
	            <td><%=rs3.getString("orderId")%></td>
	            <td>RM <%=rs3.getString("amount")%></td>
	            <td><%=rs3.getString("custName")%></td>
	            <td><b><%=rs3.getString("orderStatus")%></b></td>
	            <td><%=rs3.getTime("orderPickupTime")%></td>
	            <td><%=rs3.getDate("orderPickupDate")%></td>
	            <td><%=rs3.getString("adminId")%></td>
	            <td><a href="admin-order-details.jsp?orderId=<%= rs3.getString("orderId") %>" class="btn btn-primary">View</a></td>
	            <td>
	            <a href="admin-update-status.jsp?orderId=<%= rs3.getString("orderId") %>" class="btn status">Completed</a>
	            <a href="admin-update-cancelled.jsp?orderId=<%= rs3.getString("orderId") %>"class="btn cancel">Cancelled</a>
	            
	            </td>
	            </tr>
	            <%
		     }

	   }
       catch(Exception e)
       {
    	   System.out.println(e);
       }
        %>

          </tbody>
    </table>

<%
String DB_DRIVER = "com.mysql.jdbc.Driver";
String DB_HOST = "jdbc:mysql://us-cdbr-east-05.cleardb.net:3306/heroku_2dc6a5dedcbc8ba";
String DB_USER = "be932bb0361058";
String DB_PASSWORD = "38a03779";
Connection conn = null;
PreparedStatement ps = null;
ResultSet rs;
Class.forName(DB_DRIVER);
conn = DriverManager.getConnection(DB_HOST, DB_USER, DB_PASSWORD);
Statement st=conn.createStatement();
ResultSet rs7=st.executeQuery("select sum(amount) as total from orders o inner join customer c on o.custId=c.custId inner join payment p on p.orderId=o.orderId");

while(rs7.next()){
	String grandtotal = rs7.getString("total");
	%>
	<h3>Grand Total Sales RM: <%= grandtotal %></h3>
	<%
}
%>
<div align="center">
<button class="btn btn-primary" onclick="print()">Print</button>
</div>

         
    </div>    
    
    <!-- footer -->
    <div class="footer">
    <br>
    <p>G Icons 2021</p>
    
    </div>
    <script src="https://code.jquery.com/jquery-3.5.1.js"></script>
    <script src="https://cdn.datatables.net/1.11.4/js/jquery.dataTables.min.js"></script>
    <script>
	    $(document).ready(function() {
	        $('#example').DataTable();
	    } );
    </script>
</body>
</html>