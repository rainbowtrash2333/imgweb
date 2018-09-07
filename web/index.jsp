<%@ page import="java.util.ArrayList" %>
<%@ page import="dao.ImgDAO" %>
<%@ page import="entity.Img" %>
<%@ page import="entity.User" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <!--
		   _    _____         _
		   \`,""   ,'7"r-..__/ \
		  ,'\ `, ,',','    _/   \
		 /   \  7 / /     (   \ |
		J     \/ j  L______\  / |
		L   __JF"""/""\"\_,    /
		L,-"| O|  f O |  L_  _/
		F   \_ /  \__/   `-  j|
			.-'    `"""    ,' |          _..====.._
			\__/         r"_  A        ,' _..---.._`,
			 `-.______,,-L// / \  ___,' ,'_..:::.. `,`,
					  j   / / / 7"    `-<""=:'  '':. \ \
					 /   <,' /  F  . i , \   `,    :T W I
					 |    \,'  /    >X<  |     \   :| | L
					 |     `._/    ' ! ` |      I  :| |  G
					  \           \     /       |  :H T  |
					 __>-.__   __,-\   |        |  S P   |
					/     /|   | \  \  \_       | 'A R   |
				   /   __/ |   |  L  L   \      K./ /    L
				  /   |    |   4  I  I    |    E./ /   ,'
				 J    \    I    L F  I    |    // / _,'
		_________|     |   F    |J   F    |   //_/-'
		\   __   |    /   J     |/  J     |  /="
		\\  \_\  \__,' \  F     |   F     |
		\\\_____________\/      F__/      F
		 \\|  Twlight   |_____/  (______/
		  \/_Magic 101__/

-->
    <meta charset="utf-8">
    <title>**的网站</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- Bootstrap -->
    <link rel="stylesheet" href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <style>

        body {
            font-family: "Helvetica Neue", Helvetica, Arial, sans-serif;
            font-size: 14px;
            line-height: 1.428571429;
            color: #333333;
            background-color: #f4ecd7;
        }


    </style>

</head>
<body>

<%
    int imgCount = 5;//首页显示图片数
    ImgDAO imgdao = new ImgDAO();
    ArrayList<Img> paths = imgdao.getPathsRandomly(imgCount);
    User user = (User) session.getAttribute("user");
%>

<%--导航栏--%>
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
                <li class="active"><a href="${pageContext.request.contextPath}/index.jsp">主页</a></li>
                <li><a href="#">作者</a></li>
                <li><a href="#">关于</a></li>
            </ul>
            <ul class="nav navbar-nav navbar-right">
                <% if (user != null) { %>
                <li>
                    <div style='width:50px;height:50px;'>
                        <a href='${pageContext.request.contextPath}/user/user.jsp?username=<%=user.getUsername()%>'
                           style='display:block;width:auto;height:auto;border:0'>
                            <img src="<%=user.getAvatar()%>"
                                 class="img-circle img-responsive"/>
                        </a>
                    </div>

                </li>
                <li><a href="#">历史</a></li>
                <li><a href="${pageContext.request.contextPath}/upload.jsp" >上传</a></li>
                <% } else { %>
                <li><a href="${pageContext.request.contextPath}/user/register.html"><span
                        class="glyphicon glyphicon-user"></span> 注册</a></li>
                <li><a href="${pageContext.request.contextPath}/user/login.html"><span
                        class="glyphicon glyphicon-log-in"></span> 登录</a></li>
                <% } %>
            </ul>
        </div>
    </div>
</nav>


<div class="container" style="background-color:#ffffff">


    <%--头图--%>
    <div class="row">
        <br>
        <div class="container">
            <div class="row clearfix">
                <div class="col-md-12 column">
                    <div class="carousel slide" id="carousel-854874">
                        <ol class="carousel-indicators">
                            <li data-slide-to="0" data-target="#carousel-854874">
                            </li>
                            <li data-slide-to="1" data-target="#carousel-854874">
                            </li>
                            <li data-slide-to="2" data-target="#carousel-854874" class="active">
                            </li>
                        </ol>
                        <div class="carousel-inner">
                            <div class="item">
                                <img alt="" src="${pageContext.request.contextPath}/img/banner.jpg"/>
                                <div class="carousel-caption">
                                    <h4>
                                        First Thumbnail label
                                    </h4>
                                    <p>
                                        Cras justo odio, dapibus ac facilisis in, egestas eget quam. Donec id elit non
                                        mi porta gravida at eget metus. Nullam id dolor id nibh ultricies vehicula ut id
                                        elit.
                                    </p>
                                </div>
                            </div>
                            <div class="item">
                                <img alt="" src="${pageContext.request.contextPath}/img/banner.jpg"/>
                                <div class="carousel-caption">
                                    <h4>
                                        Second Thumbnail label
                                    </h4>
                                    <p>
                                        Cras justo odio, dapibus ac facilisis in, egestas eget quam. Donec id elit non
                                        mi porta gravida at eget metus. Nullam id dolor id nibh ultricies vehicula ut id
                                        elit.
                                    </p>
                                </div>
                            </div>
                            <div class="item active">
                                <img alt="" src="${pageContext.request.contextPath}/img/banner.jpg"/>
                                <div class="carousel-caption">
                                    <h4>
                                        Third Thumbnail label
                                    </h4>
                                    <p>
                                        Cras justo odio, dapibus ac facilisis in, egestas eget quam. Donec id elit non
                                        mi porta gravida at eget metus. Nullam id dolor id nibh ultricies vehicula ut id
                                        elit.
                                    </p>
                                </div>
                            </div>
                        </div>
                        <a class="left carousel-control" href="#carousel-854874" data-slide="prev"><span
                                class="glyphicon glyphicon-chevron-left"></span></a> <a class="right carousel-control"
                                                                                        href="#carousel-854874"
                                                                                        data-slide="next"><span
                            class="glyphicon glyphicon-chevron-right"></span></a>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <hr class="hr1">
    <br><br>

    <%--图片--%>
    <div class="row">
        <div class="col-md-8" style="border: 1px none #999999;border-right-style: solid;">


            <% SimpleDateFormat sdf = new SimpleDateFormat("yyyy年mm月dd日");
                for (int i = 0; i < imgCount; ++i) {
                    Date date = new Date(paths.get(i).getTimestamp().getTime());
                    String d = sdf.format(date);
            %>

            <div class="thumbnail">
                <a href="${pageContext.request.contextPath}/detail.jsp?id=<%=paths.get(i).getId()%>" class="thumbnail ">
                    <img src="<%=paths.get(i).getPath()%>" class="img-responsive center-block"
                         alt="通用的占位符缩略图">
                </a>
            </div>
            <hr>
            <p>UP主：<a href="${pageContext.request.contextPath}/user/user.jsp?<%=paths.get(i).getUploader()%>"
                      target="_blank"><%=paths.get(i).getUploader()%>
            </a>时间：<%=d%>
            </p>
            <hr>
            <%
                }
            %>

        </div>
        <div class="col-md-4">

        </div>
    </div>


    <ul class="pager">
        <li><a href="#">&laquo;</a></li>
        <li><a href="#">1</a></li>
        <li><a href="#">&raquo;</a></li>
    </ul>
</div>


<script src="https://cdn.bootcss.com/jquery/2.1.1/jquery.min.js"></script>
<script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

</body>
</html>