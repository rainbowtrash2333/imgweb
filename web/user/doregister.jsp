<%@ page import="dao.UserDAO" %><%--
  Created by IntelliJ IDEA.
  User: TS
  Date: 2018/8/26
  Time: 11:04
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<% request.setCharacterEncoding("UTF-8");%>

<jsp:useBean id="user" class="entity.User" scope="page"/>
<jsp:setProperty name="user" property="*"/>
<%

    UserDAO dao = new UserDAO();
    if(dao.insertUser(user)){
request.getRequestDispatcher("/user/user.jsp").forward(request,response);
    }
    response.sendRedirect("/user/login_failure.jsp");
%>
</body>
</html>
