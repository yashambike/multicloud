/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com;

import com.mysql.jdbc.Connection;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class owner_del extends HttpServlet {


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        ServletContext context = request.getSession().getServletContext();
     String name=(String)context.getAttribute("encode");
     File f=new File(name);
     boolean a=f.delete();
     if(a==false)
     {
         f.deleteOnExit();
     }
PrintWriter out=response.getWriter();
try {
           
          
            Class.forName("com.mysql.jdbc.Driver");
            Connection cn = (Connection)DriverManager.getConnection("jdbc:mysql://localhost:3306/multicloud", "root","root");
            PreparedStatement ps = cn.prepareStatement("delete * from request");

             
               
              
              ps.execute();
            

        } catch (Exception e)
        {
            out.println("<html><body>"+ e +"</body></html>");
        }        
RequestDispatcher rq=request.getRequestDispatcher("ownerdelete.jsp");
        rq.include(request, response);
 out.println("<html><body>"+a+"</body></html>");

    }

    
}
