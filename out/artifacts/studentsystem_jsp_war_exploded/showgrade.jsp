<%--
  Created by IntelliJ IDEA.
  User: wonpyeongson
  Date: 2020/08/02
  Time: 3:33 上午
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
    String querry = "SELECT course.course_id,course.course_name,student.id,student.name,course_student.grade FROM course,course_student,student where course.course_id=course_student.course_id and student.id=course_student.student_id;";

    Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection(url,username,pass);
    Statement st = con.createStatement();
    ResultSet rs = st.executeQuery(querry);
%>
<html>
<head>
    <title>showgrade</title>
</head>
<body>
<caption>课程成绩表</caption>
<table border="1">
    <tr>
        <th>课程ID</th>
        <th>课程名</th>
        <th>学生ID</th>
        <th>学生名</th>
        <th>成绩</th>
    </tr>
    <%
        while(rs.next()){
    %>
    <tr>
        <td><%=rs.getInt(1)%></td>
        <td><%=rs.getString(2)%></td>
        <td><%=rs.getInt(3)%></td>
        <td><%=rs.getString(4)%></td>
        <td><%=rs.getInt(5)%></td>
        <td>
            <form name="delgrade" method="post" action="delgraderow">
                <input type="hidden" name="course_id" value="<%=rs.getInt(1)%>">
                <input type="hidden" name="student_id" value="<%=rs.getInt(3)%>">
                <input name="del" type="submit" value="删除">
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
<a href="grade.jsp"><input type="button" value="返回成绩界面"></a>
</body>
</html>
