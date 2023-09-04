<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<link rel="stylesheet"
href="StyleSheet.css">
<body>

	<header class="headercss">
	<nav>
	<a class="header1" href="HomePage.jsp">Home</a>
	<a class="header1" href="About.jsp">About</a>
	<a class="header1" href="Contact.jsp">Contact</a>
	<a class="header1" href="Help.jsp">Help</a>
	<a class="header1" href="HomePage.jsp">Logout</a>
	</nav>
	</header>

<div class="main" align="center">
<form action="WelcomePage.jsp">
<h1>
Shopping Cart For Book Store</h1>
Your Order has been confirmed.<br>
The book shall be delivered within 2 days.<br><br>
Thank You for Online Book Shopping.<br><br> 

 <input type="submit" class="btn" value="Continue Shopping">
			<input type="button" class=btn onclick="window.location.replace('Login.jsp')"value="Log Out">
</form>
</div>
</body>
</html>