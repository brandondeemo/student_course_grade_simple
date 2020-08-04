package server;

import java.sql.*;
import java.io.IOException;

import javax.servlet.*;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class delstudentrow  extends HttpServlet{
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

            int check = st.executeUpdate("delete from student where name=\"" + studentname + "\" and id=" + studentid + " and age="+ studentage+" and gender= \""+studentgender+"\"");

            if (check != 0){
                req.getSession().setAttribute("type",2);
            }else{
                req.getSession().setAttribute("type",3);
            }
            res.sendRedirect("showstudent.jsp");

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
