<%@page import="java.sql.ResultSet" %>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%                            String selS = "SELECT * from tbl_subcategory where category_id IN(" + request.getParameter("cid") + ")";
    ResultSet rsS = con.selectCommand(selS);
    while (rsS.next()) {
%>
<li class="list-group-item">
    <div class="form-check">
        <label class="form-check-label">
            <input type="checkbox" class="form-check-input product_check" value="<%=rsS.getString("subcategory_id")%>" id="subcategory"><%=rsS.getString("subcategory_name")%>
        </label>
    </div>
</li>
<%
    }
%>