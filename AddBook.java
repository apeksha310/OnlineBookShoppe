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
@WebServlet("/AddBookServlet")
public class AddBook extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String bookid=req.getParameter("bid");
		String bookname=req.getParameter("bname");
		String bookauth=req.getParameter("author");
		String bookprice=req.getParameter("price");
		String bookstatus=req.getParameter("available");
	
		
		System.out.println(bookid+" "+bookname+" "+bookauth+" "+bookprice+" "+bookstatus);
		
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			System.out.println("Driver Loaded");
			
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/bookshopee", "root","root");
			System.out.println("Connection Successful");
			
			PreparedStatement pstm=con.prepareStatement("insert into books(Books_ID,Books_Name,Author,Price,Status)values(?,?,?,?,?)");
			pstm.setString(1, bookid);
			pstm.setString(2, bookname);
			pstm.setString(3, bookauth);
			pstm.setString(4, bookprice);
			pstm.setString(5, bookstatus);
		
			
			int i=pstm.executeUpdate();
			if(i!=0)
			{
				System.out.println("Record Inserted");
				resp.sendRedirect("AdminActivity.jsp");
			}
			else
			{
				System.out.println("Error");
				resp.sendRedirect("AddBook.jsp");
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
