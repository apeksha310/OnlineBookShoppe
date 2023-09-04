<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
	String bkid= request.getParameter("BKID");//BKID-getting from welcomePage.jsp
    System.out.println("Clickable Book_ID in Book.jsp= "+bkid);

    session.setAttribute("BKID", bkid);//bkid-set into session BKID- session name 
	response.sendRedirect("./PurchaseServlet");
%>
</body>
</html>