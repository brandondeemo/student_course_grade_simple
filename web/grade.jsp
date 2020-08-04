<%--
  Created by IntelliJ IDEA.
  User: wonpyeongson
  Date: 2020/07/31
  Time: 9:56 下午
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
    String querry_2 = "select * from student";

    Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection(url,username,pass);
    Statement st = con.createStatement();
    ResultSet rs = st.executeQuery(querry);

%>
<%
    if (session.getAttribute("type")==null){
        out.println("欢迎来到成绩信息界面");
    }else {
        if(request.getSession().getAttribute("type").toString().equals("0")){
            out.println("该成绩信息已经存在");
        }else if(request.getSession().getAttribute("type").toString().equals("1")) {
            out.println("成功添加！");
        }else if(request.getSession().getAttribute("type").toString().equals("2")){
            out.println("该成绩信息已成功删除");
        }else if(request.getSession().getAttribute("type").toString().equals("3")){
            out.println("输入成绩信息有误！");
        }else if(request.getSession().getAttribute("type").toString().equals("4")){
            out.println("欢迎回到成绩信息输入界面");
        }
    }
%>
<html>
<head>
    <title>server.grade</title>
</head>
<br>
<br>选择课程</br>
<form name="grade" method="post" action="grade">
    <div>
        <select name="selectcourse" id="course">
        <%
            while(rs.next()){
        %>
            <option value="<%=rs.getInt(1)%>"><%=rs.getString(2)%></option>
        <%
            }
            con.close();
            st.close();
        %>
        </select>
    </div>
    <br>选择学生</br>
    <div>
        <select name="selectstudent" id="student">
            <%
                con = DriverManager.getConnection(url,username,pass);
                st = con.createStatement();
                rs = st.executeQuery(querry_2);
                while(rs.next()){
            %>
                <option value="<%=rs.getInt(2)%>"><%=rs.getString(1)%></option>
            <%
                }
                con.close();
                st.close();
            %>
        </select>
    </div>
    <br>
    <div>
        输入分数<input type="text" name="score">
    </div>
    <br>
    <input type="submit" value="提交">
    <td><a href="showgrade.jsp"><input type="button" value="查看"></a></td>
    <td><a href="showstatistic.jsp"><input type="button" value="成绩分析"></a></td>

    <br>
    <br>
    <a href="course.jsp"><input type="button" value="返回课程界面"></a>


</form>
</body>
</html>
