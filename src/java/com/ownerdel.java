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
import javax.servlet.http.HttpSession;


public class ownerdel extends HttpServlet {


   
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        PrintWriter pw=response.getWriter();
           String id=request.getParameter("did");
        System.out.println("Id is::"+id);
           String s = null;
           try {
           
          
            Class.forName("com.mysql.jdbc.Driver");
            Connection cn = (Connection)DriverManager.getConnection("jdbc:mysql://localhost:3306/multicloud", "root","root");
           
                   PreparedStatement ps1 = cn.prepareStatement("delete  from  file where fileid=?");
                      ps1.setString(1,id);
                     int i= ps1.executeUpdate();
                     if(i>0)
                     {
               pw.println("<script type=\"text/javascript\">");  
                 pw.println("alert('Deleted Successfully');");
                   pw.println("</script>");
               }
                     else
                     {
                          pw.println("<script type=\"text/javascript\">");  
                 pw.println("alert('File id not Present');");
                   pw.println("</script>");
              
                     }
             RequestDispatcher rd =  request.getRequestDispatcher("owner_home.jsp");
             rd.include(request, response);
          

        } catch (Exception e)
        {
            pw.println("<html><body>"+ e +"</body></html>");
        }
    }


}
