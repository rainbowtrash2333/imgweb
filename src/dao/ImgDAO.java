package dao;

import entity.Img;
import util.DBHelper;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

public class ImgDAO {
    //通过id返回img
    public Img getImgById (int id) {
        Connection conn;
        Statement stmt = null;
        ResultSet rs = null;
        Img img = new Img();
        try {
            conn = DBHelper.getConnection();
            stmt = conn.createStatement();
            String sql = String.format("select * from imgweb.img where id = %d;", id);
            rs = stmt.executeQuery(sql);
            while (rs.next()) {
                img.setId(rs.getInt("id"));
                img.setName(rs.getString("name"));
                img.setPath(rs.getString("path"));
                img.setUploader(rs.getString("uploader"));
                img.setTimestamp(rs.getTimestamp("create_time"));
                img.setLike(rs.getInt("like"));
                img.setDislike(rs.getInt("dislike"));
                img.setLabel(rs.getString("Label"));
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
        return img;
    }

    //随机返回n个path
    public ArrayList<Img> getPathsRandomly (int n) {
        Connection conn;
        Statement stmt = null;
        ResultSet rs = null;
        ArrayList<Img> imgs = new ArrayList<>();

        try {
            conn = DBHelper.getConnection();
            stmt = conn.createStatement();
            String sql = String.format("select * from imgweb.img order by rand() limit %d;", n);
            rs = stmt.executeQuery(sql);
            while (rs.next()) {
                Img img = new Img();
                img.setId(rs.getInt("id"));
                img.setName(rs.getString("name"));
                img.setPath(rs.getString("path"));
                img.setUploader(rs.getString("uploader"));
                img.setTimestamp(rs.getTimestamp("create_time"));
                img.setLike(rs.getInt("like"));
                img.setDislike(rs.getInt("dislike"));
                img.setLabel(rs.getString("Label"));
                imgs.add(img);
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
        return imgs;
    }

    //插入img
    public void insertImg (Img img) {
        Connection conn = null;
        PreparedStatement ptmt = null;

        //判断用户名是否存在
        try {
            conn = DBHelper.getConnection();
            String sql = String.format("insert into imgweb.img (name, path,uploader)values(\"%s\",\"%s\",\"%s\");", img.getName(), img.getPath(), img.getUploader());
            ptmt = conn.prepareStatement(sql);
            ptmt.execute();
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

