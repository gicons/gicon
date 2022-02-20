<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@page import="java.sql.DriverManager" %>
<%@page import="java.sql.ResultSet" %>
<%@page import="java.sql.Statement" %>
<%@page import="java.sql.PreparedStatement" %>
<%@page import="java.sql.Connection" %>


<!DOCTYPE html>
<html>
<style>
	.grid-container {
	  display: grid;
	  grid-template-columns: auto auto auto auto auto;
	  padding: 10px;
		}
		
	.grid-item {
	  background-color: #EFEFEF;
	  border: 1px solid #000;
	  padding: 20px;
	  font-size: 13px;
	  text-align: center;
	  margin: 30px 20px;
	  padding: 5px 5px;
	  width: 220px;
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
                                <li><a href="customer-contact.jsp">Contact</a></li>
                                <li><a href="customer-cart.jsp">My Cart<i class='fas fa-cart-arrow-down'></i></a>
                                <li><a href="../index.jsp"><%out.println(custEmail); %><i class='fas fa-user-alt'></i></a>
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
		<%
		
		String id = session.getAttribute("id").toString(); 
		String product_id= request.getParameter("productId");
		int quantity=1;
		double product_price=0.0;
		double product_total=0.0;
		double cart_total=0.0;
		int cart_id=0;
		int z=0;
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
		       ResultSet rs1=st.executeQuery("select *from product where productId='"+product_id+"'");
		       while(rs1.next())
		       {
		    	   product_price=rs1.getDouble(3);
		    	   product_total=product_price;
		       }
		       ResultSet rs2=st.executeQuery("select *from cart where product_id='"+product_id+"' and cust_id='"+id+"'");
		       while(rs2.next()) 
		       {
		    	   cart_total=rs2.getDouble(5);
		    	   cart_total=cart_total + product_total;
		    	   quantity=rs2.getInt(4);
		    	   quantity=quantity + 1;
		    	   z=1;
		       }
		       if(z==1)
		       {
		    	   st.executeUpdate("update cart set cartTotalPrice='"+cart_total+"',cartQuantity='"+quantity+"' where product_id='"+product_id+"' and cust_id='"+id+"'");
		    	   response.sendRedirect("customer-all-product.jsp?msg=Exist");
		    	   
		       }
		       if(z==0)
		       {
		    	   PreparedStatement ps1=conn.prepareStatement("insert into cart(cust_id,product_id,cartPrice,cartQuantity,cartTotalPrice) values(?,?,?,?,?)");
		    	   ps1.setString(1,id);
		    	   ps1.setString(2,product_id);
		    	   ps1.setDouble(3,product_price);
		    	   ps1.setInt(4,quantity);
		    	   ps1.setDouble(5, product_total); 
		    	   ps1.executeUpdate();
		    	   response.sendRedirect("customer-all-product.jsp?msg=Added");
		       }
		}
		catch (Exception e){
			System.out.println(e);
			response.sendRedirect("customer-all-product.jsp?msg=Invalid");
		}
		%>
		</body>
		</html>