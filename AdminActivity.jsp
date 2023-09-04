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
	<%
	String uname=(String)session.getAttribute("un");
	%>
	<h1>Admin Activity Page</h1>
	<h3><a href="AddBook.jsp">Add Book</a><br><br></h3>
	<h3><a href="index2.jsp">Update Book</a><br><br></h3>
	<h3><a href="AllBookdetails.jsp">All Book Details</a><br><br></h3>
	<h3><a href="AllOrders.jsp">All Orders</a><br><br></h3>
</div>
</body>
</html>