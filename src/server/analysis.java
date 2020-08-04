package server;

import java.sql.*;
import java.io.IOException;

import javax.servlet.*;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class analysis extends HttpServlet {
    public void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        req.setCharacterEncoding("utf8");
        req.setCharacterEncoding("utf8");

        Connection conn = null;
        Statement st = null;

        try {

            conn = link.getConnection();
            st = conn.createStatement();
            int courseid = Integer.parseInt(req.getParameter("selectcourse"));
            int cutline = Integer.parseInt(req.getParameter("cutline"));

            String filter = "select count(course_student.grade) from course_student where course_student.course_id="+courseid+" and course_student.grade>"+cutline;
            String coursenamequerry="select course_name from course where course_id="+courseid;
            String avgquerry = "SELECT avg(grade),course_id FROM course_student where course_id="+courseid;
            String maxquerry = "select max(course_student.grade),course_id from course_student where course_student.course_id="+courseid;
            String minquerry = "select min(course_student.grade),course_id from course_student where course_student.course_id="+courseid ;


            ResultSet avgset = st.executeQuery(avgquerry);
            avgset.next();
            int avg = avgset.getInt(1);
            ResultSet maxset = st.executeQuery(maxquerry);
            maxset.next();
            int max = maxset.getInt(1);
            ResultSet minset = st.executeQuery(minquerry);
            minset.next();
            int min = minset.getInt(1);
            ResultSet numset = st.executeQuery(filter);
            numset.next();
            int num = numset.getInt(1);
            ResultSet nameset = st.executeQuery(coursenamequerry);
            nameset.next();
            String coursename = nameset.getString(1);

            System.out.println(""+courseid+coursename+" "+avg+" "+max+" "+min+ " "+cutline+" "+num);

            info courseinfo =new info(courseid,coursename,avg,max,min,cutline,num);

            req.getSession().setAttribute("info",courseinfo);
            res.sendRedirect("showstatistic.jsp");

        } catch (SQLException throwables) {
            throwables.printStackTrace();
        } finally {

            try {
                st.close();
            } catch (SQLException throwables) {
            }
            try {
                conn.close();
            } catch (SQLException throwables) {
            }
        }
    }
}
