package util;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;


public class CreateFileHelper {
    //创建文件夹，成功返回true， 失败返回false
    public static boolean createDir (String dirName) {
        File dir = new File(dirName);

        if (dir.exists()) {
            System.out.println("the directory " + dirName + " is exits");
            return false;
        }
        if (!dirName.endsWith(File.separator)) {
            dirName = dirName + File.separator;
        }
        if (dir.mkdirs()) {
            System.out.println("created " + dirName + " successfully");
            return true;
        } else {
            System.out.println("created " + dirName + " unsuccessfully");
            return false;
        }
    }

    //创建文件
    public static boolean createFile (String destFileName) {
        File file = new File(destFileName);
        if (file.exists()) {
            System.out.println("file " + destFileName + " is exits");
            return false;
        }
        if (destFileName.endsWith(File.separator)) {
            System.out.println("创建单个文件 " + destFileName + " 失败，目标文件不能为目录！");
            return false;
        }
        //判断目标文件所在的目录是否存在
        if (!file.getParentFile().exists()) {
            //如果目标文件所在的目录不存在，则创建父目录
            System.out.println("the directory is not exits，create it");
            if (!file.getParentFile().mkdirs()) {
                System.out.println("created directory unsuccessfully");
                return false;
            }
        }
        //创建目标文件
        try {
            if (file.createNewFile()) {
                System.out.println("created " + destFileName + " successfully");
                return true;
            } else {
                System.out.println("created " + destFileName + " unsuccessfully");
                return false;
            }
        } catch (IOException e) {
            e.printStackTrace();
            System.out.println("created " + destFileName + " unsuccessfully " + e.getMessage());
            return false;
        }
    }

    //文件重命名

    public static String changeFileNameByDate (String dirName) {
        Date date = new Date();
        SimpleDateFormat dsf = new SimpleDateFormat("yy/MM/dd_HH_mm_ss");
        return dsf.format(date) + dirName.substring(dirName.lastIndexOf("."));
    }
}
