<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<link rel="StyleSheet" href="StyleSheet.css" >
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

<div class="main">
<h1>Registration Form
</h1>
<form action="./RegisterUserServlet" method="post">
<table class="tblform">
<tr>
<td>Enter First Name : <input type="text" name="fname"></td></tr>
<tr><td>Enter Last Name : <input type="text" name="lname"></td></tr>
<tr><td>Gender : <input type="radio" name="gender">Male
		<input type="radio" name="gender">Female</td></tr>
<tr><td>DOB : <input type="date" name="dob"></td></tr>
<tr><td>Address : <input type="text" name="address"></td></tr>
<tr><td>Mobile No. : <input type="number" name="mob"></td></tr>
<tr><td>Enter User Name : <input type="text" name="uname"></td></tr>
<tr><td>Enter Password : <input type="password" name="pass"></td></tr>

	<tr><td><input type="submit" class=btn value="Register">
			<input type="button" class=btn onclick="window.location.replace('Login.jsp')"value="Cancel"></td></tr>
</table>
</form>
</div>
</body>
</html>