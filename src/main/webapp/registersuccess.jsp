<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" isELIgnored="false" isErrorPage="true" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>注册成功</title>
    <script type="text/javascript" src="${ctx}/webjars/jquery/3.3.1-2/jquery.min.js"></script>
    <script type="text/javascript">
        window.onload = function f() {
            var i =5;
            var a = setInterval(function () {
                i--;
                if(i<=0){
                    document.getElementById("p1").innerHTML = "注册成功，返回登录界面";
                    clearInterval(a);
                    location = "../login.jsp";
                }else {
                    document.getElementById("p1").innerHTML = "注册成功,还有"+i+"秒跳转回登录界面";
                    return false;
                }
            },1000)
        }
    </script>
</head>
<body style="text-align: center;margin: auto">
<h2>注册成功</h2>
<br>
<br>
<p id="p1">注册成功,还有5秒跳转回登录界面</p>
</body>
</html>