import java.io.IOException;
import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
@WebServlet("/RegisterServlet")
public class Register extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String nm=req.getParameter("name");
		
		String phn=req.getParameter("phn");
		Long mbn=Long.parseLong(phn);
		
		String addr=req.getParameter("addr");
		
		HttpSession session=req.getSession();
		String qty=(String) session.getAttribute("QTY");
		int Quantity=Integer.parseInt(qty);
		
		String bkid=(String)session.getAttribute("BKID");
		
//		String DTD= req.getParameter("dtd");
//		Date date=Date.valueOf(DTD);
		
		int totalprice=(int)session.getAttribute("TPrice");
		
		System.out.println(nm+" "+mbn+" "+addr+" "+qty+" "+bkid+" "+totalprice);
		
	
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			System.out.println("Driver Loaded");
			
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/bookshopee", "root", "root");
			System.out.println("Connection Success");
			
			PreparedStatement pstm=con.prepareStatement("insert into customer1(Customer_Name,Phone,Address,Qty,Book_ID,Order_Date,TotalPrice)values(?,?,?,?,?,CURDATE(),?)");
			pstm.setString(1, nm);
			pstm.setLong(2, mbn);

			pstm.setString(3, addr);

			pstm.setInt(4, Quantity);

			pstm.setString(5, bkid);

//			pstm.setDate(6, date);

			pstm.setInt(6, totalprice);

			
			int i=pstm.executeUpdate();
			
			
			if(i!=0)
			{
				System.out.println("Record Inserted");
				
			}
			else
			{
				System.out.println("Error");
				
			}
			resp.sendRedirect("ThankYouPage.jsp");

			
		}
		catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
