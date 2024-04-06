/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com;

import com.mysql.jdbc.Connection;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Radhika
 */
public class UpdateUserPass1 extends HttpServlet {
  public void doPost(HttpServletRequest req,HttpServletResponse res)throws ServletException,IOException
	{
		PrintWriter pw=res.getWriter();
		res.setContentType("text/html");

		String username = req.getParameter("uname");
		String oldpass = req.getParameter("oldpass");
               String newpass=req.getParameter("newpass");
               String str="";

     try {
         
         
            Class.forName("com.mysql.jdbc.Driver");
            Connection cn = (Connection)DriverManager.getConnection("jdbc:mysql://localhost:3306/multicloud", "root","root");
            PreparedStatement ps1 = cn.prepareStatement("select* from user  where email=?");
            ps1.setString(1, username);
            ResultSet rs=ps1.executeQuery();
            while(rs.next())
            {
               str=rs.getString("email");
               if(username.equals(str))
               {
                   if(oldpass.equals(newpass))
                   {
                        PreparedStatement ps = cn.prepareStatement("update user set password=? where email=?");
                
                ps.setString(1,newpass);
                ps.setString(2, username);
                
           

              if(ps.execute())
            {
             RequestDispatcher rd =  req.getRequestDispatcher("changeUserPass.jsp");
             rd.include(req, res);
             pw.println("<html><body>Please try again..!</body></html>");
            }
            else
            {
                 pw.println("<script type=\"text/javascript\">");  
                 pw.println("alert('Password Changed');");
                   pw.println("</script>");
                
              RequestDispatcher rd =  req.getRequestDispatcher("userhome.jsp");
             rd.include(req, res);
           
                  }
                 }
              }
            }
           
        } catch (Exception e)
        {
            pw.println("<html><body>"+ e +"</body></html>");
        }
    }
     
}
