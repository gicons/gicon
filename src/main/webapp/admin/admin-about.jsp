<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html>
<style>
img {
  display: block;
  margin-left: auto;
  margin-right: auto;
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
		
	<!-- bodypage -->
	<br>		
	<div class="container" style="allign:center;">
        <h2 style="font-color: black " align="center">ABOUT US</h2>
        <br>	
<img src="../images/giant1.jpg" width="30%" class="center"> &nbsp; 

<p style="text-indent: 30px">Giant Hypermarket Pick-Up System is a pick-up system that covers all the products in Giant such as groceries, fresh food, frozen and others. This system was developed for 
all people in Penang, Malaysia who are interested in shopping with Giant. This system is created to make it easier for customers to buy online and set the time to pick up 
their orders. Customers can collect the order at a dedicated Pick-up counter at the stores Mall entrance. The customers can collect their orders within booking slots selected 
from the system. The customers need to choose the pick-up time and date to pick up their orders. So, the customer can get and pick up the orders at their own time.
</p>
         <br><br>
    </div>    
    
    <!-- footer -->
    <div class="footer">
    <br>
    <p>G Icons 2021</p>
    
    </div>
</body>
</html>