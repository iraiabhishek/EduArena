<%--
    Document   : state
    Created on : 18 Oct, 2017, 11:15:40 AM
    Author     : Abhishek Rai
--%>

<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.java.DB"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <select class="form-control" name="state" id="state">
            <option>Select State</option>
            <%
                int country_id = Integer.parseInt(request.getParameter("country_id"));//
                Connection con = DB.getConnection();
                Statement st = con.createStatement();
                ResultSet rs = st.executeQuery("select * from states where country_id="+ country_id+" ");
                while (rs.next()) {
            %>
            <option value="<%=rs.getString("id")%>"><%=rs.getString("state")%></option>
            <%
                }
            %>
        </select>

    </body>
</html>
<script>
    $(document).ready(function () {
        $("#state").on("change", function () {
            var state_id = $("#state").val();
                $("#error").html("");
                $.ajax({
                    url: "../city.jsp",
                    method: "POST",
                    data: {state_id: state_id},
                    success: function (data)
                    {
                        $("#city_name").html(data);//response sending to city.jsp page 
                    }
                });
        });
    });
</script>