<%--
  Created by IntelliJ IDEA.
  User: wonpyeongson
  Date: 2020/07/29
  Time: 7:18 下午
  To change this template use File | Settings | File Templates.
--%>


<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    if (session.isNew()) {
        out.println("欢迎来到美团课程-学生-成绩管理模型!");
    }else{
        if(request.getSession().getAttribute("type").toString().equals("0")){
            out.println("该课程已经存在");
        }else if(request.getSession().getAttribute("type").toString().equals("1")) {
            out.println("成功添加！");
        }else if(request.getSession().getAttribute("type").toString().equals("3")){
            out.println("输入课程信息有误！");
        }else if(request.getSession().getAttribute("type").toString().equals("4")){
            out.println("欢迎回到课程信息输入界面");
        }
    }

%>
<html>
<head>
    <title>server.course</title>
</head>
<script>
    function add() {
        document.course.action="server.course";
        document.course.submit();
    }

</script>

<body>
    <form name="course" method="POST" action="">
        <table>
            <tr>
                <td>新建课程id</td>
                <td><input name="course_id" /></td>
            </tr>
            <tr>
                <td>新建课程名称</td>
                <td><input name="course_name" /></td>
            </tr>
            <tr>
                <td><input type="button" value="添加" onclick="add()"></td>
                <td><a href="showcourse.jsp"><input type="button" value="查看"></a></td>
            </tr>
        </table>
    </form>
    <br><a href="student.jsp">进入学生信息界面</a></br>
    <br><a href="grade.jsp">进入成绩信息界面</a></br>
</body>
</html>
