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

img {
  display: block;
  margin-left: auto;
  margin-right: auto;
}	
      
</style>

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
     
    <h1 style="color:#177245" align="center">Giant Hypermarket</h1>
        <br>
        <img src="../images/productgiant.jpg" width="100%" class="center"> &nbsp; 

<p style="color:#177245" align="center">Everyday Low Prices!</p>

<br><br><br>

        <h1 style="color:#177245" align="center">About Us</h1>
        <br>
        <img src="../images/giantt.jpg" width="50%" class="center"> &nbsp; 
        <img src="../images/giantnew.jpg" width="50%" class="center"> &nbsp; 
         
         <br><br>

<p style="text-indent: 30px" align="center">Giant operates in the retail industry. Giant mission is to offer a wide variety of products at the lowest possible prices. Their slogan Low Prices Every Day, Great Variety, and Great Value conveys the company mission to the community. Giant Hypermarket is a major chain of supermarkets and retailers in Malaysia.</p>
<br>
<p style="text-indent: 30px"  align="center">The story of Giant started in 1944 when our very first provision store opened in Sentul Pasar, Malaysia and expanded with the opening of the Teng Minimarket Centre in Bangsar in 1974. Today, Giant is Malaysia's top mass market retailer of everyday items, with over 46 stores located across Peninsular Malaysia. A leader in the retail industry, Giant has grown to become one of the country's most beloved brands.</p>
<br><br><br>

        <h1 style="color:#177245" align="center">Our Products</h1>
        <br>
        <img src="../images/catalog.png" width="30%" class="center"> &nbsp; 
        <img src="../images/Giantfresh.jpg" width="30%" class="center"> &nbsp; 

<p style="text-indent: 30px"  align="center">We always serve quality products to our customers. Convenience at your fingertips. Shop online with us and we'll deliver groceries to your doorstep.</p>
 <br><br><br>

        <h1 style="color:#177245" align="center">Contact Us</h1>
        <br>
        <img src="../images/contact.jpg" width="30%" class="center"> &nbsp;
        <br>
        <p style="text-indent: 30px"  align="center">If you have any inquiries, you can contact us. We are always ready to help you.</p>
        
    
    
    </div>    
    
    <!-- footer -->
    <div class="footer">
    <br>
    <p>G Icons 2021</p>
    
    </div>
</body>
</html>