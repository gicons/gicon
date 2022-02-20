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
	<style>
	      table,
      table tr,td,th{
        border: 1px solid #cccccc;
      }
      th{background-color:#000;color:#fff}
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
      .back{
      border:1px solid white;
      font-family:inherit;
      font-weight:light;
      }
    </style>
	
</head>
<body>
<% 
String custEmail= session.getAttribute("custEmail").toString();
%>
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
                                <li><a href="customer-home.jsp">Home</a></li>
                                <li><a href="customer-about.jsp">About</a></li>
                                <li><a href="customer-cart.jsp">My Cart<i class='fas fa-cart-arrow-down'></i></a>
                                  <li><%out.println(custEmail); %><i class='fas fa-user-alt'></i>
                                  <li><a href="../index.jsp">Logout<i class="fas fa-sign-out-alt"></i></a>
                                </li>                               
                            </ul>
                        </nav>
     	  			</div>
		</div>
	</div>	
	
	<!-- nav bar menu -->
	<div class="navbar">
 		 <a href="customer-order.jsp">Order</a>
  		 <a href="customer-account.jsp">Account</a>
  		<div class="dropdown">
    		<button class="dropbtn">Product
    		 <i class="fa fa-caret-down"></i>
   		    </button>
    		<div class="dropdown-content">
    		 <a href="customer-all-product.jsp">All Product</a>
			 <a href="customer-grocery.jsp">Grocery</a>    		
    		 <a href="customer-fresh.jsp">Fresh</a>
    		 <a href="customer-frozen.jsp">Frozen</a>
  		  	</div>
 	 	</div>
	</div>
		
	<!-- bodypage -->
	<div class="container">
       
        <% 
    	String id = session.getAttribute("id").toString();

        try{
        	   String orderId;
        	   String DB_DRIVER = "com.mysql.jdbc.Driver";
      	     String DB_HOST = "jdbc:mysql://us-cdbr-east-05.cleardb.net:3306/heroku_2dc6a5dedcbc8ba";
      	     String DB_USER = "be932bb0361058";
      	     String DB_PASSWORD = "38a03779";
		       Connection conn = null;
		       PreparedStatement ps = null;
		       ResultSet rs;
		       conn = DriverManager.getConnection(DB_HOST, DB_USER, DB_PASSWORD);
		       Statement st=conn.createStatement();
		       ResultSet rs3=st.executeQuery("select * from orders where custId = '"+id+"'");
		       
     
		while (rs3.next() )
        {
			orderId=rs3.getString("orderId");
			session.setAttribute("orderId",rs3.getString("orderId")); 
	%> 
        
        <div align="center">
		<br>
         <h2 style="font-color: black " align="center">View Order &nbsp;#<%=rs3.getString("orderId")%></h2>
        <a href="customer-status.jsp" class="btn btn-primary">Back</a>
         </div>
      
      	<table>     
	  	<tr>
	    <th scope="row" style="width:30%;text-align:center">Order ID</th>
	    <td><%=rs3.getString("orderId")%></td>
	  </tr>
	  <tr>
	    <th scope="row" style="width:30%;text-align:center">Email </th>
	    <td><%out.println(custEmail);%></td>
	  </tr>
	  <tr>
	    <th scope="row" style="width:30%;text-align:center">Order Status</th>
	    <td><b><%=rs3.getString("orderStatus")%></b></td>
	  </tr>
	  <tr>
	    <th scope="row" style="width:30%;text-align:center">Pickup Time</th>
	    <td><%=rs3.getString("orderPickupTime")%></td>
	  </tr>
	  <tr>
	    <th scope="row" style="width:30%;text-align:center">Pickup Date</th>
	    <td><%=rs3.getString("orderPickupDate")%></td>
	  </tr>
	
            <% 
            ResultSet rs4=st.executeQuery("select * from payment where orderId ='"+orderId+"'"); 
            while(rs4.next()){
            %>
            
            	  <tr>
	    <th scope="row" style="width:30%;text-align:center">Amount (RM)</th>
	    <td>RM <%=rs4.getString("amount")%></td>
	  </tr>
	  <tr>
	    <th scope="row" style="width:30%;text-align:center">Order Details</th>
	    <td><a href="view-order-details.jsp?<%=rs4.getString("orderId") %>" class="btn btn-primary">Order Details</a></td>
	    
	  </tr>
	  
                          
             <%} %>    
           <%
        }
        }
       catch(Exception e)
       {
    	   System.out.println(e);
       }
        
        %>
   </table>
   	<br>
    </div>    
    
    <!-- footer -->
    <div class="footer">
    <br>
    <p>G Icons 2021</p>
    
    </div>
</body>
</html>