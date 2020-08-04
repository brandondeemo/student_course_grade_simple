<%--
  Created by IntelliJ IDEA.
  User: wonpyeongson
  Date: 2020/07/31
  Time: 9:05 下午
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.ResultSet" %>
<%
    String url = "jdbc:mysql://localhost:3306/studentsystem";
    String username= "root";
    String pass = "sunjian8844";
    String querry = "select * from course";

    Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection(url,username,pass);
    Statement st = con.createStatement();
    ResultSet rs = st.executeQuery(querry);
%>


<html>
<head>
    <title>showcourse</title>
</head>
<body>
<caption>登录课程表</caption>
<table border="1">
    <tr>
        <th>课程ID</th>
        <th>课程名</th>
    </tr>
    <%
        while(rs.next()){
    %>
    <tr>
        <td><%=rs.getInt(1)%></td>
        <td><%=rs.getString(2)%></td>
        <td>
            <form name="delcourse" method="post" action="delcourserow">
            <input type="hidden" name="course_id" value="<%=rs.getInt(1)%>">
            <input type="hidden" name="course_name" value="<%=rs.getString(2)%>">
                <input name="del" type="submit" value="删除" >
            </form>
        </td>
    </tr>
    <%
        }
        st.close();
        con.close();
    %>
</table>
<%
    session.setAttribute("type",4);
%>
<a href="course.jsp"><input type="button" value="返回课程界面"></a>
</body>
</html>
