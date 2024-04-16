<%-- 
    Document   : Login
    Created on : 29 Feb, 2024, 9:26:07 PM
    Author     : sreel
--%>

<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <%
        if (request.getParameter("btn_login") != null) {
            String email = request.getParameter("txt_name");
            String password = request.getParameter("txt_password");

            String selUser = "select * from tbl_user where user_email='" + email + "' and  user_password='" + password + "'";
            ResultSet rsUser = con.selectCommand(selUser);
            String selSelfemployee = "select * from tbl_selfemployee where selfemployee_email='" + email + "' and  selfemployee_password='" + password + "'";
            ResultSet rsSelfemployee = con.selectCommand(selSelfemployee);
            String selKudumbasree = "select * from tbl_kudumbasree where kudumbasree_email='" + email + "' and  kudumbasree_password='" + password + "'";
            ResultSet rsKudumbasree = con.selectCommand(selKudumbasree);
            String selHotel = "select * from tbl_hotel where hotel_email='" + email + "' and  hotel_password='" + password + "'";
            ResultSet rsHotel = con.selectCommand(selHotel);
            String selDeliveryboy = "select * from tbl_deliveryboy where deliveryboy_email='" + email + "' and  deliveryboy_password='" + password + "'";
            ResultSet rsDeliveryboy = con.selectCommand(selDeliveryboy);
            String selAdmin = "select * from tbl_admin where admin_email='" + email + "' and  admin_password='" + password + "'";
            ResultSet rsadmin = con.selectCommand(selAdmin);
            if (rsUser.next()) {
                session.setAttribute("uid", rsUser.getString("user_id"));
                session.setAttribute("uname", rsUser.getString("user_name"));
                response.sendRedirect("../User/HomePage.jsp");           
            }
            else if(rsKudumbasree.next()){
                session.setAttribute("kid", rsKudumbasree.getString("kudumbasree_id"));
                session.setAttribute("kname", rsKudumbasree.getString("kudumbasree_name"));
                response.sendRedirect("../Kudumbasree/HomePage.jsp");
            } 
            else if(rsSelfemployee.next()){
                session.setAttribute("sid", rsSelfemployee.getString("selfemployee_id"));
                session.setAttribute("sname", rsSelfemployee.getString("selfemployee_name"));
                response.sendRedirect("../SelfEmployee/HomePage.jsp");
            } 
            else if(rsHotel.next()){
                session.setAttribute("hid", rsHotel.getString("hotel_id"));
                session.setAttribute("hname", rsHotel.getString("hotel_name"));
                response.sendRedirect("../Hotel/HomePage.jsp");
            } 
             else if(rsDeliveryboy.next()){
                session.setAttribute("did", rsDeliveryboy.getString("deliveryboy_id"));
                session.setAttribute("dname", rsDeliveryboy.getString("deliveryboy_name"));
                response.sendRedirect("../DeliveryBoy/HomePage.jsp");
            } 
             
             else if(rsadmin.next()){
                session.setAttribute("aid", rsadmin.getString("admin_id"));
                session.setAttribute("aname", rsadmin.getString("admin_name"));
                response.sendRedirect("../Admin/HomePage.jsp");
             }
            else
            {
                %>
                <script>
                    alert('Invalid Credentials');
                </script>
                <%
            }
        }
        
    %>
     <%@include file="Head.jsp" %>
    <body>
        <form method="post">
            <table border="1">
                <tr>
                    <td>Email</td>
                    <td><input type="text" name="txt_name"</td> 
                </tr>
                <tr>
                    <td>Password</td>
                    <td><input type="password" name="txt_password"</td> 
                </tr>
                <tr>
                    <td colspan="2" align="center">
                        <input type="submit" name="btn_login" value="Login"/>
                    </td>
                </tr>
            </table>
        </form>
    </body>
     <%@include file="Foot.jsp" %>
</html>