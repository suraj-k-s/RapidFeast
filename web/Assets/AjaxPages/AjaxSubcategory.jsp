<%-- 
    Document   : AjaxSubcategory
    Created on : 19 Mar, 2024, 1:53:18 PM
    Author     : sreel
--%>

<%@page  import="java.sql.ResultSet" %>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<option value="">--select--</option>
<%
    String sel="select * from tbl_subcategory where category_id='"+request.getParameter("did")+"'";
    ResultSet rs=con.selectCommand(sel);
    while(rs.next())
    {
        %>
        <option onclick="getSub(),productCheck()" value="<%=rs.getString("subcategory_id")%>"><%=rs.getString("subcategory_name")%></option>
        <%
    }
%>
