<%-- 
    Document   : changepassword
    Created on : 29 Feb, 2024, 9:44:52 PM
    Author     : sreel
--%>


<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Change Password</title>
    </head>
     <%@include file="Head.jsp" %>
    <body>
        <%
            if (request.getParameter("btn_save") != null) {
                String selqry = "select * from tbl_selfemployee where selfemployee_id='" + session.getAttribute("sid") + "'";

                ResultSet rs = con.selectCommand(selqry);
                rs.next();
                String dbpassword = rs.getString("selfemployee_password");
                String CurrentPassword = request.getParameter("txt_currentpassword");
                String NewPassword = request.getParameter("txt_newpassword");
                String Repassword = request.getParameter("txt_repassword");
                if (dbpassword.equals(CurrentPassword)) {
                    if (NewPassword.equals(Repassword)) {
                        String updateQuery = "update tbl_selfemployee SET selfemployee_password='" + request.getParameter("txt_newpassword") + "' where selfemployee_id='" + session.getAttribute("sid") + "'";
                        con.executeCommand(updateQuery);
                        response.sendRedirect("ChangePassword.jsp");
                    } else {
        %>
        <script>
            alert('newpassword mismatched');
        </script>

        <%
            }
        } else {
        %>
        <script>
            alert('password mismatched');
        </script>

        <%
            }
        %>

        <%
            }
        %>
        <form  name="frmpassword"method="post">
            <table border="1">
                <tr>
                    <td>Current Password</td>
                    <td><input type="passwrod" name="txt_currentpassword" id="txt_currentpassword"/></td>
                </tr>
                <tr>
                    <td> New Password</td>
                    <td><input type="passwrod" name="txt_newpassword" id="txt_newpassword" /></td>
                </tr>
                <tr>
                    <td>Re Password</td>
                    <td><input type="passwrod" name="txt_repassword" id="txt_repassword" /></td>
                </tr>
                <tr>
                    <td colspan="2" align="center"><input type="submit" name="btn_save" value="save"/></td>
                </tr>
            </table>
        </form>    
    </body>
    <%@include file="Foot.jsp" %>
</html>

