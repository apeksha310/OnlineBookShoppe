import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
@WebServlet("/RegisterUserServlet")
public class RegisterUser extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String fn=req.getParameter("fname");
		String ln=req.getParameter("lname");
		String g=req.getParameter("gender");
		String dob=req.getParameter("dob");
		String add=req.getParameter("address");
		long m=Long.parseLong(req.getParameter("mob"));
		String un=req.getParameter("uname");
		String p=req.getParameter("pass");
		System.out.println("Register User Form Data: "+fn+" "+ln+" "+g+" "+dob+" "+add+" "+m+" "+un+" "+p);
		
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			System.out.println("Driver Loaded");
			
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/bookshopee", "root","root");
			System.out.println("Connection Successful");
			
			PreparedStatement pstm=con.prepareStatement("insert into user(fname,lname,gender,dob,address,Mobile,uname,password)values(?,?,?,?,?,?,?,?)");
			pstm.setString(1, fn);
			pstm.setString(2, ln);
			pstm.setString(3, g);
			pstm.setString(4, dob);
			pstm.setString(5, add);
			pstm.setLong(6, m);
			pstm.setString(7, un);
			pstm.setString(8, p);
		
			
			int i=pstm.executeUpdate();
			if(i!=0)
			{
				System.out.println("Registerd user successfully");
				resp.sendRedirect("Login.jsp");
			}
			else
			{
				System.out.println("Error");
				resp.sendRedirect("RegisterUser.jsp");
			}
			con.close();
		} catch (ClassNotFoundException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		} catch (SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
	}

}