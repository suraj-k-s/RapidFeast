<%-- 
    Document   : UserRegistration
    Created on : 19 Jan, 2024, 11:54:39 AM
    Author     : LENOVO
--%>
<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Tycontent="text/html; charset=UTF-8">
              <title>SelfemployeeReg</title>
    </head>
    <%@include file="Head.jsp" %>
    <body>

        <form enctype="multipart/form-data" method="post" action="../Assets/ActionPages/SelfemployeeUploadAction.jsp">
            <table border="1">
                <tr>
                    <td>Name</td>
                    <td><input type="text" name="txt_name"  autocomplete="off" required=""/></td>
                </tr>
                <tr>
                    <td>Contact</td>
                    <td><input type="number" name="txt_contact" pattern="[+0-9]{10,13}" autocomplete="off" required/></td>
                </tr>
                <tr>
                    <td>Address</td>
                    <td><textarea  name="txt_address" id="txt_address" autocomplete="off" required></textarea></td>
                </tr>
                <tr>
                    <td>Email</td>
                    <td> <input type="email" name="txt_email" id="txt_email" autocomplete="off" required/></td>
                </tr>
                <tr>
                    <td>Photo</td>
                    <td><input type="file" name="filephoto" id="filephoto" required=""/></td>    
                </tr>
                <tr>
                    <td>Proof</td>
                    <td><input type="file" name="filephoto" id="filephoto" required=""/></td>    
                </tr>
                <tr>
                    <td>Password</td>
                    <td><input type="passwrod" name="txt_pass" id="txt_pass" autocomplete="off" required=""/></td>
                </tr>
                <tr>
                    <td>status</td>
                    <td><input type="text" name="txt_status" id="txt_status" autocomplete="off" required=""/></td>
                </tr>
                <tr>
                    <td>District</td>
                    <td><select name="seldistrict" id="seldistrict" onChange="getPlace(this.value)">
                            <option value="">--select--</option>
                            <%
                                String selQry = "select * from tbl_district";
                                ResultSet rs = con.selectCommand(selQry);
                                while (rs.next()) {
                            %>  
                            <option value="<%=rs.getString("district_id")%>">
                                <%=rs.getString("district_name")%>
                            </option>
                            <%
                                }
                            %>
                        </select>
                    </td>

                </tr>
                <tr>
                    <td>Place</td> 
                    <td><select name="selplace" id="selplace" required="">
                            <option value="">--select--</option>
                        </select>

                    </td>           
                </tr>
                <tr>
                    <td colspan="2" align="center"><input type="submit" name="btn_save" value="save"/></td>
                </tr>
            </table>
        </form>
    </body>
    <script src="../Assets/JQ/jquery.js"></script>
    <script>
                        function getPlace(did)
                        {
                            $.ajax({
                                url: "../Assets/AjaxPages/AjaxPlace.jsp?did=" + did,
                                success: function(html) {
                                    $("#selplace").html(html);

                                }
                            });
                        }</script>
        <%@include file="Foot.jsp" %>
</html>
