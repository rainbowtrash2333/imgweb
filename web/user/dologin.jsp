<%--
  Created by IntelliJ IDEA.
  User: TS
  Date: 2018/8/25
  Time: 19:48
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" import="dao.UserDAO" %>
<html>
<head>
    <title>Dologin</title>
</head>
<body>
<jsp:useBean id="user" class="entity.User" scope="page"/>
<jsp:setProperty name="user" property="*"/>
<%
    UserDAO userDAO = new UserDAO();
    /*
    登陆成功，设置Cookie，重定向user.jsp页面
    登陆失败，重定向failure.jsp
     */
    if (userDAO.checkPassword(user)) {
        String name = request.getParameter("username");
        user = userDAO.queryUserByUsername(name);
        session.setAttribute("user",user);
        response.sendRedirect("./user.jsp?username="+user.getUsername());
//        request.getRequestDispatcher().forward(request, response);
    } else {
        response.sendRedirect("./login_failure.jsp");
    }
%>
<h1>test</h1>
</body>
</html>
