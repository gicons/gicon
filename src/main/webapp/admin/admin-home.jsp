<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
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
                                <li><a href=" admin-contact.jsp">Contact</a></li>
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
	<div class="container">
         
<h1 style="color:#177245" align="center">Welcome Admin</h1>
        <br>
        <img src="../images/giantt.jpg" width="100%" class="center"> &nbsp; 

<p style="text-indent: 30px">Admins maintain websites for a variety of customers thus helping them to maximize their online presence. Essential responsibilities of a Admin are determining web system specifications, performing system monitoring, developing system access, installing software updates, and monitoring expenses.</p>

<br><br><br>
  
      <div class="container">
      <div class="row">
      <div class="column">
      <img src="../images/user2.png" width="60" height="60">
        <h2>Manage Account</h2>
		<a href="admin-account.jsp" class="button">Click Here</a>
	</div>
     
      
      <div class="column">
      <img src="../images/product.png" width="60" height="60">
        <h2>Manage Products</h2>
		<a href="admin-all-product.jsp" class="button">Click Here</a>
      </div>
      
      <div class="column">
      <img src="../images/order.png" width="60" height="60">
        <h2>Manage Order</h2>
		<a href="admin-order.jsp" class="button">Click Here</a>
      </div>
      </div>
      </div>
               
    </div>    
    
    <!-- footer -->
    <div class="footer">
    <br>
    <p>G Icons 2021</p>
    
    </div>
</body>
</html>