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
        border: 1px solid #cccccc;
      }
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
      input:read-only {
  background-color: #bfbfbf;
}
    </style>
<head>
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
 			 <a href="customer-status.jsp">Order</a>
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
	<br>
         
  <div align="center">
  <h2 style="font-color: black " align="center">Make Payment</h2>
  <br>
  </div>
  <div class="form-container">				
				    <form class="details" action="make-payment-action.jsp" method="post">
					<label>Customer Email: <span></span></label><br>
					<input type="text" name="custEmail" readonly class="form-control" placeholder="" value="${custEmail}">
					<label>Order ID: <span></span></label><br>
					<input type="text" class="form-control" name="orderId" value="<%= request.getParameter("orderId") %>" readonly >
					<label>Payment: <span></span></label><br>
					<input type="text" name="payment" readonly class="form-control" placeholder="" value="SILA BAYAR SEMASA PICKUP">
			        <label>Amount: <span></span></label><br>
					<input type="text" class="form-control" name="amount" value="<%= request.getParameter("total") %>" readonly>
					<div align="center">
                     <button class="btn btn-success"><b>Make Payment </b><i class="fa fa-arrow-circle-right fa-1x"></i></button>
					</div>
					</form>
				</div>	
    <!-- footer -->
    <div class="footer">
    <br>
    <p>G Icons 2021</p>
    </div>

    
</body>
</html>