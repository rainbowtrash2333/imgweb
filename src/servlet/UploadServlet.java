package servlet;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Paths;
import dao.ImgDAO;
import entity.Img;

import static util.CreateFileHelper.changeFileNameByDate;
import static util.CreateFileHelper.createFile;

@WebServlet("/upload")
@MultipartConfig
public class UploadServlet extends HttpServlet {
    protected void doPost (HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //获得长传者的username
        String username = request.getParameter("username");
        // 获得description
        String description = request.getParameter("description");
        System.out.println(description);
        // 获得uploadFile
        Part fileOldPart = request.getPart("uploadFile");
        // MSIE fix.
        String fileName = Paths.get(fileOldPart.getSubmittedFileName()).getFileName().toString();

        InputStream fileContent = fileOldPart.getInputStream();

        //创建file
//        String file = "D:\\img\\"+changeFileNameByDate(fileName);
        ServletContext context = this.getServletContext();
        String path = "img/upload/"+changeFileNameByDate(fileName);
        String file = context.getRealPath("/")+path;
        System.out.println(createFile(file));

        FileOutputStream fos = null;
        try {
            // 打开一个已存在文件的输出流
            fos = new FileOutputStream(file);
        } catch (FileNotFoundException e) {
            e.printStackTrace();
        }

        // 将输入流is写入文件输出流fos中
        int ch = 0;
        try {
            while ((ch = fileContent.read()) != -1) {
                fos.write(ch);
            }
        } catch (IOException e1) {
            e1.printStackTrace();
        } finally {
            //关闭输入流等（略）
            fos.close();
            fileContent.close();
        }

        Img img = new Img();
        img.setName(fileName);
        img.setPath("/"+path);
        img.setUploader(username);
//        System.out.println(img.getName());
//        System.out.println(img.getPath());
//        System.out.println(description);
//        System.out.println(img.getUploader());
        ImgDAO imgDAO = new ImgDAO();
        imgDAO.insertImg(img);



    }
    protected void doGet (HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    }
}
