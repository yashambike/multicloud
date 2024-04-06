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


public class owner_pdownload extends HttpServlet {


   
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        PrintWriter pw=response.getWriter();
           String id=request.getParameter("pd");
           String a = null,b = null;
        try {
           
          
            Class.forName("com.mysql.jdbc.Driver");
            Connection cn = (Connection)DriverManager.getConnection("jdbc:mysql://localhost:3306/multicloud", "root","root");
            PreparedStatement ps = cn.prepareStatement("update request set rdownload=? where id=?");

                ps.setString(1,"Yes");
               
                ps.setString(2,id);
              
               int s= ps.executeUpdate();
                pw.println("<script type=\"text/javascript\">");  
                 pw.println("alert('Granted Download Access');");
                   pw.println("</script>");
                   
               PreparedStatement ps1 = cn.prepareStatement("select *from request  where id=?");
               ps1.setString(1, id);
              ResultSet rs=ps1.executeQuery();
              while(rs.next())
              {
                  a=rs.getString("clientid");
                  System.out.println("client id="+a);
                 }
              PreparedStatement ps2 = cn.prepareStatement("select *from user  where id='"+a+"'");
      
              ResultSet rs1=ps2.executeQuery();
              while(rs1.next())
              {
                  b=rs1.getString("email");
                  System.out.println("Emailid id="+b);
              } Getmail m=new Getmail();
                 String otp=m.randomNum(3);
                  System.out.println("OTP"+otp);
                  m.domail(b, otp);
              
               PreparedStatement pos = cn.prepareStatement("update request SET otp=? where clientid='"+a+"'");

                    

                    System.out.println("otp=" + otp);
            
                 pos.setString(1, otp);

              pos.executeUpdate();
                  
             RequestDispatcher rd =  request.getRequestDispatcher("owner_home.jsp");
             rd.include(request, response);
           

        } catch (Exception e)
        {
            pw.println("<html><body>"+ e +"</body></html>");
            e.printStackTrace();
        }
    }


}
