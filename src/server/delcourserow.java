package server;

import java.sql.*;
import java.io.IOException;

import javax.servlet.*;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class delcourserow extends HttpServlet {
    public void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        req.setCharacterEncoding("utf8");
        req.setCharacterEncoding("utf8");

        Connection conn = null;
        Statement st = null;

        try {

            conn = link.getConnection();
            st = conn.createStatement();
            String coursename = req.getParameter("course_name");
            int courseid = Integer.parseInt(req.getParameter("course_id"));

            int check = st.executeUpdate("delete from course where course_id=" + courseid + " and course_name=\"" + coursename + "\"");

            res.sendRedirect("showcourse.jsp");

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
