package com;

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

public class RegisterServlet extends HttpServlet
{
    @Override
    public void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException
    {
        String name = request.getParameter("name");
        String password = request.getParameter("pass");
        String email = request.getParameter("email");
       
        PrintWriter pw = response.getWriter();

        try{
    Class.forName("com.mysql.jdbc.Driver");
    Connection cn = DriverManager.getConnection("jdbc:mysql://localhost:3306/multicloud", "root","root");
    PreparedStatement ps = cn.prepareStatement("insert into user(name,password,email) values(?,?,?)");

                    ps.setString(1,name);
                    ps.setString(2,password);
                    ps.setString(3,email);
                   

            if(ps.execute())
            {
             
            }
            else
            {
                 pw.println("<script type=\"text/javascript\">");  
                 pw.println("alert('Registration Successfull...');");
                   pw.println("</script>");
           
                 RequestDispatcher rd =  request.getRequestDispatcher("userlogin.jsp");
                 rd.include(request, response);
            }
        }catch(Exception e)
        {
            pw.println("<html><body>"+ e +"</body></html>");
        }
    }
}