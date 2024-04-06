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


public class user_del extends HttpServlet {


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        ServletContext context = request.getSession().getServletContext();
     String name=(String)context.getAttribute("encode");
     String filecontent=(String)context.getAttribute("filecontent");
     String m="d:\\upload\\"+filecontent;
     File f=new File(name);
     File n=new File(m);
     boolean a=f.delete();
      boolean b=n.delete();
     if(a==false&&b==false)
     {
         f.deleteOnExit();
         n.deleteOnExit();
     }
PrintWriter out=response.getWriter();
try {
           
          
            Class.forName("com.mysql.jdbc.Driver");
            Connection cn = (Connection)DriverManager.getConnection("jdbc:mysql://localhost:3306/hybrid", "root","root");
            PreparedStatement ps = cn.prepareStatement("delete from request");

             
               
              
              ps.execute();
            

        } catch (Exception e)
        {
            out.println("<html><body>"+ e +"</body></html>");
        }       
RequestDispatcher rq=request.getRequestDispatcher("userhome.jsp");
        rq.include(request, response);
 out.println("<html><body>"+a+"</body></html>");

    }

    
}
