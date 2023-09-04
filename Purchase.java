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
@WebServlet("/PurchaseServlet")
public class Purchase extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {		
		HttpSession session=req.getSession();
		String bkid=(String)session.getAttribute("BKID");//get session 
		System.out.println("Clicked Book_ID in Purchase Servlet: "+bkid);
	
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			System.out.println("Driver Loaded in purchase page");
			
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/bookshopee", "root", "root");
			System.out.println("Connection success in purchase page");
		
			PreparedStatement pstm=con.prepareStatement("select * from books where Books_ID=?");
			pstm.setString(1, bkid);
			
			ResultSet rs=pstm.executeQuery();
			session.setAttribute("rs2", rs);
			
			resp.sendRedirect("PurchasePage.jsp");
			//while(rs.next())
			//{
				//System.out.println(rs.getString("Books_Name"));
				//System.out.println(rs.getString("author"));
				//System.out.println(rs.getString("price"));
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
