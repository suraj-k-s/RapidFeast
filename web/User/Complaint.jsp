<%-- 
    Document   : complaint
    Created on : 28 Mar, 2024, 9:09:00 AM
    Author     : sreelakshmi
--%>
<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Complaint</title>
    </head>
     <%@include file="Head.jsp" %>
    <%
        if (request.getParameter("btn_submit") != null) {
            String Title = request.getParameter("txt_title");
            String Details = request.getParameter("txt_details");
            String Date = request.getParameter("date");
            String insQry = "insert into tbl_complaints(complaints_title,complaints_details,complaints_date,user_id)values('" + Title + "','" + Details + "','" + Date + "','" + session.getAttribute("uid") + "')";
            con.executeCommand(insQry);
        }
        if (request.getParameter("Cid") != null) {
            String delQry = "delete from tbl_complaints where complaints_id='" + request.getParameter("Cid") + "'";
            con.executeCommand(delQry);
        }
    %>
    <body>
        <form  method="post" >
            <table border="1">
                <tr>
                    <td>Title</td>
                    <td>
                        <input type="text" name="txt_title" id="txt_title"/>
                    </td>
                </tr>
                <tr>
                    <td>Details</td>
                    <td><input type="text" name="txt_details" id="txt_details"/>
                </tr>
                <tr>
                    <td> Date</td>
                    <td><input  type="date" name="date"></td></td>
                </tr>

                <tr>
                    <td colspan="2" align="center">
                    <input type="submit" name="btn_submit" value="submit"/>
                    </td>
                </tr>
            </table>
        </form>
        <br><br>
        <table border="1">
            <tr>
                <td>Title</td>
                <td>Details</td>
                <td>Date</td>
            </tr>
            <%
                int i = 0;
                String selQry = "select * from tbl_complaints c inner join tbl_user u on c.user_id=u.user_id";
                ResultSet rs = con.selectCommand(selQry);
                while (rs.next()) {
                    i++;

            %> 
            <tr>
                <td><%=i%></td>
                <td><%=rs.getString("complaints_title")%></td>
                <td><%=rs.getString("complaints_details")%></td>
                <td><%=rs.getString("complaints_date")%></td>
                <td><a href="complaint.jsp?fid=<%=rs.getString("complaints_id")%>">Delete</a></td>
            </tr>
            <%
                }
            %>
        </table>                
    </body>
</html>
<%@include file="Foot.jsp" %>
