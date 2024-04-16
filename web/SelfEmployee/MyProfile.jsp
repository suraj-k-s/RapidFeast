<%-- 
    Document   : myprofile
    Created on : 29 Feb, 2024, 9:45:24 PM
    Author     : sreel
--%>

<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>My profile</title>
    </head>
     <%@include file="Head.jsp" %>
    <%
        String selqry="select * from tbl_selfemployee where selfemployee_id='"+session.getAttribute("sid")+"'";
        ResultSet rs=con.selectCommand(selqry);
        while(rs.next())
        {
        %> 

    <body>
        <form name="frmprofile"method="post"></form>
        <table border="2">
            <tr>
                <td colspan="2" align="center"><img src="../Assets/Files/<%=rs.getString("selfemployee_photo")%>"width="50px" height="50px"</td>
            </tr>
            <tr>
                <td>Name</td>
               
                <td><%=rs.getString("selfemployee_name")%></td>
            </tr>
            <tr>
                <td>Contact</td>
               
                <td><%=rs.getString("selfemployee_contact")%></td>
            </tr>
            <tr>
                <td>Address</td>
                
                <td><%=rs.getString("selfemployee_address")%></td>
            </tr>
            <tr>
                <td>Email</td>
               
                <td><%=rs.getString("selfemployee_email")%></td>
            </tr>
             <tr>
                 <td><a href="EditProfile.jsp">Edit Profile</a></td>
                 <td><a href="ChangePassword.jsp">Change Password</a></td>
            </tr>
            <%
        }
            %>
        </table>
    </body>
    <%@include file="Foot.jsp" %>
</html>

