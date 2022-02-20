<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@page import="java.sql.DriverManager" %>
<%@page import="java.sql.ResultSet" %>
<%@page import="java.sql.Statement" %>
<%@page import="java.sql.PreparedStatement" %>
<%@page import="java.sql.Connection" %>

<!DOCTYPE html>
<html>
<head>
<style>
      table,
      table tr,td,th{
        border: 0px solid #cccccc;
      }
      tr {
        height: 50px;
        width: 80px;
        text-align: center;
        vertical-align: middle;
      }
</style>
    <meta charset="UTF-8">
    <title>Giant Hypermarket | Pick-Up</title>
    <!--google font-->
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">

    <!--user icon-->
    <script src='https://kit.fontawesome.com/a076d05399.js'></script>
	<link rel="stylesheet" href="../style/style.css" />
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
                                <li><a href="customer-contact.jsp">Contact</a></li>
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
	<% 
	String id = session.getAttribute("id").toString();
	%>
	<br>
	 <div align="center">
         <h2 style="font-color: black " align="center">My Order Summary</h2>
         <br>
     </div>
     <div>
     <table>
     <tr>
     <td><b>Email : </b><%out.println(custEmail);%> <td>
     </tr>
     <%       
          try{
        	  String DB_DRIVER = "com.mysql.jdbc.Driver";
     	     String DB_HOST = "jdbc:mysql://us-cdbr-east-05.cleardb.net:3306/heroku_2dc6a5dedcbc8ba";
     	     String DB_USER = "be932bb0361058";
     	     String DB_PASSWORD = "38a03779";
		       Connection conn = null;
		       PreparedStatement ps = null;
		       Class.forName(DB_DRIVER);
		       conn = DriverManager.getConnection(DB_HOST, DB_USER, DB_PASSWORD);
		       Statement st=conn.createStatement();
		       ResultSet rs=st.executeQuery("select * from orders where custId = '"+id+"'");
						      
		       while (rs.next()){          
     %>
     <tr>
     <td><b>Order Pickup Date: </b><%=rs.getString("orderPickupDate") %><td>
     </tr>
     <tr>
     <td><b>Order Pickup Time: </b><%=rs.getString("orderPickupTime") %><td>
     </tr>
     <tr>
     <td><b>Pickup Store: </b><%=rs.getString("orderPickupStore") %><td>
     <%
     }
     }
     catch(Exception e)
     {
      System.out.println(e);
     }
     %>
     </tr>
     </table>
     <table>
     <tr>
<th>Product Name</th>
<th>Quantity</th>
<th>Price </th>
<th>Sub Total </th>
</tr>
     <% 
     try{
    	 String DB_DRIVER = "com.mysql.jdbc.Driver";
	     String DB_HOST = "jdbc:mysql://us-cdbr-east-05.cleardb.net:3306/heroku_2dc6a5dedcbc8ba";
	     String DB_USER = "be932bb0361058";
	     String DB_PASSWORD = "38a03779";
	       Connection conn = null;
	       PreparedStatement ps = null;
	       Class.forName(DB_DRIVER);
	       conn = DriverManager.getConnection(DB_HOST, DB_USER, DB_PASSWORD);
	       Statement st=conn.createStatement();
	       ResultSet rs=st.executeQuery("select *from product inner join cart on product.productId=cart.product_id inner join customer on cart.cust_id=customer.custId inner join orders on customer.custId=orders.custId where customer.custId ='"+id+"'");
	       while (rs.next()){          
     %>
<tr>
<td><%=rs.getString("productName") %></td>
<td><%=rs.getString("cartQuantity") %></td>
<td>RM <%=rs.getString("cartPrice") %></td>
<td>RM <%=rs.getString("cartTotalPrice") %></td>
<%
     }
     }
     catch(Exception e)
     {
      System.out.println(e);
     }
     
%>
     </tr>
     </table>
<table>
 <% 
          String total=null;
          String orderId=null;
          try{
        	  String DB_DRIVER = "com.mysql.jdbc.Driver";
     	     String DB_HOST = "jdbc:mysql://us-cdbr-east-05.cleardb.net:3306/heroku_2dc6a5dedcbc8ba";
     	     String DB_USER = "be932bb0361058";
     	     String DB_PASSWORD = "38a03779";
		       Connection conn = null;
		       PreparedStatement ps = null;
		       Class.forName(DB_DRIVER);
		       conn = DriverManager.getConnection(DB_HOST, DB_USER, DB_PASSWORD);
		       Statement st=conn.createStatement();
		       ResultSet rs=st.executeQuery("select sum(cartTotalPrice),orders.orderId from product inner join cart on product.productId=cart.product_id inner join customer on cart.cust_id=customer.custId inner join orders on customer.custId=orders.custId where customer.custId ='"+id+"'");
		       while (rs.next()){
		    	   total=rs.getString(1);
		    	   orderId=rs.getString(2);
		    	   
		       }
          }
          catch(Exception e)
          {
        	  System.out.println(e);
          }
          
          %>
          <tr>
          <td><b>Total: RM <%out.println(total); %></b> <br><a href="make-payment.jsp?orderId=<%out.println(orderId);%>&total=<%out.println(total);%>" class="btn btn-success"><b>Make Payment </b><i class="fa fa-arrow-circle-right fa-1x"></i></a></td>
          </tr>
</table>          
     </div>
    <!-- footer -->
    <div class="footer">
    <br>
    <p>G Icons 2021</p>
    
    </div>
</body>
</html>