<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.PreparedStatement" %>
<%@page import="java.sql.Connection" %>
<%@page import="java.sql.DriverManager" %>
<%@page import="java.sql.Statement" %>
<%@page import="java.sql.ResultSet" %>
<!DOCTYPE html>
<html>
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
                                <li><a href="admin-home.jsp">Home</a></li>
                                <li><a href="admin-about.jsp">About</a></li>
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
	
	<!-- bodypage -->
	<br>	
	<div class="container">
	<h2 align="center">List of Admin Details</h2>
	<div class="container">
    <div align="center">
         <a href="admin-user-add.jsp" class="btn btn-primary">Add New User</a>
    </div>

<table class="table table-bordered table-striped table-hover" style="padding:10px">
   <thead>
       <tr>
         <th class="text-center">ID</th>
         <th class="text-center">Email</th>
         <th class="text-center">Name</th>
         <th class="text-center">Phone Number</th>
         <th class="text-center">Address</th>
         <th class="text-center">Supervisor</th>
         <th class="text-center">Action</th>
        </tr>
    </thead>
    <tbody>

       <%
       String DB_DRIVER = "com.mysql.jdbc.Driver";
	     String DB_HOST = "jdbc:mysql://us-cdbr-east-05.cleardb.net:3306/heroku_2dc6a5dedcbc8ba";
	     String DB_USER = "be932bb0361058";
	     String DB_PASSWORD = "38a03779";
       Connection conn = null;
       Statement st;
       Class.forName(DB_DRIVER);
       conn = DriverManager.getConnection(DB_HOST, DB_USER, DB_PASSWORD);
       st = conn.createStatement();
       ResultSet rs1=st.executeQuery("select * from admin order by adminId asc");
       while(rs1.next()){
       %>
       <tr>
         <td><%=rs1.getString("adminId")%></td>
         <td><%=rs1.getString("adminEmail")%></td>
         <td><%=rs1.getString("adminName")%></td>
         <td><%=rs1.getString("adminPhoneNum")%></td>
         <td><%=rs1.getString("adminAddress")%><br>
         <%=rs1.getString("adminPostcode")%>
         <%=rs1.getString("adminCity")%>, <%=rs1.getString("adminState")%>
         </td>
         
         <td><%=rs1.getString("supervisorId")%></td>
         <td class="text-center">
           <a href='admin-user-edit.jsp?id=<%=rs1.getString("adminId")%>' class="btn btn-warning">Edit</a>
           <a href='admin-user-delete.jsp?id=<%=rs1.getString("adminId")%>' class="btn btn-danger">Delete</a>
         </td>
        </tr>
        <%
       }
        %>
    </tbody>
</table>
    </div>    
    </div>
    <!-- footer -->
    <div class="footer">
    <br>
    <p>G Icons 2021</p>
    
    </div>
</body>
</html>