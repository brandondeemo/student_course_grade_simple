<%--
  Created by IntelliJ IDEA.
  User: wonpyeongson
  Date: 2020/08/01
  Time: 3:16 下午
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.ResultSet" %>
<%
    String url = "jdbc:mysql://localhost:3306/studentsystem";
    String username= "root";
    String pass = "sunjian8844";
    String querry = "select * from student";

    Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection(url,username,pass);
    Statement st = con.createStatement();
    ResultSet rs = st.executeQuery(querry);
%>


<html>
<head>
    <title>showstudent</title>
</head>
<body>
<caption>登录课程表</caption>
<table border="1">
    <tr>
        <th>姓名</th>
        <th>ID</th>
        <th>年龄</th>
        <th>性别</th>
    </tr>
    <%
        while(rs.next()){
    %>
    <tr>
        <td><%=rs.getString(1)%></td>
        <td><%=rs.getInt(2)%></td>
        <td><%=rs.getInt(3)%></td>
        <td><%=rs.getString(4)%></td>
        <td>
            <form name="delstudent" method="post" action="delstudentrow">
                <input type="hidden" name="student_name" value="<%=rs.getString(1)%>">
                <input type="hidden" name="student_id" value="<%=rs.getInt(2)%>">
                <input type="hidden" name="student_age" value="<%=rs.getInt(3)%>">
                <input type="hidden" name="student_gender" value="<%=rs.getString(4)%>">
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
<a href="student.jsp"><input type="button" value="返回学生信息界面"></a>
</body>
</html>
