<%--
Created by IntelliJ IDEA.
User: TS
Date: 2018/9/2
Time: 20:04
To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>

    <link rel="stylesheet" href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <title>UPLOAD</title>
</head>
<body>
<%--遮罩窗体--%>
<div class="container">
    <div class="row">
        <div class="col-md-12 column">
            <%--上传页面--%>
            <form role="form" action="doupload.jsp">
                <div class="form-group">
                    <div class="form-group">
                        <label for="update">文件输入</label><input type="file" id="update" name="update"/>

                    </div>
                    <div class="checkbox">
                        <label><input type="checkbox"/>
                            <p class="agreement">
                                同意<a href="#">XXXX条约</a>
                            </p></label>
                    </div>
                    <button type="submit" class="btn btn-default">上传</button>

                    <button type="submit" class="btn btn-default">上传</button>
                </div>
            </form>
        </div>
    </div>
</div>

<script src="https://cdn.bootcss.com/jquery/2.1.1/jquery.min.js"></script>
<script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</body>
</html>
