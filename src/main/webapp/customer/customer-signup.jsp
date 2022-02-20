<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    
    <title>Giant Hypermarket | Sign Up</title>
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet"><script src='https://kit.fontawesome.com/a076d05399.js'></script>
    <link rel="stylesheet" href="../style/style.css" />
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
            background: url(../images/grocery.jpg) no-repeat;
            background-size: cover;
            height: 120vh;
            display: flex;
        }


        .text{
        
        	margin-left: 10%;
            margin-top: 120px;
            margin-bottom: auto;
            font-weight: 300px;
 
        }

        .box{
            margin-left: 41%;
            margin-top: 50px;
            margin-bottom: auto;
            
        }
    
        .text h1{
            font-size: 70px;
            color:#32cd32;
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
            width: 350px;
        }

        input{
            padding: 5px;
            background: transparent;
            color: #fff;
            border:none;
			margin: 12px 0;
            width:100%;

        }
		input[type="text"],input[type="password"]{
            border-bottom: 1px solid #fff;
            outline: none;
        }
        textarea{
            width: 250px;
            background: transparent;
            color: #fff;
        }

        .username, .password, .fullname, .email, .phone, .address{
            border-bottom: 1px solid #fff;
            border-width: thin;
            
        }

        ::placeholder{
            color:white;
            opacity: 0.7;
        }

        .button{
            background: transparent;
            border: 1px solid #fff;
            color: #fff;
            font-size: 15px;
        }

        .button:hover{
            background: #fff;
            color: #000;
        }


    </style>
</head>
<body>

     <div class="header">
        <div class="c1">
                <div class="navigationbar">
                        <div class="logo">
                            <img src="../images/Giant_logo.png" width="85px"> &nbsp;
                        </div>
                        <div class="title">
						     <h1>Giant Hypermarket Pick-Up System</h1>
                            
                        </div>
                    </div>
                    </div>
                    </div>
                    

    <!--sign up form-->
    <div class="background">
        <div class="text">
            <h1>Register</h1>
            <p> Have Account? <a href="customer-login.jsp">Login</a></p>
        </div>
        <br>
        <div class="box">
            <form class="form" action="signup-action.jsp" method="post"><br>
                <input type="text" class="fullname" name="custName" placeholder="Full Name" size="30" required>
                <br><br>
                <input type="text" class="email" name="custEmail" placeholder="Email" size="30" required>
                <br><br>
                <input type="password" class="password" name="custPassword" placeholder="Password" size="30" required>
				<br><br>
                <input type="password" class="password" name="custConfirmPassword" placeholder="Confirm Password" size="30" required>
                <br>
                <input type="submit" class="button" value="Register" onclick="myFunction()">
                <input type="reset" class="button" value="Reset">
            </form>
        </div>
    </div>
    
    <script>
	function myFunction() {
	  alert("Successfully register !");
	}
	</script>
   
</body>
</html>