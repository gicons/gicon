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
        border: 0px solid #cccccc;
      }
      tr {
        height: 50px;
        width: 80px;
        text-align: center;
        vertical-align: middle;
      }

* {
  box-sizing: border-box;
}

.column {
  float: left;
  width: 33.33%;
  padding: 5px;
}

/* Clearfix (clear floats) */
.row::after {
  content: "";
  clear: both;
  display: table;
}

 .button {
        background-color: #177245;
        border: none;
        color: white;
        padding: 20px 34px;
        text-align: center;
        text-decoration: none;
        display: inline-block;
        font-size: 20px;
        margin: 4px 2px;
        cursor: pointer;
      }
</style>


</head>
<body>
<% 
String email = session.getAttribute("email").toString();
String orderId=request.getParameter("orderId");
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
                                <li><a href=" admin-home.jsp">Home</a></li>
                                <li><a href=" admin-about.jsp">About</a></li>
                                <li><%out.println(email); %><i class='fas fa-user-alt'></i>
                                <li><a href="../index.jsp">Logout<i class="fas fa-sign-out-alt"></i></a>
                                </li> 
							 </ul>
                        </nav>
     			</div>
		</div>
	</div>	
	
	<!-- nav bar menu -->
	<div class="navbar">
 		 <a href="admin-order.jsp">Order</a>
  		 <a href="admin-account.jsp">Account</a>
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
		<div align="center">
		<h2 style="font-color: black " align="center">Order Details &nbsp;#<%out.println(orderId);%></h2>   
		
		
		<a href="admin-order.jsp" class="btn btn-primary">Back</a>
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
	       ResultSet rs8=st.executeQuery("select *from product inner join cart on product.productId=cart.product_id inner join customer on cart.cust_id=customer.custId inner join orders on customer.custId=orders.custId where orderId='"+orderId+"'");
	       while (rs8.next()){          
     %>
<tr>
<td><%=rs8.getString("productName") %></td>
<td><%=rs8.getString("cartQuantity") %></td>
<td>RM <%=rs8.getString("cartPrice") %></td>
<td>RM <%=rs8.getString("cartTotalPrice") %></td>
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
        
		</div>
   
    
    <!-- footer -->
    <div class="footer">
    <br>
    <p>G Icons 2021</p>
    
    </div>
</body>
</html>