<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.mysql.cj.protocol.Resultset"%>
<%@page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Welcome Page</title>
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
<h2>All Ordered Details</h2><br>
<table border=1 class=tbl>
<tr class=thead>
	<th>Order_No</th>
	<th>Customer_Name</th>
	<th>Phone</th>
	<th>Address</th>
	<th>Quantity</th>
	<th>Book_ID</th>
	<th>Order_Date</th>
	<th>Total Price</th>
	
</tr>
<%
try {
	
	ResultSet rs=(ResultSet)session.getAttribute("rs1");
	System.out.println("Book details All Ordered Data Page");

	while(rs.next())
	{
%>
	<tr>
	<% //System.out.println(rs.getString("Books_ID"));%>
	<td><%= rs.getInt("Order_No") %></td>
	<td><%= rs.getString("Customer_Name")%></td>
	<td><%= rs.getLong("Phone") %></td>
	<td><%= rs.getString("Address")%></td>
	<td><%= rs.getInt("Qty") %></td>
	<td><%= rs.getString("Book_ID") %></td>
	<td><%= rs.getString("Order_Date") %></td>
	<td><%= rs.getInt("TotalPrice") %></td>
</tr>
<%
	}
} 
catch (Exception e) 
{

	e.printStackTrace();
}
%>
</table>

<input type="button" class=btn onclick="window.location.replace('AdminActivity.jsp')"value="Cancel"><br><br>

</div>
</body>
</html>