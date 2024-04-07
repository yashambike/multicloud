/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
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


public class decode extends HttpServlet {

   
   private String algorithm="DES/ECB/PKCS5Padding";
	private File file=new File("test.txt");
String filenam,extension;
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String fileid=request.getParameter("viewreqid");
            PrintWriter out=response.getWriter();
         try {
                              Class.forName("com.mysql.jdbc.Driver");
                              Connection cn = DriverManager.getConnection("jdbc:mysql://localhost:3306/multicloud", "root","root");
                              PreparedStatement ps = cn.prepareStatement("select * from file where fileid=?");
                              
                              ps.setString(1,fileid);
                              
                              ResultSet rs =ps.executeQuery();
                              
                              while(rs.next())
                              {
                                  filenam=rs.getString("filename");
                                  extension=rs.getString("extension");
                              }
                              
                          }catch(Exception e)
                          {
                              out.println("<html><body>"+e+"</body></html>");
                          }
         
                            System.out.println("fname="+filenam);
                          String name = filenam;
                          int dot = name.lastIndexOf('.');
                          String filebase = (dot == -1) ? name : name.substring(0, dot);
                          
                            System.out.println("fname="+filenam);
                          String filecontent=filebase+extension;
                            System.out.println("fname="+filenam);
                            
                          String encode="D:\\upload\\"+filebase+extension;
                          String decode = "D:\\upload\\"+filenam;
                          
                           ServletContext context = request.getSession().getServletContext();
                             System.out.println("encode="+encode);
                   
                    context.setAttribute("filecontent",filecontent);
                   try {
           decrypt(encode, decode);
           
           
       } catch (Exception ex) {
           Logger.getLogger(userdecode.class.getName()).log(Level.SEVERE, null, ex);
       }
           
          
       String t="D:\\upload\\"+filebase+extension;
       
        context.setAttribute("encode",t);
                   
                    
                    RequestDispatcher rq=request.getRequestDispatcher("owner_filecontent.jsp");
                   rq.forward(request, response);
                          
      
        
        
        
        
        
        
    }
public void decrypt(String encode,String decode) throws Exception
	{
		//opening streams
		FileInputStream fis =new FileInputStream(decode);
		file=new File(file.getAbsolutePath()+".dec");
		FileOutputStream fos =new FileOutputStream(encode);
		
		//generating same key
		byte k[] = "Aparajit".getBytes();   
		SecretKeySpec key = new SecretKeySpec(k,"DES");  
		
		//creating and initialising cipher and cipher streams
		Cipher decrypt =  Cipher.getInstance(algorithm);  
		decrypt.init(Cipher.DECRYPT_MODE, key);  
		CipherInputStream cin=new CipherInputStream(fis, decrypt);
		
		byte[] buf = new byte[1024];
		int read=0;
		
		while((read=cin.read(buf))!=-1)  //reading encrypted data
		{
			fos.write(buf,0,read);       //writing decrypted data
		}
		
		//closing streams
		cin.close();
		fos.flush();
		fos.close();
	}
public void encrypt(String encode,String decode) throws Exception
	{
		
		FileInputStream fis =new FileInputStream(encode);
		file=new File(file.getAbsolutePath()+".enc");
		FileOutputStream fos =new FileOutputStream(decode);
		
		//generating key
		byte k[] = "Aparajit".getBytes();   
		SecretKeySpec key = new SecretKeySpec(k,"DES");  
		
		//creating and initialising cipher and cipher streams
		Cipher encrypt =  Cipher.getInstance(algorithm);  
		encrypt.init(Cipher.ENCRYPT_MODE, key);  
		CipherOutputStream cout=new CipherOutputStream(fos, encrypt);
		
		byte[] buf = new byte[1024];
		int read;
		
		while((read=fis.read(buf))!=-1)  //reading data
		cout.write(buf,0,read);      //writing encrypted data
		//closing streams
		fis.close();
		cout.flush();
		cout.close();
	}
}