package com.example.interceptor;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class LoginInterceptor implements HandlerInterceptor {
    @Override
    //请求之前，在请求方法之前
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        //System.out.println("preHandle:::" + request.getRequestURI());
        System.out.println("preHandle:::" + request.getRequestURL());
        StringBuffer url = request.getRequestURL();

        if (url.toString().endsWith("newsperson/login")||url.toString().endsWith("newsperson/reg")||url.toString().endsWith("index.html")) {
            return true;
        }else {
            //获取session对象
            Object o = request.getSession().getAttribute("loginNewsperson");
            if (o == null) {
                //传个参数
                request.setAttribute("msg", "请先登录");
                //没有登录过
                //response.sendRedirect("../login.jsp");
                //如果页面都在admin下
                request.getRequestDispatcher("/login.jsp").forward(request, response);
            }else {
                return true;
            }
        }
        return false;
    }

    @Override
    //请求通过，是方法里面的代码执行之后
    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception {
        System.out.println("postHandle");
    }

    @Override
    //请求完成，页面渲染完毕
    public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex) throws Exception {
        System.out.println("afterCompletion");
    }
}