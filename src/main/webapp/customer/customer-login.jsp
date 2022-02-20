<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>


<%@page import="java.sql.DriverManager" %>
<%@page import="java.sql.ResultSet" %>
<%@page import="java.sql.Statement" %>
<%@page import="java.sql.Connection" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    
    <title>Giant Hypermarket | Login</title>
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">   
    <script src='https://kit.fontawesome.com/a076d05399.js'></script>
  	<link rel="stylesheet" href="../style/style.css" />
    <style>
        *{
            margin:0;
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
            height: 100vh;
            display: flex;
        }

        .text, .box{
            margin-top: 45vh;
            flex: 1;
        }

        .text{
            margin-left: 10%;
            margin-top: 120px;
            margin-bottom: auto;
            font-weight: 300px;
        }

        .box{
            margin-left: 25%;
            margin-top: 120px;
            margin-bottom: auto;

        }

        .text h1{
            font-size: 70px;
            color: #32cd32;
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
            padding: 25px;
            color: #fff;
            box-sizing: border-box;
            display: flex;
            flex-direction: column;
            width: 350px;
            border-radius: 5px;
        }

        input{
            margin: 20px 0;
            padding: 10px;
            background: transparent;
            border: none;
            outline: none;
            color: #fff;
        }

        .username, .password{
            border-bottom: 1px solid #fff;
        }

        ::placeholder{
            color: white;
            opacity: 0.7;
        }

        .button{
            background: transparent;
            border: 1px solid #fff;
            color: #fff;
            font-size: 18px;
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

    <main>
        <div class="background">
            <div class="text">
                <h1>Login</h1>
                <p>No Account? <a href="customer-signup.jsp">Register</a></p>
            </div>
            <div class="box">
			    <form class="form" action="login-action.jsp" method="post">
                    <input type="text" class="custEmail" name="custEmail" placeholder="Email" required>
                    <input type="password" class="password" name="password" placeholder="Password" required>
                    <input type="submit" class="button" value="Login">
                </form>
            </div>
            
            <%
            	String msg=request.getParameter("msg");
            	if("notexist".equals(msg))
            	{
            %>
            <h1>Incorrect Username or Password</h1>
            <% } %>
            <% if("invalid".equals(msg))
            { %>
            <h1>Something Went Wrong!. Try Again!</h1>
            <%} %>
            
        </div>
    </main>
</body>
</html>