<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="java.sql.*" %>
<%@page import="javax.naming.*" %>
<%@page import="javax.sql.DataSource" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

<%
Context ctx = new InitialContext();
DataSource ds = (DataSource) ctx.lookup("java:comp/env/jdbc/database");
Connection conn=ds.getConnection();
Statement stmt = conn.createStatement();

ResultSet rs;

rs = stmt.executeQuery("SELECT * FROM product");

%>
<TABLE  bgcolor=DodgerBlue>
    <TR  bgcolor=SkyBlue>
    <TD><B>title_id</B></TD>
    <TD><B>title_name</B></TD>
    </TR>
    <%
    //利用while迴圈將資料表中的記錄列出
    while (rs.next())
    {
        %>
        <TR bgcolor=LightGoldenrodYellow>
        <TD><B><%= rs.getString("productId") %></B></TD>
        <TD><B><%= rs.getString("productName") %></B></TD>
        </TR>
        <%
    }
    rs.close();        //關閉ResultSet物件
    stmt.close();    //關閉Statement物件
    conn.close();    //關閉Connection物件 記得每次使用完,要記得conn.close();才會釋放連線哦!
     %>
</body>
</html>
