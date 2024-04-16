<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%

    if (request.getParameter("action") != "") {

        String sqlQry = "select * from tbl_food p inner join tbl_subcategory sc on sc.subcategory_id=p.subcategory_id inner join tbl_category c on c.category_id=sc.category_id where true";

        if (!request.getParameter("category").equals("")) {

            String category = request.getParameter("category");

            sqlQry += " AND c.category_id IN(" + category + ")";
        }
        if (!request.getParameter("subcategory").equals("")) {

            String subcategory = request.getParameter("subcategory");

            sqlQry += " AND sc.subcategory_id IN(" + subcategory + ")";
        }

        ResultSet rs = con.selectCommand(sqlQry);
        ResultSet rsr = con.selectCommand(sqlQry);

        if (rsr.next()) {
            while (rs.next()) {
%>
<div class="col-md-3 mb-2">
    <div class="card-deck">
        <div class="card border-secondary">
            <img src="../Assets/Files/<%=rs.getString("food_image")%>" class="card-img-top" height="250">
            <div class="card-img-secondary">
                <h6  class="text-light bg-info text-center rounded p-1"><%=rs.getString("food_name")%></h6>
            </div>
            <div class="card-body">
                <h4 class="card-title text-danger">
                    Price : <%=rs.getString("food_rate")%>/-
                </h4>
                <p>
                    Category  : <%=rs.getString("category_name")%><br>
                    Sub Category  : <%=rs.getString("subcategory_name")%><br>
                </p>
                <a href="javascript:void(0)" onclick="addCart('<%=rs.getString("food_id")%>')" class="btn btn-success btn-block">Add to Cart</a>

            </div>
        </div>
    </div>
</div>

<%
            }
        } else {
            out.println("<h4>Products Not Found!!!!</h4>");
        }
    }

%>