import java.io.IOException;
import java.rmi.ConnectIOException;
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

import com.mysql.cj.Session;
@WebServlet("/UpdateBookStep2Servlet")
public class UpdateBookStep2 extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {		
		HttpSession session=req.getSession();
		String bkid=(String)session.getAttribute("BKID");//get session 
		System.out.println("Clicked Book_ID in Purchase Servlet: "+bkid);
		
		String bn=req.getParameter("bname");
		String a=req.getParameter("author");
		int p=Integer.parseInt(req.getParameter("price"));
		String s=req.getParameter("Available");
		
		System.out.println("Data:"+bkid+" "+bn+" "+a+" "+p+" "+s);
	
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			System.out.println("Driver Loaded in purchase page");
			
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/bookshopee", "root", "root");
			System.out.println("Connection success in purchase page");
		
			
			PreparedStatement pstm=con.prepareStatement("Update books set Books_Name=?,Author=?,Price=?,Status=? where Books_ID=?");
			pstm.setString(1,bn );
			pstm.setString(2, a);
			pstm.setInt(3, p);
			pstm.setString(4, s);
			pstm.setString(5, bkid);
			
			int i=pstm.executeUpdate();
			
			if(i!=0)
			{
				System.out.println("Record Updated");
				resp.sendRedirect("index2.jsp");
			}
			else
			{
				System.out.println("Error");
				resp.sendRedirect("UpdateBook.jsp");
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
