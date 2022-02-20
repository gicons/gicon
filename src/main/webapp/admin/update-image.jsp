<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@page import="java.sql.DriverManager" %>
<%@page import="java.sql.ResultSet" %>
<%@page import="java.sql.Statement" %>
<%@page import="java.sql.PreparedStatement" %>
<%@page import="java.sql.Connection" %>
<%@ page import="java.io.*" %>

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
</head>
<body>
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
                                <li><a href="../index.jsp">Logout</a>
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
	
					
	<!-- body page -->
	  <br>
	  <center><h2>Update Product Image</h2></center>
	  <br>
	  <div class="grid-container">
	  <div class="form-container">
      <form class="details" action="" method="post">	  
		<%
		 try {
		String a = request.getParameter("productImage");
	    String u = request.getParameter("u");
	     
	    String DB_DRIVER = "com.mysql.jdbc.Driver";
	     String DB_HOST = "jdbc:mysql://us-cdbr-east-05.cleardb.net:3306/heroku_2dc6a5dedcbc8ba";
	     String DB_USER = "be932bb0361058";
	     String DB_PASSWORD = "38a03779";

		 Connection conn = null;
		 Statement stat = null;
		 ResultSet res = null;
	     PreparedStatement stmt = null;
		 Class.forName(DB_DRIVER);
		 
		 conn = DriverManager.getConnection(DB_HOST, DB_USER, DB_PASSWORD);
		 stat = conn.createStatement();
		 
	     String data = "select * from product where productId='"+u+"'";
	     res = stat.executeQuery(data);
		
	   
	    while(res.next()){
	    	 	 
	    	 if(a!=null)
		 		{
		 		   	String query = "UPDATE product SET productImage=? where productId='"+u+"'";
		 		
		 		   	stmt = conn.prepareStatement(query);
		 		   	
		 		   	stmt.setString(1,a);
		 			stmt.executeUpdate();

		 		   	response.sendRedirect("admin-all-product.jsp?update-images-success");
		 	     }
		 	
	    
		 %>
		
		Product Id:<br>
		<input type="text" readonly="readonly" name="productId" value='<%=res.getString("productId")%>'>
		Product Name:<br>
		<input type="text" name="productName" value='<%=res.getString("productName")%>'>
		Current Product Image:<br>
		<img id="output" src="../image-product/<%=res.getString("productImage") %>" width="100" height="100">	<br>	
		<input id="demo-file" name="productImage" type="file" accept="image/*" onchange="document.getElementById('output').src = window.URL.createObjectURL(this.files[0])">
		<br><br>
													  			
		<input type="reset" value="Reset">
		<input type="submit" value="Update Image">
		
		<% 
		}
		}
		catch (Exception e)
		{
		 	System.out.println(e);
		}

		%>
		
		</form>
   	 </div>
   	 </div>
     <!-- footer -->
    <div class="footer">
   		 <br><p>G Icons 2021 &copy; All Rights Reserved</p>
    </div>
    
</body>
</html>

