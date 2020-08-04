package server;

import java.sql.*;

public class link  {
    private static final String jdbcUrl = "jdbc:mysql://localhost:3306/studentsystem";
    private static final String username = "root";
    private static final String mysql_pass = "sunjian8844";

    static {
        try {
            Class.forName("com.mysql.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
    }

    public static Connection getConnection() throws SQLException {
        Connection conn = DriverManager.getConnection(jdbcUrl, username, mysql_pass);
        return conn;
    }

}
