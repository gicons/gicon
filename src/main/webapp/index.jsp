<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    
    <title>Giant Hypermarket | Sign Up</title>
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet"><script src='https://kit.fontawesome.com/a076d05399.js'></script>
   	<link rel="stylesheet" href="style/style.css" />
   
    <style>
         *{
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            }   

        body{
            font-family: 'Poppins', sans-serif;
        }

        .header{
            background: radial-gradient(#fff, #32cd32);
        }

        .navigationbar{
            display: flex;
            align-items: center;
            padding: 20px;
        }
        
        nav{
            flex: 1;
            text-align: right;
        }

        nav ul{
            display: inline-block;
            list-style-type: none;
        }

        nav ul li{
            display: inline-block;
            margin-right: 20px;
        }

        a{
            text-decoration: none;
            color: #555;
        }


        p{
            color: #555;
        }

        .c1{
            max-width: 1300px;
            margin: auto;
            padding-left: 25px;
            padding-right: 25px;
        }

         .background{
            background: url(images/grocery.jpg) no-repeat;
            background-size: cover;
            height: 120vh;
            display: flex;
        }


        .text{
            font-weight: 300px;
            margin-top: 120px;
            margin-bottom: auto;
            margin-left: auto;
            margin-right: auto;
  			width: 50%;
  			border: 3px solid #32cd32;
  			border-radius: 50px;
  			padding: 10px;
  			text-align: center;
  			background-color: rgba(255, 255, 255, 0.78);
  			box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);
  			
        }
        
        
   		  .button {
		  background-color: #4CAF50; /* Green */
		  border-radius: 10px;
		  color: white;
		  padding: 16px 32px;
		  text-align: center;
		  text-decoration: none;
		  display: inline-block;
		  font-size: 16px;
		  margin: 10px 4px;
		  transition-duration: 0.4s;
		  cursor: pointer;
		  width:300px;
		}
		
		.button1 {
		  background-color: #32cd32; 
		  color: white; 
		}
		
		.button1:hover {
		  background-color: #000;
		  color: white;
		}

        .box{
            margin-top: 5vh;
            flex: 1;
            margin-left: 25%;
            font-size: 15px;
            
        }

    
        .text h1{
            font-size: 50px;
            color:#000;
            font-weight: 500;
            
        }

        .text p{
            font-size: 20px;
            color: rgb(105, 70, 70);
            font-weight: 400;
        }

        .text p a{
            color: rgb(105, 70, 70);
            font-weight: 700;
        }

        .form{
            background: rgb(105, 70, 70, 0.5);
            padding: 16px ;
            color: #fff;
            
            border-radius: 5px;
            width: 300px;
        }

        input{
           
            padding: 5px;
            background: transparent;
            
            color: #fff;
            
        }

        textarea{
            
            background: transparent;
            color: #fff;
        }

        .username, .password, .fullname, .email, .phone, .address{
            border-bottom: 1px solid #fff;
            border-width: thin;
            
        }

        ::placeholder{
            color:burlywood;
            opacity: 0.7;
        }

    </style>
</head>
<body>

     <div class="header">
        <div class="c1">
                <div class="navigationbar">
                        <div class="logo">
                            <img src="images/Giant_logo.png" width="85px"> &nbsp;
                        </div>
                        <div class="title">
						     <h1>Giant Hypermarket Pick-Up System</h1>
                       </div>
                </div>
         </div>
    </div>
                    

    <!--box-->
    <div class="background">
        <div class="text">
            <h1>Login As</h1>
			<a href="admin/admin-login.jsp" class="button button1">Admin</a> <br>
		   	<a href="customer/customer-login.jsp" class="button button1">Customer</a>

        </div>
    </div>
    
    
   
</body>
</html>