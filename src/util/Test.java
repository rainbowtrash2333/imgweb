package util;

import dao.ImgDAO;
import entity.Img;
import dao.UserDAO;
import entity.User;
import  util.DBHelper;
import java.io.File;
import java.sql.Connection;
import java.sql.Statement;

public class Test {
    public static void main (String[] args) {
        String path = "C:\\Users\\TS\\Desktop\\temp";
        File f1 = new File(path);
        if (f1.isDirectory()) {
            System.out.println("目录:" + path);
            String[] list = f1.list();
            for (String s : list) {
                File f = new File(path + "\\" + s);
                if (f.isDirectory()) {
                    System.out.println(s + " 是一个目录");
                } else {
                    System.out.println(s + " 是一个文件");
                }
            }

        }else{
            System.out.println(path + " 不是一个目录");
        }
//        Connection conn ;
//        Statement stmt = null;
//        try{
//            conn = DBHelper.getConnection();
//            stmt = conn.createStatement();
//            String sql= "DBHelper.getConnection()";
//        }catch (Exception e){
//            e.printStackTrace();
//        }

    }
}
