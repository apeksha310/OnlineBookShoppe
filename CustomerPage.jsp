<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<link rel="stylesheet" href="StyleSheet.css">
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
	<h1>Shopping Cart For Book Store</h1>
	<form action="./RegisterServlet">
	<table class="tblform">
	<tr><th>Customer Name:</th><td> <input type="text" name="name"></td></tr>
	<tr><th>Address:</th><td><input type="text" name="addr"></td></tr>
	<tr><th>Phone No.:</th><td><input type="number" name="phn"></td></tr>
	</table>
	Your Order Details:
	<table border="2" class=tbl>
		<tr class=thead>
			<th>Book Name</th>
			<th>Author</th>
			<th>Price</th>
			<th>Quantity</th>
			<th>Total Price</th>
		
		</tr>
		
		<%
		try
		{
		ResultSet rs=(ResultSet)session.getAttribute("rs3");
		
		String qty=(String)session.getAttribute("QTY");
		
		int quantity=Integer.parseInt(qty);
		//System.out.println("Quantity in Customer page: "+quantity);
		
		int price,totalprice;
		while(rs.next())
		{
			price=rs.getInt("Price");
		%>
		<%  System.out.println("Book Details in Customer Page");%>
		
		<tr>
			<td><%=rs.getString("Books_name")%></td>
			<td><%=rs.getString("Author") %></td>
			<td><%=price %></td>
			<td><%=quantity %></td>
			<td><%=totalprice=quantity * price%></td>
		</tr>
		<%
			session.setAttribute("TPrice", totalprice);
		%>
		</table>
		<br><br>
	
	<input type="submit" class=btn value="Confirm">
	<input type="button" class=btn onclick="window.location.replace('index.jsp')"value="Cancel"><br><br>
	</form>
		<%
		
		}
		
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		%>
</div>
</body>
</html>