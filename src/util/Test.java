package util;

import dao.ImgDAO;
import entity.Img;
import dao.UserDAO;
import entity.User;

import java.util.ArrayList;

public class Test {
    public static void main (String[] args) {
//        ImgDAO dao = new ImgDAO();
//       ArrayList<Img> imgs = dao.getPathsByRandomly(4);
//
//
//        System.out.println(imgs.get(1).getTimestamp());
        UserDAO dao = new UserDAO();
        User user = dao.queryUserByUsername(null);
        System.out.println(user);
    }
}
