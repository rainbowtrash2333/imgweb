package dao;

import entity.User;
import util.DBHelper;

import javax.servlet.http.Cookie;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

public class UserDAO {

    public User queryUserByUsername (String name) {
        Connection conn = null;
        Statement stmt = null;
        ResultSet rs = null;
        User u = new User();
        if (name != null && name.length() > 0) {
            try {
                conn = DBHelper.getConnection();
                stmt = conn.createStatement();
                String sql = String.format("select * from imgweb.users where username = \"%s\";", name);
                rs = stmt.executeQuery(sql);
                if (rs.next()) {
                    u.setUsername(rs.getString("username"));
                    u.setE_mail(rs.getString("e-mail"));
                    u.setPassword(rs.getString("password"));
                    u.setAvatar(rs.getString("avatar"));
                    u.setCreate_date(rs.getDate("create_date"));
                    u.setTimestamp(rs.getTimestamp("change_date"));
                }
            } catch (Exception e) {
                e.printStackTrace();
            } finally {
                if (stmt != null) {
                    try {
                        stmt.close();
                    } catch (Exception e) {
                        e.printStackTrace();
                    }
                }
                if (rs != null) {
                    try {
                        rs.close();
                    } catch (Exception e) {
                        e.printStackTrace();
                    }
                }
            }
            return u;
        }else
            return null;

    }

    public Boolean insertUser (User user) {
        Connection conn = null;
        PreparedStatement ptmt = null;
        if (user.getUsername() != null && user.getPassword() != null && user.getE_mail() != null) {
            //判断用户名是否存在
            if (queryUserByUsername(user.getUsername()).getPassword() == null) {
                try {
                    conn = DBHelper.getConnection();
                    String sql = String.format("insert into imgweb.users (`username`,`e-mail`,`password`,`create_date`) values (\"%s\",\"%s\",\"%s\",NOW());", user.getUsername(), user.getE_mail(), user.getPassword());
                    ptmt = conn.prepareStatement(sql);
                    ptmt.execute();
                    return true;
                } catch (Exception e) {
                    e.printStackTrace();
                } finally {
                    if (ptmt != null) {
                        try {
                            ptmt.close();
                        } catch (Exception e) {
                            e.printStackTrace();
                        }
                    }
                }
            }
        }
        return false;
    }

    public Boolean checkPassword (User user) {
        if (user.getUsername() != null && user.getPassword() != null) {
            return (user.getPassword().equals(queryUserByUsername(user.getUsername()).getPassword()));
        }
        return false;
    }


}
