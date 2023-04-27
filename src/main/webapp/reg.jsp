<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" isErrorPage="true" %>
<% pageContext.setAttribute("ctx", request.getContextPath()); %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>注册</title>
</head>
<body>
${requestScope.msg}<br>
<form action="${ctx}/newsperson/reg" method="post">
    <input type="text" name="name" placeholder="请输入用户名"><span style="color: red;">${requestScope.errors.name}</span><br>
    <input type="password" name="password" placeholder="请输入密码"><span style="color: red;">${requestScope.errors.password}</span><br>
    <input type="password" name="cfmpassword" placeholder="请输入确认密码"><br>
    <input type="text" name="email" placeholder="请输入邮箱"><span style="color: red;">${requestScope.errors.email}</span><br>
    <input type="text" name="phone" placeholder="请输入手机号"><span style="color: red;">${requestScope.errors.phone}</span><br>
    <button>注册</button>
</form>
</body>
</html>
