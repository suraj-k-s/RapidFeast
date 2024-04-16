<%-- 
    Document   : editprofile
    Created on : 29 Feb, 2024, 9:45:03 PM
    Author     : sreel
--%>
<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Edit Profile</title>
    </head>
     <%@include file="Head.jsp" %>
    <%
        if (request.getParameter("btn_save") !=null){
            String updateQuery="update tbl_user SET user_name='" + request.getParameter("txt_name") +"',user_contact='" + request.getParameter("txt_contact")+"',user_address='"+ request.getParameter("txt_address")+"',user_email='"+request.getParameter("txt_email")+"'where user_id='"+session.getAttribute("uid")+"'";
            con.executeCommand(updateQuery);
            response.sendRedirect("EditProfile.jsp");
        }
        String selqry="select * from tbl_user where user_id='"+session.getAttribute("uid")+"'";
        ResultSet rs = con.selectCommand(selqry);
        while(rs.next()){
        %>
    <body>
        <form method="POST">
            <table border="1">
      
                <tr>
                     <td>Name</td>
                     <td><input type="text" name="txt_name"value="<%=rs.getString("user_name")%>"id="txt_name"/></td>
                </tr>
                <tr>
                    <td>Contact</td>
                    <td> <input type="number" name="txt_contact"value="<%=rs.getString("user_contact")%>"id="txt_contact"/></td>
                </tr>
                <tr>
                    <td>Address</td>
                    <td><input type="text" name="txt_address"value="<%=rs.getString("user_address")%>"id="txt_address"/></td>
                </tr>
                 <tr>
                    <td>Email</td>
                    <td><input type="text" name="txt_email"value="<%=rs.getString("user_email")%>"id="txt_email"/></td>
                </tr>
               <tr>
                <td colspan="2" align="center"><input type="submit" name="btn_save" value="save"/></td>
            </tr>
            <%
        }
            %>
            </table>
        </form>
            <%@include file="Foot.jsp" %>
    </body>
</html>
