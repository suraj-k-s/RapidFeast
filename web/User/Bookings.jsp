<%-- 
    Document   : ViewBookings
    Created on : 21 Dec, 2021, 12:50:02 PM
    Author     : hp
--%>
<%@page import="java.sql.ResultSet" %>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>View Bookings</title>
    </head>
    <%@include file="Head.jsp" %>
    <body>
        <br><br><br><br><br><br><br>
        <h2>Bookings</h2>
        <br> <br>
        <table align='center' border="1" width="50%" >
            <tr>
                <th>SL.No</th>

                <th>Product</th>
                <th>Date</th>
                <th>Qty</th>
                <th>Status</th>
            </tr>
            <%                int i = 0;
                String selQry = "select * from tbl_booking b inner join tbl_cart c on c.booking_id=b.booking_id  inner join tbl_food p on p.food_id=c.food_id where user_id='" + session.getAttribute("uid") + "' and booking_status>0";
                ResultSet rs = con.selectCommand(selQry);
                while (rs.next()) {
                    i++;

            %>
            <tr>
                <td><%=i%></td>

                <td><%=rs.getString("food_name")%></td>
                <td><%=rs.getString("booking_date")%></td>
                <td><%=rs.getString("cart_qty")%></td>
                <td><%
                    if ( rs.getString("cart_status").equals("1")) {
                        out.println("Payment Completed ,on Waiting List");
                    } else if (rs.getString("cart_status").equals("2") ) {
                        out.println("Food Packed");
                    } else if (rs.getString("cart_status").equals("3")) {
                        out.println("Food On the Way");
                    } else if (rs.getString("cart_status").equals("4")) {
                    %>
                    Food Delivered <a href="Review.jsp?id=<%=rs.getString("food_id")%>">Review</a>
                    <%
                        }

                    %></td>
            </tr>         
            <%                }


            %> 
        </table>
            <%@include file="Foot.jsp" %>
    </body>
</html>
