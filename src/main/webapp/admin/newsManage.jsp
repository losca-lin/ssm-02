<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8" isELIgnored="false" isErrorPage="true"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>科普信息管理页面</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/jquery-easyui-1.3.3/themes/default/easyui.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/jquery-easyui-1.3.3/themes/icon.css">
<script type="text/javascript" src="${pageContext.request.contextPath}/static/jquery-easyui-1.3.3/jquery.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/jquery-easyui-1.3.3/jquery.easyui.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/jquery-easyui-1.3.3/locale/easyui-lang-zh_CN.js"></script>

<script type="text/javascript">

	function formatNewsType(val,row){
		return val.typeName;
	}
	
	function formatTitle(val,row){
		return "<a target='_blank' href='${pageContext.request.contextPath}/news/articles/"+row.id+".html'>"+val+"</a>"
	}
	
	function searchNews(){
		$("#dg").datagrid('load',{
			"title":$("#s_title").val() 
		});
	}
	
	function deleteNews(){
		var selectedRows=$("#dg").datagrid("getSelections");
		if(selectedRows.length==0){
			 $.messager.alert("系统提示","请选择要删除的数据！");
			 return;
		 }
		 var strIds=[];
		 for(var i=0;i<selectedRows.length;i++){
			 strIds.push(selectedRows[i].id);
		 }
		 var ids=strIds.join(",");
		 $.messager.confirm("系统提示","您确定要删除这<font color=red>"+selectedRows.length+"</font>条数据吗？",function(r){
				if(r){
					$.post("${pageContext.request.contextPath}/admin/news/delete",{ids:ids},function(result){
						if(result.success){
							 $.messager.alert("系统提示","数据已成功删除！");
							 $("#dg").datagrid("reload");
						}else{
							$.messager.alert("系统提示","数据删除失败！");
						}
					},"json");
				} 
	   });
	}

	function updateNewsStatus(){
		var selectedRows=$("#dg").datagrid("getSelections");
		if(selectedRows.length==0){
			$.messager.alert("系统提示","请选择要审核的数据！");
			return;
		}
		var strIds=[];
		for(var i=0;i<selectedRows.length;i++){
			strIds.push(selectedRows[i].id);
		}
		var ids=strIds.join(",");
		$.messager.confirm("系统提示","您确定要审核通过这<font color=red>"+selectedRows.length+"</font>条数据吗？",function(r){
			if(r){
				$.post("${pageContext.request.contextPath}/admin/news/update",{ids:ids},function(result){
					if(result.success){
						$.messager.alert("系统提示","数据已审核通过！");
						$("#dg").datagrid("reload");
					}else{
						$.messager.alert("系统提示","数据审核失败！");
					}
				},"json");
			}
		});
	}
	
	
	function openNewsModifyTab(){
		 var selectedRows=$("#dg").datagrid("getSelections");
		 if(selectedRows.length!=1){
			 $.messager.alert("系统提示","请选择一个要修改的科普信息！");
			 return;
		 }
		 var row=selectedRows[0];
		 window.parent.openTab('修改科普信息','modifyNews.jsp?id='+row.id,'icon-writenews');
		 // window.parent.openTab('修改科普信息','writeNews.jsp?id='+row.id,'icon-writenews');
	}
	
</script>
</head>
<body style="margin: 1px">
<table id="dg" title="科普信息管理" class="easyui-datagrid"
   fitColumns="true" pagination="true" rownumbers="true"
   url="${pageContext.request.contextPath}/admin/news/list" fit="true" toolbar="#tb">
   <thead>
   	<tr>
   		<th field="cb" checkbox="true" align="center"></th>
   		<th field="id" width="20" align="center">编号</th>
   		<th field="title" width="180" align="center" formatter="formatTitle">标题</th>
   		<th field="releaseDate" width="50" align="center">发布日期</th>
   		<th field="newsType" width="50" align="center" formatter="formatNewsType">科普信息类别</th>
   		<th field="status" width="50" align="center">状态</th>
   	</tr>
   </thead>
 </table>
 <div id="tb">
 	<div>
 		<a href="javascript:openNewsModifyTab()" class="easyui-linkbutton" iconCls="icon-edit" plain="true">修改</a>
 		<a href="javascript:deleteNews()" class="easyui-linkbutton" iconCls="icon-remove" plain="true">删除</a>
 		<a href="javascript:updateNewsStatus()" class="easyui-linkbutton" iconCls="icon-ok" plain="true">审核通过</a>
 	</div>
 	<div>
 		&nbsp;标题：&nbsp;<input type="text" id="s_title" size="20" onkeydown="if(event.keyCode==13) searchNews()"/>
 		<a href="javascript:searchNews()" class="easyui-linkbutton" iconCls="icon-search" plain="true">搜索</a>
 	</div>
 </div>
</body>
</html>