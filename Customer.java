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
@WebServlet("/CustomerServlet")
public class Customer extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session=req.getSession();
		String bkid=(String)session.getAttribute("BKID");
		
		String qty=req.getParameter("QTY");
		
		session.setAttribute("QTY", qty);
		
		//System.out.println("Book_ID in Customer Servlet: "+bkid);
		
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			System.out.println("Driver Loaded in Customer Page");
			
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/bookshopee", "root", "root");
			System.out.println("Connection Success.");
			
			PreparedStatement pstm=con.prepareStatement("select * from books where Books_ID=?");
			
			pstm.setString(1, bkid);
			
			ResultSet rs=pstm.executeQuery();			
			session.setAttribute("rs3", rs);
			
			resp.sendRedirect("CustomerPage.jsp");
		
		//while(rs.next())
		//{
			//System.out.println(rs.getString("Books_name"));
			//System.out.println(rs.getString("Author"));
			//System.out.println(rs.getInt("Price"));
			//System.out.println(rs.getInt("Quantity"));
		//}
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}

}
