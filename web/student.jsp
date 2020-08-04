<%--
  Created by IntelliJ IDEA.
  User: wonpyeongson
  Date: 2020/07/31
  Time: 9:56 下午
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>server.student</title>
</head>

<%
    if (session.getAttribute("type")==null){
        out.println("欢迎来到学生信息界面");
    }else {
        if(request.getSession().getAttribute("type").toString().equals("0")){
            out.println("该学生信息已经存在");
        }else if(request.getSession().getAttribute("type").toString().equals("1")) {
            out.println("成功添加！");
        }else if(request.getSession().getAttribute("type").toString().equals("3")){
            out.println("输入学生信息有误！");
        }else if(request.getSession().getAttribute("type").toString().equals("4")){
            out.println("欢迎回到学生信息输入界面");
        }
    }
%>


<script>
    function add() {
        document.student.action="addstudent";
        document.student.submit();
    }
</script>

<body>
    <form name="student" method="post" action="">
        <table>
            <tr>
                <td>学生姓名</td>
                <td><input name="student_name"></td>
            </tr>
            <tr>
                <td>学生id</td>
                <td><input name="student_id"></td>
            </tr>
            <tr>
                <td>学生年龄</td>
                <td><input name="student_age"></td>
            </tr>
            <tr>
                <td>学生性别</td>
                <td><select name="student_gender">
                    <option value="男">男</option>
                    <option value="女">女</option>
                </select></td>
            </tr>
            <tr>
                <td><input type="button" value="添加" onclick="add()"></td>
                <td><a href="showstudent.jsp"><input type="button" value="查看"></a></td>
            </tr>
        </table>
    </form>
    <%
        session.setAttribute("type",4);
    %>
    <br><a href="course.jsp">进入课程信息界面</a></br>
    <br><a href="grade.jsp">进入成绩信息界面</a></br>

</body>
</html>
