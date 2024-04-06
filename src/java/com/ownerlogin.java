package com;
import java.sql.ResultSet;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class ownerlogin extends HttpServlet
{
    @Override
    public void doPost(HttpServletRequest req,HttpServletResponse res)throws ServletException,IOException
	{
		PrintWriter pw=res.getWriter();
		res.setContentType("text/html");

		String s1=req.getParameter("uname");
		String s2=req.getParameter("pass");

     try {
    Class.forName("com.mysql.jdbc.Driver");
    Connection cn = (Connection)DriverManager.getConnection("jdbc:mysql://localhost:3306/multicloud", "root","root");
    PreparedStatement ps = cn.prepareStatement("select * from own where name=? and password=?");

                ps.setString(1,s1);
                ps.setString(2,s2);
                
                ResultSet rs=ps.executeQuery();
                int i=0;
                while (rs.next())
                {
                 i++;
                }
            if(i>0)
            {
             HttpSession session = req.getSession();
             session.setAttribute("owner",s1);
             RequestDispatcher rd =  req.getRequestDispatcher("owner_home.jsp");
             rd.include(req, res);
            }
            else
            {
                pw.println("<script type=\"text/javascript\">");  
                 pw.println("alert('Please enter correct username and password..');");
                   pw.println("</script>");
                   RequestDispatcher rd =  req.getRequestDispatcher("ownerlogin.jsp");
                   rd.include(req, res);
            }
        } catch (Exception e)
        {
            pw.println("<html><body>"+ e +"</body></html>");
        }
    }
}