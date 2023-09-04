import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
@WebServlet("/AllOrderServlet")
public class AllOrders extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			System.out.println("Driver Loaded in Welcome Page");
			
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/BookShopee", "root", "root");
			System.out.println("Connection Sucessfull");
			
			Statement stm=con.createStatement();
			ResultSet rs=stm.executeQuery("select * from customer1");
			
			HttpSession session=req.getSession();
			session.setAttribute("rs1", rs);
			resp.sendRedirect("AllOrderedDetails.jsp");
			
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	}

