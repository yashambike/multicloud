package com;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.crypto.Cipher;
import javax.crypto.CipherInputStream;
import javax.crypto.CipherOutputStream;
import javax.crypto.spec.SecretKeySpec;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ownerdownload extends HttpServlet {

    String filename, filenam="";
    String fileid, extension, cid, group;
    int cont=0;

    private String algorithm = "DES/ECB/PKCS5Padding";
    private File file = new File("test.txt");

    public void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {

            String fileid = request.getParameter("dwnid");
             PrintWriter pw=response.getWriter();
            response.setContentType("text/html");
            PrintWriter out = response.getWriter();

           try
           {
               Class.forName("com.mysql.jdbc.Driver");
                Connection cn1 = DriverManager.getConnection("jdbc:mysql://localhost:3306/multicloud", "root", "root");
                PreparedStatement ps1 = cn1.prepareStatement("select * from file where fileid=?");

                ps1.setString(1, fileid);

                ResultSet j = ps1.executeQuery(); 
               System.out.println("J"+j);
                if(j==null){
                     pw.println("<script type=\"text/javascript\">");  
                 pw.println("alert('Fileid Not Present');");
                   pw.println("</script>");
              
                }else{
          
           
           
            try {
                Class.forName("com.mysql.jdbc.Driver");
                Connection cn = DriverManager.getConnection("jdbc:mysql://localhost:3306/multicloud", "root", "root");
                PreparedStatement ps = cn.prepareStatement("select * from file where fileid=?");

                ps.setString(1, fileid);

                ResultSet rs = ps.executeQuery();

                while (rs.next()) {
                    filenam = rs.getString("filename");
                    extension = rs.getString("extension");
                  

                }

            } catch (Exception e) {
                out.println("<html><body>" + e + "</body></html>");
            }
            
            /////
            
             try {
                Class.forName("com.mysql.jdbc.Driver");
                Connection cn = DriverManager.getConnection("jdbc:mysql://localhost:3306/multicloud", "root", "root");
                PreparedStatement ps = cn.prepareStatement("select * from file ");

               

                ResultSet rs = ps.executeQuery();

                while (rs.next()) {
                  cont++;

                }

            } catch (Exception e) {
                out.println("<html><body>" + e + "</body></html>");
            }
            //////
                   
            
            
              String name = filenam;
              if(!name.equalsIgnoreCase("")){
            int dot = name.lastIndexOf('.');
            String filebase = (dot == -1) ? name : name.substring(0, dot);

    
           String tfname = filenam;
  
            
          
            String encode = "D:\\upload\\" + filebase + extension;
            String decode = "D:\\upload\\" + filenam;

            try {
                decrypt(encode, decode);

            } catch (Exception ex) {
                Logger.getLogger(userdecode.class.getName()).log(Level.SEVERE, null, ex);
            }

          

            ServletContext context = request.getSession().getServletContext();
            String fil = "d:\\upload\\";

            context.setAttribute("delpath", fil + filename);

            filename = filebase + extension;
            String filepath = "d:\\upload\\";

            response.setContentType("APPLICATION/OCTET-STREAM");
            response.setHeader("Content-Disposition", "attachment; filename=\"" + filename + "\"");

            java.io.FileInputStream fileInputStream = new java.io.FileInputStream(filepath + filename);

            int i;
            while ((i = fileInputStream.read()) != -1) {
                out.write(i);
            }
            fileInputStream.close();
            out.close();
              }else{
               pw.println("<script type=\"text/javascript\">");  
                 pw.println("alert('Fileid Not Present');");
                   pw.println("</script>");
                  
              }
                }} catch (Exception ex) {
            Logger.getLogger(ownerdownload.class.getName()).log(Level.SEVERE, null, ex);
        }
        }catch (Exception ex) {
            Logger.getLogger(ownerdownload.class.getName()).log(Level.SEVERE, null, ex);
        }
        RequestDispatcher rq = request.getRequestDispatcher("owner_home.jsp");
        rq.include(request, response);
    }

    public void decrypt(String encode, String decode) throws Exception {
        //opening streams
        FileInputStream fis = new FileInputStream(decode);
        file = new File(file.getAbsolutePath() + ".dec");
        FileOutputStream fos = new FileOutputStream(encode);

        //generating same key
        byte k[] = "Aparajit".getBytes();
        SecretKeySpec key = new SecretKeySpec(k, "DES");

        //creating and initialising cipher and cipher streams
        Cipher decrypt = Cipher.getInstance(algorithm);
        decrypt.init(Cipher.DECRYPT_MODE, key);
        CipherInputStream cin = new CipherInputStream(fis, decrypt);

        byte[] buf = new byte[1024];
        int read = 0;

        while ((read = cin.read(buf)) != -1) //reading encrypted data
        {
            fos.write(buf, 0, read);       //writing decrypted data
        }

        //closing streams
        cin.close();
        fos.flush();
        fos.close();
    }

    public void encrypt(String encode, String decode) throws Exception {

        FileInputStream fis = new FileInputStream(encode);
        file = new File(file.getAbsolutePath() + ".enc");
        FileOutputStream fos = new FileOutputStream(decode);

        //generating key
        byte k[] = "Aparajit".getBytes();
        SecretKeySpec key = new SecretKeySpec(k, "DES");

        //creating and initialising cipher and cipher streams
        Cipher encrypt = Cipher.getInstance(algorithm);
        encrypt.init(Cipher.ENCRYPT_MODE, key);
        CipherOutputStream cout = new CipherOutputStream(fos, encrypt);

        byte[] buf = new byte[1024];
        int read;

        while ((read = fis.read(buf)) != -1) //reading data
        {
            cout.write(buf, 0, read);      //writing encrypted data
        }		//closing streams
        fis.close();
        cout.flush();
        cout.close();
    }
}
