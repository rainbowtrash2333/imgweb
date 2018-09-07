<%--
  Created by IntelliJ IDEA.
  User: TS
  Date: 2018/9/2
  Time: 21:04
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<body>
<form action="uploadServlet" enctype="multipart/form-data"  method="post">
    文件上传支持以下格式："txt","doc","docx","xls","xlsx","ppt","pdf","xml","html","jpg","png"<br/>
    文件上传：<input type="file" name="file" size="80"/>
    <input type="submit" value="提交"><br/>
</form>
<span>${message}</span>

</body>

</body>
</html>
