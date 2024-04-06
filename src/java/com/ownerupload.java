package com;

import com.oreilly.servlet.MultipartRequest;
import javax.servlet.*;
import javax.servlet.http.*;
import java.util.*;
import java.io.*;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.crypto.Cipher;
import javax.crypto.CipherOutputStream;
import javax.crypto.spec.SecretKeySpec;

public class ownerupload extends HttpServlet {
    String filename, temp;
    String encode;
    String decode;
    private String algorithm = "DES/ECB/PKCS5Padding";
    private File file = new File("test.txt");

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

    @Override
    public void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
       // ServletContext context = getServletContext();
         HttpSession session = request.getSession();
        String owner = (String)session.getAttribute("owner");
        String fkey = (String) session.getAttribute("key");

        PrintWriter pw = response.getWriter();
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        
try{
        MultipartRequest m = new MultipartRequest(request, "D:\\upload\\");

        Enumeration files = m.getFileNames();
        while (files.hasMoreElements()) {

            temp = (String) files.nextElement();
            filename = m.getFilesystemName(temp);
          
        }
        
}catch(Exception e)
{
    e.printStackTrace();
    response.getWriter().print("Please Select The File First");
    request.getRequestDispatcher("owner_upload.jsp").include(request, response);
}
        String name = filename;
        int dot = name.lastIndexOf('.');
        String filebase = (dot == -1) ? name : name.substring(0, dot);
        String fileextension = (dot == -1) ? "" : name.substring(dot + 1);
        String fname = filebase + ".des";
        System.out.println("owner"+owner);
        //For Temp Folder
        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection cn = DriverManager.getConnection("jdbc:mysql://localhost:3306/multicloud", "root", "root");
            PreparedStatement file = cn.prepareStatement("insert into file(filename,extension,owner) values(?,?,?)");

            file.setString(1, fname);
            file.setString(2, "." + fileextension);
           // file.setString(2, fkey);
            file.setString(3, owner);

            file.execute();

            encode = "D:\\upload\\" + filename;
            decode = "D:\\upload\\" + fname;
            ownerupload e = new ownerupload();
            e.encrypt(encode, decode);

            System.out.println("executed");
        } catch (Exception ex) {
            ex.printStackTrace();
        }

        RequestDispatcher rd = request.getRequestDispatcher("owner_home.jsp");
        rd.include(request, response);

    }
}
