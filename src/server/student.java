package server;

import java.sql.*;
import java.io.IOException;

import javax.servlet.*;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class student extends HttpServlet{
    public void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        req.setCharacterEncoding("utf8");
        req.setCharacterEncoding("utf8");

        Connection conn = null;
        Statement st = null;

        try {

            conn = link.getConnection();
            st = conn.createStatement();
            String studentname = req.getParameter("student_name");
            int studentid = Integer.parseInt(req.getParameter("student_id"));
            int studentage = Integer.parseInt(req.getParameter("student_age"));
            String studentgender = req.getParameter("student_gender");

            int check = st.executeUpdate("insert ignore into student(name,id,age,gender) values ('" + studentname + "'," + studentid + "," + studentage + ",'" + studentgender + "')");

            if (check != 0) {
                req.getSession().setAttribute("type", 1);//成功添加
            } else {
                req.getSession().setAttribute("type", 0);
            }
            res.sendRedirect("student.jsp");

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
