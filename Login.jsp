<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Login page</title>
</head>
<link rel="StyleSheet" href="StyleSheet.css" >
<body>
	<header class="headercss">
	<nav>
	<a class="header1" href="HomePage.jsp">Home</a>
	<a class="header1" href="About.jsp">About</a>
	<a class="header1" href="Contact.jsp">Contact</a>
	<a class="header1" href="Help.jsp">Help</a>
	<a class="header1" href="Login.jsp">Login</a>
	</nav>
	</header>
	
	<div class="main">
		<h1> Login Page</h1>
		<form action="./AdminServlet" method="post">
		Enter User Name:<input type="text" name="uname"><br><br>
		Enter Password:<input type="password" name="pass"><br><br>
						<input type="submit" class=btn value="Login">	
						<input type="button" class=btn onclick="window.location.replace('RegisterUser.jsp')"value="Register">	
		
		</form>
		</div>`
</body>
</html>