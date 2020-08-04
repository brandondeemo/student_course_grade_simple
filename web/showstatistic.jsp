<%--
  Created by IntelliJ IDEA.
  User: wonpyeongson
  Date: 2020/08/02
  Time: 10:34 上午
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="server.info" %>
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
    <title>statistic</title>
</head>
<body>
<td>选择需分析科目</td>
<form name="analysis" method="post" action="analysis">
    <td><select name="selectcourse">
        <%
            while (rs.next()){
        %>
        <option value="<%=rs.getInt(1)%>"><%=rs.getString(2)%></option>
        <%
            }
            con.close();
            st.close();
        %>
    </select>
</td>
    <td>输入分数线</td>
    <td><input type="text" name="cutline" >
    </td>
    <input type="submit" value="分析">
</form>

<br>
<%
    info courseinfo = (info) request.getSession().getAttribute("info");
    if(courseinfo != null){
        out.println("id="+courseinfo.getid()+" 课程名："+courseinfo.getcoursename()+"  平均分数： "+
                courseinfo.getavg()+ "  最高分数为： "+courseinfo.getmax()+"  最低分数为： "+courseinfo.getmin()+
                " 超过"+courseinfo.getcutline()+"分的有 "+courseinfo.getcutnum()+" 人");
    }
%>
<br>
<a href="grade.jsp"><input type="button" value="返回成绩信息界面"></a>

</body>
</html>
