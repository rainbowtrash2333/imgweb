package util;

import java.sql.*;
import java.util.ArrayList;

public class DBHelper {
    // JDBC 驱动名及数据库 URL
    private static final String driver = "com.mysql.cj.jdbc.Driver";
    private static final String URL = "jdbc:mysql://localhost:3306/imgweb?useUnicode=true&characterEncoding=UTF-8&useSSL=false&serverTimezone=UTC ";

    // 数据库的用户名与密码，需要根据自己的设置
    private static final String USER = "ts";
    private static final String PASS = "ts123456";

    private static Connection conn = null;
private ArrayList<String> pathes = new ArrayList<String>();
    static {
        try {
            Class.forName(driver);
        } catch (Exception e) {
            System.out.println("forName 失败");
            e.printStackTrace();
        }

    }

    public static Connection getConnection() throws Exception {
        if (conn == null) {
            conn = DriverManager.getConnection(URL, USER, PASS);
            return conn;
        } else
            return conn;
    }

//    public ArrayList<String> getPathes() {
//        try {
//            Connection conn = getConnection();
//            Statement stmt = conn.createStatement();
//            String sql = "select path from imgweb.imgpath order by rand() limit 6;";
//            ResultSet rs = stmt.executeQuery(sql);
//            while (rs.next()) {
//                String path = rs.getString("path");
////                System.out.println(path);
//                pathes.add(path);
//            }
//        } catch (Exception e) {
//            e.printStackTrace();
//        }
//        return pathes;
//    }

//    public static void main(String[] args) {
//        DBHelper helper = new DBHelper();
//        ArrayList<String> pathes= helper.getPathes();
//        System.out.println(pathes.get(1));
//        for(String path : helper.getPathes()){
//            System.out.println(path);
//        }
//        System.out.println(helper.getPath());
//    }
}