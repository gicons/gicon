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
	<link rel="stylesheet" href="../style/style-contact.css" />
	
	<script>
function myFunction() {
  alert("Thank you, your data has been submitted!");
}
</script>
</head>
<body>
<% String custEmail = session.getAttribute("custEmail").toString();%>
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
	<div class="container" display="flex">
        <div style="text-align:center">
    <h1>Contact Us</h1> <br>
    <p style="color: #5fc214;">We are always ready to help. Any inquiries, send us a message:</p>
  </div>
  
  <div class="row">
    <div class="column">
      <img src="../images/giant1.jpg" style="width:100%"> 
	   <h2 style="color: #5fc214;">Address</h2>
	   <p>GCH Retail (M) Sdn Bhd. <br> Mezzanine Floor Giant Hypermarket Shah Alam Stadium Lot 2, Persiaran Sukan, Seksyen 13, 40100 Shah Alam, Selangor Darul Ehsan</p> <br>
	   <h2 style="color: #5fc214;">Phone Number</h2>
	   <p>+603-7723 9393</p> <br>
	   <h2 style="color: #5fc214;">Email</h2>
	   <p>customersupport@dairy-farm.com.my</p>
    </div>
	 
    <div class="column">
      <form action="" method="POST">
	    <label for="name">Name</label>
        <input type="text" id="name" name="name" placeholder="Your Name...">
        <label for="email">Email</label>
        <input type="text" id="email" name="email" placeholder="Your Email Address...">
		<label for="subject">Subject</label>
        <textarea id="subject" name="subject" placeholder="How Can We Help?" style="height:170px"></textarea>
        <input type="submit" value="Submit" onclick="myFunction()">
      </form>
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