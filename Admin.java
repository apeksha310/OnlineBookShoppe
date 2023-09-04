import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
@WebServlet("/AdminServlet")
public class Admin extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String un=req.getParameter("uname");
		String p=req.getParameter("pass");
		System.out.println("Form Data: "+un+" "+p);
		
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			System.out.println("Driver loaded in login page");
			
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/bookshopee","root","root");
			System.out.println("Connection Successfull in login page");
			
			PreparedStatement pstm1=con.prepareStatement("select * from User where uname=?");
			
			pstm1.setString(1, un);
			
			ResultSet rs1=pstm1.executeQuery();
			String uname=null;
			String password=null;
			
			while(rs1.next())
			{
				uname=rs1.getString("uname");
				password=rs1.getString("password");
			}
		
		if(un.equalsIgnoreCase("admin")&&p.equalsIgnoreCase("admin@1234"))
		{
			String name="admin";
			System.out.println("Welcome User: "+name);
			
			HttpSession session=req.getSession();
			session.setAttribute("un", name);
			resp.sendRedirect("AdminActivity.jsp");
		}
		else if(un.equals(uname)&&p.equals(password)) {
			resp.sendRedirect("index.jsp");
		}
		else
		{
			System.out.println("Error");
			resp.sendRedirect("AdminLogin.jsp");
		}
			
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
