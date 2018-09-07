<%@ page import="entity.User" %>
<%@ page import="dao.UserDAO" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <title>Title</title>
</head>
<body>

<%
    request.setCharacterEncoding("UTF-8");
%>
<%
    //未登录, 跳转首页
    //    User user = null;
//    if (session.getAttribute("user") != null) {
//        user = (User) session.getAttribute("user");
//    } else {
//        response.sendRedirect("../index.jsp");
//    }

    //检擦request
    if(request.getParameter("username")==null||request.getParameter("username").length()==0){
        response.sendRedirect("../index.jsp");
        try{
            return;
        }catch (Exception e){
           e.printStackTrace();
        }
    }

    //查询user信息
    //访问者是否是用户页主人, 是,返回session信息; 否,查询数据库
    User user;
    String owner = request.getParameter("username");
    User visitor = (User) session.getAttribute("user");
    if (!visitor.getUsername().equals(owner)) {
        UserDAO userDAO = new UserDAO();
        user = userDAO.queryUserByUsername(owner);
    } else
        user = visitor;

%>
<h1><%=user.getUsername()%></h1>
<a href="/index.jsp">index</a>
</body>
</html>
