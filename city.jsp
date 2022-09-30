<%--
    Document   : city
    Created on : 18 Oct, 2017, 10:27:52 PM
    Author     : Abhishek Rai
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="com.java.DB"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <select class="form-control" name="city" id="city">
            <option>Select City</option>
            <%
                int state_id = Integer.parseInt(request.getParameter("state_id"));
                Connection con = DB.getConnection();
                Statement st = con.createStatement();
                ResultSet rs = st.executeQuery("select * from cities where state_id="+state_id+" ");
                while (rs.next()) {
            %>
            <option><%=rs.getString("city")%></option>
            <%
                }
            %>
        </select>
    </body>
</html>
