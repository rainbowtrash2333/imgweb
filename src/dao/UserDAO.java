package dao;

import entity.User;
import util.DBHelper;

import java.io.File;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.Date;

public class UserDAO {
    //查询用户
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
        } else
            return null;

    }

    //添加用户
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

    //检擦密码
    public Boolean checkPassword (User user) {
        if (user.getUsername() != null && user.getPassword() != null) {
            return (user.getPassword().equals(queryUserByUsername(user.getUsername()).getPassword()));
        }
        return false;
    }

    //上传图片
    public void uploadImg (File i, String username) throws IOException {
        SimpleDateFormat df = new SimpleDateFormat("yyyy"+File.separator+"MM"+File.separator);
        String path = df.format(new Date());
//        File path = new File(date);
        File img = new File(path+i);
        if(img.exists()){
            File newImg = new File(new SimpleDateFormat("dd_HH_mm_ss").format(new Date()));
            if (newImg.exists())
                throw new java.io.IOException("file exists");
            boolean success = img.renameTo(newImg);
            if (!success) {
                System.out.println("success");
            }
        }

    }


}
