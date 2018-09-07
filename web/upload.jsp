<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="entity.User" %>
<!DOCTYPE html>
<html lang="zh">
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <title>UPLOAD</title>
</head>
<body>
<%
//    未登录, 跳转首页
        User user = new User();
    if (session.getAttribute("user") != null) {
        user = (User) session.getAttribute("user");
    } else {
        response.sendRedirect("../index.jsp");
    }
%>
<div class="container">
    <div class="row">
        <div class="4 col-md-offset-4">
            <!--来源于https://www.jianshu.com/p/41ae10158d35-->
            <form method="post" action="/servlet/UploadServlet" enctype="multipart/form-data">
                选择一个文件:
                <input type="file" name="uploadFile" />
                <input name="username" value="<%=user.getUsername()%>">
                <textarea name="description" id="description" cols="30" rows="10"></textarea>
                <br/><br/>
                <input type="submit" value="上传" />
            </form>
        </div>
    </div>
</div>
<!--js文件-->

</body>
</html>