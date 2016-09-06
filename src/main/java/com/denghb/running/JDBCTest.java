package com.denghb.running;

import java.sql.*;

/**
 * Created by denghb on 16/9/3.
 */
public class JDBCTest {
    public static void main(String[] args) {
        String driver = "com.mysql.jdbc.Driver";
        String dbName = "spring";
        String passwrod = "root";
        String userName = "root";
        String url = "jdbc:mysql://localhost:3306/" + dbName;
        String sql = "select * from users";

        try {
            Class.forName(driver);
            Connection conn = DriverManager.getConnection(url, userName,
                    passwrod);
            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                System.out.println("id : " + rs.getInt(1) + " name : "
                        + rs.getString(2) + " password : " + rs.getString(3));
            }

            try {
                // 关闭记录集
                if (rs != null) {
                    rs.close();
                }

                // 关闭声明
                if (ps != null) {
                    ps.close();
                }

                // 关闭链接对象
                if (conn != null) {
                    conn.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

}

