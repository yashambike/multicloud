<%-- 
    Document   : index
    Created on : Feb 5, 2016, 11:17:23 AM
    Author     : SAII
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html0>
<html>
    <head>
        <title>Cloud System</title>
        <link href="css/bootstrap.css" rel='stylesheet' type='text/css' />
        <!-- jQuery (Bootstrap's JavaScript plugins) -->
        <script src="js/jquery.min.js"></script>
        <!-- Custom Theme files -->
        <link href="css/style.css" rel="stylesheet" type="text/css" media="all" />
        <!-- Custom Theme files -->
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <meta name="keywords" content="Charity Responsive web template, Bootstrap Web Templates, Flat Web Templates, Android Compatible web template, 
              Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyErricsson, Motorola web design" />
        <script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
    </head>
    <body>
        <!---->
        <div class="header">
            <div class="container">
                <div class="header-top">
                    <div class="logo">
                        <a href="index.jsp">
                            <h1>Cloud System</h1>
                        </a>
                    </div>
                    <div class="hdr-address">
                        <div class="address1">
                            <h5>&nbsp;</h5>
                        </div>
                        <div class="call">
                            <h5>&nbsp;</h5>
                        </div>
                        <div class="clearfix"></div>
                    </div>
                     <div class="clearfix"> </div>
                    <!-- search-scripts -->
                    <script src="js/classie.js"></script>
                    <script src="js/uisearch.js"></script>
                    <script>
                        new UISearch(document.getElementById('sb-search'));
                    </script>
                    <!-- //search-scripts -->
                </div>
                <div class="top-menu">
                    <span class="menu">MENU</span>
                    <ul>
                        <li><a href="userhome.jsp"><span class="glyphicon glyphicon-home" aria-hidden="true"></span>Home</a></li>
                        <li><a href="userviewfile.jsp"><span class="glyphicon glyphicon-user" aria-hidden="true"></span>View File  </a></li>
                        <li><a href="userreqdownload.jsp"><span class="glyphicon glyphicon-user" aria-hidden="true"></span>Request Download Permission </a></li>
                        <li><a href="changeUserPass.jsp"><span class="glyphicon glyphicon-user" aria-hidden="true"></span>Change Password</a></li>
       
                        <li class="active"><a href="userDownloadfile.jsp"><span class="glyphicon glyphicon-user" aria-hidden="true"></span>Download File</a></li>
           
                        <li><a href="Logout"><span class="glyphicon glyphicon-calendar" aria-hidden="true"></span>Logout</a></li>
                    </ul>
                </div>
                <!-- script-for-menu -->
                <script>
                    $("span.menu").click(function () {
                        $(".top-menu ul").slideToggle("slow", function () {
                        });
                    });
                </script>
                <!-- script-for-menu -->	
                <div class="clearfix"></div>
            </div>
        </div>
        <!---->
        <div class="banner">
            <div class="container">			
                <script src="js/responsiveslides.min.js"></script>
                <script>
          window.onload=function(){

                  $(".submit").click(function () {
                       var d = document.getElementById('dwnid');
 
             if(d.value == '')
            {
                alert('Please File  Id');
                return false;
            }
            return true;
                    });
                }
      
            
                   </script>
                <!----->		  

            </div>
        </div>
        <!---->
        <div class="welcome">
            <div class="container">
                <div class="welcome-top">
                     <h3> Welcome <% out.println(session.getAttribute("uname"));%></h3>
                    <%

                        Class.forName("com.mysql.jdbc.Driver");
                        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/multicloud", "root", "root");
                        Statement st = con.createStatement();
                        String s = "select * from request";
                        ResultSet rs = st.executeQuery(s);
                    %>
                  
                    <table border="0" width="90%" cellpadding="5">
                        <thead>
                        <center>
                            <tr>

                                <TH>File Id</TH>
                                <TH>File Name</TH>
                                <TH>File Access</TH>
                            


                            </tr>
                        </thead>
                        <% while (rs.next()) {%>
                        <tbody>
                            <tr>

                                <TD> <%= rs.getString("fileid")%> </TD>
                                <TD> <%= rs.getString("filename")%> </TD>
                              <TD> <%= rs.getString("rdownload")%> </TD>


                            </tr>
                        </tbody>
                        <%}%>
                        </center>

                    </table>



                </div>
                <form name="login" action="userdownload" method="get" onsubmit="return valid();">
                    Enter OTP <input type="text" name="Otp" required><br><br>

                    Enter The File Id To Download <br>
                    
                      
                                        
                    <input type="text" name="dwnid" id="dwnid" required><br>
                    
                     

 
                    
                    <input  style="color:#FF008C"class="submit" type="submit" value="Download">

                            </div>
            <div class="charitys">
                <div class="clearfix"></div>
            </div>		 
        </div>
    </div>
    <!---->
    <!---->
    <!---->
    <div class="bottom-grids">
        <div class="container">
            <div class="clearfix"></div>
        </div>
    </div>
    <!---->
    <div class="copywrite">
        <div class="container">
            <p> © 2017 Cloud System. All rights reserved </p>
        </div>
    </div>
    <!---->
</body>
</html>