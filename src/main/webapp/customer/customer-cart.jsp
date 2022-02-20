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
String custEmail = session.getAttribute("custEmail").toString();
String id = session.getAttribute("id").toString(); 
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
         <h2 style="font-color: black " align="center">My Cart</h2>
         <br>
         </div>
         <table>
        <thead>
          <% 
          
          double total=0;
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
		       ResultSet rs5=st.executeQuery("select sum(cartTotalPrice) from cart where cust_id='"+id+"'");
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
            <th >Product</th>
            <th >Name</th>
            <th >Price</th>
            <th >Quantity</th>
            <th >Sub Total</th>
            <th >Remove <i class='fas fa-trash-alt'></i></th>
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
		       ResultSet rs3=st.executeQuery("select * from product p inner join cart c on p.productId=c.product_Id where cust_Id ='" + id + "'");
        while (rs3.next())
        {
        %> 
       
          <tr>
            <td><img src="../image-product/<%=rs3.getString("productImage") %>" width="150px" height="150px"/></td>
            <td><%=rs3.getString("productName")%></td>
            <td>RM <%=rs3.getString("cartPrice")%></td>
            <td><a href="inc-dec-quantity.jsp?productId=<%= rs3.getString("productId") %>&cartQuantity=inc"><i class='fas fa-plus-circle'></i></a><%=rs3.getString("cartQuantity")%><a href="inc-dec-quantity.jsp?productId=<%= rs3.getString("productId") %>&cartQuantity=dec"><i class='fas fa-minus-circle'></i></a></td>
            <td>RM <%=rs3.getString("cartTotalPrice")%></td>
            <td><a href="remove-cart.jsp?productId=<%= rs3.getString("productId") %>">Remove <i class='fas fa-trash-alt'></i></a></td>
       
           <%
        }
        }
        
       catch(Exception e)
       {
    	   System.out.println(e);
       }
        %>        
           </tr>
<tfoot align="center">
<tr > 
<td></td>
<td></td>
<td></td>
<td></td>
<td><b>Total: RM <%out.println(total); %></b></td>
<td style="background-color:#5fc214"><a href="customer-pickup.jsp"><b>Proceed Order </b><i class="fa fa-arrow-circle-right fa-1x"></i></a> </td>
</tr>
</tfoot>

          </tbody>
    </table>
       
    <!-- footer -->
    <div class="footer">
    <br>
    <p>G Icons 2021</p>
    
    </div>
</body>
</html>