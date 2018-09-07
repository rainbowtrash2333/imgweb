package util;

import util.*;
import entity.*;
import dao.*;

public class Test {
    public static void main (String[] args) {
        User user = new User();
        UserDAO userDAO = new UserDAO();
        Img  img = new Img();
        ImgDAO imgDAO = new ImgDAO();

        img.setName("test");
        img.setPath("/"+"test");
        img.setUploader("za");
        imgDAO.insertImg(img);


    }
}
