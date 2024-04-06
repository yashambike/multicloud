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

public class userdownreq extends HttpServlet {

    String uid, fname, owner, sid;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        PrintWriter pw = response.getWriter();

        String fid = request.getParameter("dwnreqid");
        HttpSession session = request.getSession();
        sid = session.getId();
        String umail = (String) session.getAttribute("uname");

        try {
            Class.forName("com.mysql.jdbc.Driver");
            java.sql.Connection cn = (java.sql.Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/multicloud", "root", "root");
            PreparedStatement ps = cn.prepareStatement("select * from file where fileid=?");

            ps.setString(1, fid);

            ResultSet rs = ps.executeQuery();
            System.out.println("rs"+rs);
            while (rs.next()) {
                fname = rs.getString("filename");
                owner = rs.getString("owner");
            }

        } catch (Exception e) {
            pw.println("<html><body>" + e + "</body></html>");
        }

        try {
            Class.forName("com.mysql.jdbc.Driver");
            java.sql.Connection cn = (java.sql.Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/multicloud", "root", "root");
            PreparedStatement ps = cn.prepareStatement("select * from user where email=?");

            ps.setString(1, umail);

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                uid = rs.getString("id");
            }

        } catch (Exception e) {
            pw.println("<html><body>" + e + "</body></html>");
        }

        try {

            Class.forName("com.mysql.jdbc.Driver");
            Connection cn = (Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/multicloud", "root", "root");
            PreparedStatement ps = cn.prepareStatement("insert into request( clientid, fileid, filename,owner,rdownload) values(?,?,?,?,?)");

            ps.setString(1, uid);
            ps.setString(2, fid);
            ps.setString(3, fname);
            ps.setString(4, owner);
            ps.setString(5, "NO");

            int s = ps.executeUpdate();
            pw.println("<script type=\"text/javascript\">");
            pw.println("alert('Request Send...');");
            pw.println("</script>");
            RequestDispatcher rd = request.getRequestDispatcher("userhome.jsp");
            rd.include(request, response);

        } catch (Exception e) {
            pw.println("<html><body>" + e + "</body></html>");
        }
    }

}
