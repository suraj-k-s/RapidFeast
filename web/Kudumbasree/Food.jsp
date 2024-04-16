<%-- 
    Document   : food
    Created on : 19 Mar, 2024, 12:15:50 PM
    Author     : sreel
--%>

<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>food</title>
    </head>
    <%@include file="Head.jsp" %>
    <%

        if (request.getParameter("fid") != null) {
            String delQry = "delete from tbl_food where food_id='" + request.getParameter("fid") + "'";
            con.executeCommand(delQry);
        }
    %>
    <body>
        <form enctype="multipart/form-data" method="post" action="../Assets/ActionPages/KudumbasreeFoodUploadAction.jsp">
            <table border="1">
                <tr>           
                    <td>Name</td>
                    <td><input type="text" name="txt_foodname"  autocomplete="off" required=""/></td>
                </tr>
                <tr>           
                    <td>Image</td>
                    <td><input type="file" name="filephoto" id="filephoto" required=""/></td>
                </tr>
                <tr>
                    <td>Details</td>
                    <td> <input type="details" name="txt_fooddetails" id="txt_details" autocomplete="off" required/></td>
                </tr>


                <tr>
                    <td>Rate</td>
                    <td><input type="number" name="txt_foodrate" id="txt_rate" autocomplete="off" required=""/></td>
                </tr>
                <tr>
                    <td>category</td>

                    <td><select name="selcategory" id="selcategory" onChange="getSubcategory(this.value)">
                            <option value="">--select--</option>
                            <%
                                String selQry = "select * from tbl_category";
                                ResultSet rs = con.selectCommand(selQry);
                                while (rs.next()) {
                            %>  
                            <option value="<%=rs.getString("category_id")%>">
                                <%=rs.getString("category_name")%>
                            </option>
                            <%
                                }
                            %>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td>Subcategory</td>
                    <td><select name="selsubcategory" id="selsubcategory">
                            <option value="">--select--</option>

                        </select>
                    </td>
                </tr>

                <tr>
                    <td colspan="2" align="center">
                        <input type="Submit" value="save" name="btn_save"/>

                    </td>
                </tr>
            </table>

        </form>
        <br><br>
        <table border="1">
            <tr>
                <td>Sl No</td>
                <td>Food Name</td>
                <td>Food Image</td>
                <td>Food Details</td>
                <td>Food Rate</td> 
                <td>category</td>
                <td>Sub Category</td>
            </tr>
            <%
                int j = 0;
                String seQry = "select* from tbl_food f inner join tbl_subcategory sc on sc.subcategory_id=f.subcategory_id inner join tbl_category c on c.category_id=sc.category_id where kudumbasree_id='"+session.getAttribute("kid")+"'";
                ResultSet rl = con.selectCommand(seQry);
                while (rl.next()) {
                    j++;


            %>
            <tr>
                <td><%=j%></td>
                <td><%=rl.getString("food_name")%></td>
                <td> <img src="../Assets/Files/<%=rl.getString("food_image")%>"width="50px" height="50px"</td>
                <td><%=rl.getString("food_details")%></td>
                <td><%=rl.getString("food_rate")%></td>
                <td><%=rl.getString("category_name")%></td>
                <td><%=rl.getString("subcategory_name")%></td>
                <td><a href="Food.jsp?fid=<%=rl.getString("food_id")%>">Delete</a></td>
            </tr>
            <%
                }
            %>


        </table>    
    </body>
    <script src="../Assets/JQ/jquery.js"></script>
    <script>
                        function getSubcategory(did)
                        {
                            $.ajax({
                                url: "../Assets/AjaxPages/AjaxSubcategory.jsp?did=" + did,
                                success: function(html) {
                                    $("#selsubcategory").html(html);

                                }
                            });
                        }</script>
</html>
<%@include file="Foot.jsp" %>