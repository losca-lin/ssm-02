<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" isErrorPage="true" %>
<% pageContext.setAttribute("ctx", request.getContextPath()); %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>登录</title>
    <link href="${ctx}/layui/css/layui.css" rel="stylesheet">
    <link href="${ctx}/css/common.css" rel="stylesheet">
    <link href="${ctx}/css/login.css" rel="stylesheet">
</head>
<body>
<div class="layui-container">
    <div class="layui-row">
        <div class="layui-col-md-offset4 layui-col-md4">
            <form class="layui-form" action="${ctx}/newsperson/login" method="post">
                <h1 class="layui-input-block">欢迎注册</h1>
                <div class="layui-form-item">
                    <input type="text" class="layui-input" name="name" placeholder="请输入用户名">
                </div>
                <div class="layui-form-item">
                    <input type="text" class="layui-input" name="password" placeholder="请输入密码">
                </div>
                <div class="layui-form-item">
                    <button class="layui-btn layui-btn-fluid" lay-submit lay-filter="formDemo">登录</button>
                </div>
                <div class="layui-form-item">
                    <div class="layui-input-block">
                        <div class="layui-btn-group">
                            <a href="reg.jsp" class="layui-btn layui-btn-primary">注册</a>
                            <button type="reset" class="layui-btn layui-btn-warm">重置</button>
                        </div>
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>

</body>
</html>
