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
            String updateQuery="update tbl_selfemployee SET selfemployee_name='" + request.getParameter("txt_name") +"',selfemployee_contact='" + request.getParameter("txt_contact")+"',selfemployee_address='"+ request.getParameter("txt_address")+"',selfemployee_email='"+request.getParameter("txt_email")+"'where selfemployee_id='"+session.getAttribute("sid")+"'";
            con.executeCommand(updateQuery);
            response.sendRedirect("EditProfile.jsp");
        }
        String selqry="select * from tbl_selfemployee where selfemployee_id='"+session.getAttribute("sid")+"'";
        ResultSet rs = con.selectCommand(selqry);
        while(rs.next()){
        %>
    <body>
        <form method="POST">
            <table border="1">
                 <tr>
               <td colspan="2" align="center"> <img src="../Assets/Files/<%=rs.getString("selfemployee_photo")%>"width="50px" height="50px"</td>
            </tr>
                <tr>
                     <td>Name</td>
                     <td><input type="text" name="txt_name"value="<%=rs.getString("selfemployee_name")%>"id="txt_name"/></td>
                </tr>
                <tr>
                    <td>Contact</td>
                    <td> <input type="number" name="txt_contact"value="<%=rs.getString("selfemployee_contact")%>"id="txt_contact"/></td>
                </tr>
                <tr>
                    <td>Address</td>
                    <td><input type="text" name="txt_address"value="<%=rs.getString("selfemployee_address")%>"id="txt_address"/></td>
                </tr>
                 <tr>
                    <td>Email</td>
                    <td><input type="text" name="txt_email"value="<%=rs.getString("selfemployee_email")%>"id="txt_email"/></td>
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
