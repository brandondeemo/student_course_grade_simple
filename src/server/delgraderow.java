package server;

import java.sql.*;
import java.io.IOException;

import javax.servlet.*;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class delgraderow extends HttpServlet {
    public void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        req.setCharacterEncoding("utf8");
        req.setCharacterEncoding("utf8");

        Connection conn = null;
        Statement st = null;

        try {

            conn = link.getConnection();
            st = conn.createStatement();
            int courseid = Integer.parseInt(req.getParameter("course_id"));
            int studentid = Integer.parseInt(req.getParameter("student_id"));


            int check = st.executeUpdate("delete from course_student where course_id=" + courseid + " and student_id=" + studentid );

            res.sendRedirect("showgrade.jsp");

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
