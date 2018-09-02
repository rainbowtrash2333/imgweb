package util;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.Statement;

public class temp {
    public static void main (String[] args) {
        for (int i = 0; i < 15; ++i) {
            try{
                Connection conn = DBHelper.getConnection();

                String sql = String.format("insert into imgweb.img (`name`,`path`) values (\"%d.jpg\",\"/img/%d.jpg\")",i,i);
                PreparedStatement stmt = conn.prepareStatement(sql);
                stmt.execute();
                System.out.println(1);
            }catch (Exception e){
                e.printStackTrace();
            }
        }
    }
}
