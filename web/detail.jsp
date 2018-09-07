<%@ page import="dao.ImgDAO" %>
<%@ page import="entity.Img" %>
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
    <script src="${pageContext.request.contextPath}/src/js/jquery-2.0.3.js"></script>
    <script src="${pageContext.request.contextPath}/src/js/jquery.swipebox.js"></script>
    <script src="${pageContext.request.contextPath}/src/js/showmore.js"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/src/css/swipebox.css">
    <style>
        .center {
            float: none;
            display: block;
            margin-left: auto;
            margin-right: auto;
        }
        html, body, div, h1, h3, h3, h4, h5, h6, ul, ol, dl, li, dt, dd, p, blockquote, pre, form, fieldset, table, th, td { margin: 0; padding: 0; font-family:Arial, Helvetica, sans-serif; }
        html					{ overflow-y:scroll; }
        #page   				{ margin:0 auto; padding:50px 0 0 0; }
        .block 					{ border:1px solid #ddd; line-height:18px; ; padding:15px; margin:0 0 20px 0; }
        .block h2,h1,h3,h4,h5,h6			{ color: #000000; border-bottom:2px solid #ddd;  font-weight:bold; padding:0 0 8px 0; margin:0 0 20px 0; }
        .block p				{ margin:0 0 20px 0; }

        /* Shore more styles */
        .showmore_content		{ position:relative; overflow:hidden; }
        .showmore_trigger 		{ width:100%; height:45px; line-height:45px; cursor:pointer; }
        .showmore_trigger span	{ display:block; }
    </style>

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
        <div class="col-md-10" style="border: 1px none rgba(148,148,148,0.19);border-right-style: solid;">
            <div class="row">
                <div class="col-md-12">
                    <a href="<%=img.getPath()%>" class="swipebox " title="My Caption">
                        <img src="<%=img.getPath()%>" alt="image" class="center img-responsive ">
                    </a>
                </div>
            </div>
            <div class="row"  id="page">
                <div class="col-md-12 block showmore_description">
                    <h2>
                        小马小马小马小马小马小马小马小马小马
                    </h2>
                    <p>
                        小马小马小马小马小马小马小马小马小马                        小马小马小马小马小马小马小马小马小马
                        小马小马小马小马小马小马小马小马小马                        小马小马小马小马小马小马小马小马小马
                        小马小马小马小马小马小马小马小马小马                        小马小马小马小马小马小马小马小马小马
                        小马小马小马小马小马小马小马小马小马                        小马小马小马小马小马小马小马小马小马
                        小马小马小马小马小马小马小马小马小马                        小马小马小马小马小马小马小马小马小马
                        小马小马小马小马小马小马小马小马小马                        小马小马小马小马小马小马小马小马小马
                        小马小马小马小马小马小马小马小马小马                        小马小马小马小马小马小马小马小马小马
                        小马小马小马小马小马小马小马小马小马                        小马小马小马小马小马小马小马小马小马

                    </p>

                </div>
            </div>
        </div>
        <div class="col-md-2">
            <p>testtesttesttesttesttesttesttettesttest testtettesttesttesttettesttesttesttette
                sttesttesttettesttesttesttettesttestte sttettesttesttesttettesttesttestte sttesttesttesttesttest</p>
        </div>
    </div>
</div>

<script type="text/javascript">
    ;(function ($) {

        $('.swipebox').swipebox();

    })(jQuery);
</script>

</body>
</html>
