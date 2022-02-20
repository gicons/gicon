
<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@page import="java.sql.DriverManager" %>
<%@page import="java.sql.ResultSet" %>
<%@page import="java.sql.Statement" %>
<%@page import="java.sql.PreparedStatement" %>
<%@page import="java.sql.Connection" %>
<!DOCTYPE html>
<html>
<head>
  <title>G-Icon Pickup System</title>
      <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    <!--user icon-->
    <script src='https://kit.fontawesome.com/a076d05399.js'></script>
		<link rel="stylesheet" href="../style/style.css" />
</head>
<style>
input[type=email], select {
  width: 100%;
  padding: 12px 20px;
  margin: 8px 0;
  display: inline-block;
  border: 1px solid #ccc;
  border-radius: 4px;
  box-sizing: border-box;
}

input[type=text], select {
  width: 100%;
  padding: 12px 20px;
  margin: 8px 0;
  display: inline-block;
  border: 1px solid #ccc;
  border-radius: 4px;
  box-sizing: border-box;
}

input[type=password], select {
  width: 100%;
  padding: 12px 20px;
  margin: 8px 0;
  display: inline-block;
  border: 1px solid #ccc;
  border-radius: 4px;
  box-sizing: border-box;
}

input[type=tel], select {
  width: 100%;
  padding: 12px 20px;
  margin: 8px 0;
  display: inline-block;
  border: 1px solid #ccc;
  border-radius: 4px;
  box-sizing: border-box;
}

input[type=submit] {
  width: 100%;
  background-color: #32cd32;
  color: white;
  margin: 8px 0;
  border: none;
  border-radius: 4px;
  cursor: pointer;
  display:inline-block;
}

input[type=submit]:hover {
  background-color: #45a049;
}

.btn {
    text-align:center;
    margin:8px 0;
}
</style>
<body>
<% String email = session.getAttribute("email").toString();%>
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
                <div class="container">
                    <h2 align="center">Add Admin Details</h2>
                    <div align="center">
					   <a href="admin-user.jsp" class="btn btn-primary">Back</a>
					   </div>
					
					<div class="form-container">
						<form action="admin-user-add-action.jsp" method="post">						
				
								<div class ="form-group">
								     <label>Name</label><br>
								     <input type="text" name="adminName" placeholder="Enter Name">
								</div>
								<div class ="form-group">
								     <label>Phone Number</label><br>
								     <input type="text"  name="adminPhoneNum" placeholder="Enter Phone Number">
								</div>
								<div class ="form-group">
								     <label>Email</label><br>
								     <input type="email" name="adminEmail" placeholder="Enter Email">
								</div>
								
								<div class ="form-group">
								     <label>Address</label><br>
								     <input type="text" name="adminAddress" placeholder="Enter Address">
								</div>
								<div class ="form-group">
								     <label>Postcode</label><br>
								     <input type="number" name="adminPostcode" placeholder="Enter Address">
								</div>
								<div class ="form-group">
								     <label>City</label><br>
								     <input type="text" name="adminCity" placeholder="Enter Address">
								</div>
								<div class ="form-group">
								     <label>State</label><br>
									<select name="adminState" id="adminState" required="required">
			    					<option value="">--Select State--</option>
			    					<option value="Pahang">Pahang</option>
			    					<option value="Perak">Perak</option>
			    					<option value="Terengganu">Terengganu</option>
			    					<option value="Kelantan">Kelantan</option>
			    					<option value="Perlis">Perlis</option>
			    					<option value="Selangor">Selangor</option>
			    					<option value="Negeri Sembilan">Negeri Sembilan</option>
			    					<option value="Johor">Johor</option>
			    					<option value="Kedah">Kedah</option>
			    					<option value="Pulau Pinang">Pulau Pinang</option>
			    					<option value="Melaka">Melaka</option>
			    					<option value="Sabah">Sabah</option>
			    					<option value="Sarawak">Sarawak</option>
			    					<option value="Kuala Lumpur">Kuala Lumpur</option>
			    					<option value="Labuan">Labuan</option>
			    					<option value="Putrajaya">Putrajaya</option>
			    					
			                    	</select>					
			                    </div>
								<div class ="form-group">
								     <label>Gender</label><br>
								     <input type="radio" name="adminGender" value="Female" > Female
								     <br>
								     <input type="radio" name="adminGender" value="Male" > Male
								</div>
								<div class ="form-group">
								     <label>Password</label><br>
								     <input type="password" name="adminPassword" placeholder="Enter Password">
								</div>
								<div class ="form-group">
								     <label>Supervisor Id</label><br>
								     <input type="number" name="supervisorId" placeholder="Enter Password">
								</div>
								<div align="center">
								<button type="submit" class="btn btn-primary">Add</button>
								</div>
						</form>
					
					   </div>
					</div>
</body>
</html>