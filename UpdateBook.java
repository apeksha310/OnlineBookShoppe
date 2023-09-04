import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/UpdateBookServlet")
public class UpdateBook extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session1=req.getSession();
		String bkid=(String)session1.getAttribute("BKID");//get session 
		System.out.println("Clicked Book_ID in Update Servlet: "+bkid);
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			System.out.println("Driver Loaded in Welcome Page");
			
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/BookShopee", "root", "root");
			System.out.println("Connection Sucessfull");
			
			Statement stm=con.createStatement();
			ResultSet rs=stm.executeQuery("select * from Books");
			
			HttpSession session=req.getSession();
			session.setAttribute("rs4", rs);
			
			PreparedStatement pstm=con.prepareStatement("select * from books where Books_ID=?");
			pstm.setString(1, bkid);
			
			ResultSet rs1=pstm.executeQuery();
			session.setAttribute("rs5", rs1);
			if(bkid.equals("false")){
			resp.sendRedirect("updatebook2.jsp");
			}else
			{
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


