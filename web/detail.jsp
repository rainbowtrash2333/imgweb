<%@ page import="dao.ImgDAO" %>
<%@ page import="entity.Img" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="dao.ImgDAO" %>
<%@ page import="dao.UserDAO" %>
<%@ page import="entity.User" %>
<%--
  Created by IntelliJ IDEA.
  User: TS
  Date: 2018/8/23
  Time: 19:31
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css">
</head>
<body>
<%
    Img img = new Img();
    User user = (User) session.getAttribute("user");
    if (request.getParameter("id") != null) {
        int id = Integer.parseInt(request.getParameter("id"));
        ImgDAO imgdao = new ImgDAO();
        img = imgdao.getImgById(id);
    } else {
        response.sendRedirect("/index.jsp");
    }
%>
<nav class="navbar navbar-inverse">
    <div class="container-fluid">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="#">我的网站</a>
        </div>
        <div class="collapse navbar-collapse" id="myNavbar">
            <ul class="nav navbar-nav">
                <li class="active"><a href="/index.jsp">主页</a></li>
                <li><a href="#">作者</a></li>
                <li><a href="#">关于</a></li>
            </ul>
            <ul class="nav navbar-nav navbar-right">
                <% if (user != null) { %>
                <li>
                    <div style='width:50px;height:50px;'>
                        <a href='/user/user.jsp' style='display:block;width:auto;height:auto;border:0px'>
                            <img src="<%=user.getAvatar()%>"
                                 class="img-circle img-responsive"/>
                        </a>
                    </div>

                </li>
                <li><a href="#">历史</a></li>
                <li><a href="#">上传</a></li>
                <% } else { %>
                <li><a href="/user/register.html"><span class="glyphicon glyphicon-user"></span> 注册</a></li>
                <li><a href="/user/login.html"><span class="glyphicon glyphicon-log-in"></span> 登录</a></li>
                <% } %>
            </ul>
        </div>
    </div>
</nav>
<div class="container">

    <div class="row">
        <div class="col-md-9">
            <img src="<%=img.getPath()%>" alt="通用的占位符缩略图" class="img-responsive"/>
        </div>
        <div class="col-md-3">
            <p>testtesttesttesttesttesttesttettesttest testtettesttesttesttettesttesttesttette
                sttesttesttettesttesttesttettesttestte sttettesttesttesttettesttesttestte sttesttesttesttesttest</p>
        </div>
    </div>
</div>


<script src="https://cdn.bootcss.com/jquery/2.1.1/jquery.min.js"></script>
<script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</body>
</html>
