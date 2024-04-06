package com;

import java.io.IOException;
import java.io.PrintWriter;
import java.security.NoSuchAlgorithmException;
import java.security.SecureRandom;
import java.sql.ResultSet;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class UserloginServlet extends HttpServlet {

    @Override
    public void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String name = request.getParameter("uname");
        String pass = request.getParameter("pass");
        PrintWriter pw = response.getWriter();

        try {

            Class.forName("com.mysql.jdbc.Driver");
            Connection cn = DriverManager.getConnection("jdbc:mysql://localhost:3306/multicloud", "root", "root");
            PreparedStatement ps = cn.prepareStatement("select * from user where email=? and password=?");

            ps.setString(1, name);
            ps.setString(2, pass);

            ResultSet rs = ps.executeQuery();
            int i = 0;
            while (rs.next()) {
                i++;
            }
            if (i > 0) {
              

                HttpSession session = request.getSession();
                session.setAttribute("uname", name);
                RequestDispatcher rd = request.getRequestDispatcher("userhome.jsp");
                rd.include(request, response);
            } else {
                pw.println("<script type=\"text/javascript\">");
                pw.println("alert('Please Enter Correct Username and Password');");
                pw.println("</script>");
                RequestDispatcher rd = request.getRequestDispatcher("userlogin.jsp");
                rd.include(request, response);

            }
        } catch (Exception e) {
            pw.println("<html><body>" + e + "</body></html>");
        }

    }

}
