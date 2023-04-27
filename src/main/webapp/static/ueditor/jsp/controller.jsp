<%@ page language="java" contentType="text/html; charset=gbk"
	import="com.baidu.ueditor.ActionEnter"
    pageEncoding="gbk"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%

    request.setCharacterEncoding( "gbk" );
	response.setHeader("Content-Type" , "text/html");
	
	String rootPath = application.getRealPath( "/" );
	//rootPath = "E:\\eclipse_workspace\\Blog\\";
	//rootPath = rootPath.replace("Blog\\","");
	System.out.println(rootPath);
	out.write( new ActionEnter( request, rootPath ).exec() );
	
%>