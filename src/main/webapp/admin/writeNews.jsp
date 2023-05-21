<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" isELIgnored="false" isErrorPage="true" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>写科普信息页面</title>
    <link rel="stylesheet" type="text/css"
          href="${pageContext.request.contextPath}/static/jquery-easyui-1.3.3/themes/default/easyui.css">
    <%--<link href="${pageContext.request.contextPath}/layui/css/layui.css" rel="stylesheet" type="text/css">--%>
    <link href="//unpkg.com/layui@2.8.3/dist/css/layui.css" rel="stylesheet">
    <link rel="stylesheet" type="text/css"
          href="${pageContext.request.contextPath}/static/jquery-easyui-1.3.3/themes/icon.css">
    <script type="text/javascript"
            src="${pageContext.request.contextPath}/static/jquery-easyui-1.3.3/jquery.min.js"></script>
    <script type="text/javascript"
            src="${pageContext.request.contextPath}/static/jquery-easyui-1.3.3/jquery.easyui.min.js"></script>
    <script type="text/javascript"
            src="${pageContext.request.contextPath}/static/jquery-easyui-1.3.3/locale/easyui-lang-zh_CN.js"></script>

    <script type="text/javascript" src="${pageContext.request.contextPath}/static/wangEditor.js"></script>
</head>
<body style="margin: 10px">
<div id="p" class="easyui-panel" title="编写科普信息" style="padding: 10px">
    <table cellspacing="20px">
        <tr>
            <td width="80px">科普信息标题：</td>
            <td><input type="text" id="title" name="title" style="width: 400px;"/></td>
        </tr>
        <tr>
            <td>所属类别：</td>
            <td style="position: relative;
    z-index: 999;">
                <select class="easyui-combobox" style="width: 154px;" id="newsTypeId" name="newsType.id"
                        editable="false"
                        panelHeight="auto">
                    <option value="">请选择科普信息类别...</option>
                    <c:forEach var="newsType" items="${newsTypeCountList}">
                        <option value="${newsType.id }">${newsType.typeName }</option>
                    </c:forEach>
                </select>
            </td>
        </tr>
        <tr>
            <td valign="top">科普信息内容：</td>
            <td>
                <%--<script id="editor" type="text/plain" style="width:950px;height:500px;"></script>--%>
                <div id="editor" style="position: relative;
    z-index: 1;">
                </div>
            </td>
        </tr>
        <tr>
            <span id="pid">${loginNewsperson.id}</span>
            <span id="pname">${loginNewsperson.name}</span>
            <td>关键字：</td>
            <td><input type="text" id="keyWord" name="keyWord" style="width: 400px;"/>&nbsp;(多个关键字中间用空格隔开)
            </td>
        </tr>
        <tr>
            <td>文件上传</td>
            <td>
                <div class="layui-btn-container">
                    <button type="button" class="layui-btn layui-btn-normal" id="ID-upload-demo-choose">选择文件
                    </button>
                    <button type="button" class="layui-btn" id="ID-upload-demo-action">开始上传</button>
                    <input type="hidden" id="filename">
                </div>
            </td>
        </tr>
        <tr>
            <td></td>
            <td>
                <a href="javascript:submitData()" class="easyui-linkbutton"
                   data-options="iconCls:'icon-submit'">发布科普信息</a>
            </td>
        </tr>
    </table>
</div>
<%--<script type="text/javascript" src="${pageContext.request.contextPath}/layui/layui.js"></script>--%>
<script src="//unpkg.com/layui@2.8.3/dist/layui.js"></script>
<script type="text/javascript">
    layui.use(function () {
        var upload = layui.upload;
        var layer = layui.layer;
        // 渲染
        upload.render({
            elem: '#ID-upload-demo-choose',
            url: '/upload2', // 此处配置你自己的上传接口即可
            auto: false,
            accept: "file",
            // multiple: true,
            bindAction: '#ID-upload-demo-action',
            done: function (res) {
                layer.msg('上传成功');
                console.log(res)
                $("#filename").html(res.data)
            }
        });
    })
</script>

<script type="text/javascript">

    //实例化编辑器
    //建议使用工厂方法getEditor创建和引用编辑器实例，如果在某个闭包下引用该编辑器，直接调用UE.getEditor('editor')就能拿到相关的实例
    // var ue = UE.getEditor('editor');
    var E = window.wangEditor
    var editor = new E('#editor')
    // 或者 var editor = new E( document.getElementById('editor') )
    // 配置 server 接口地址
    editor.config.uploadImgServer = '/upload'
    editor.config.uploadFileName = 'files'
    editor.config.uploadImgMaxLength = 1
    editor.create()

    function submitData() {
        var title = $("#title").val();
        var newsTypeId = $("#newsTypeId").combobox("getValue");
        var content = editor.txt.html();
        var keyWord = $("#keyWord").val();
        var pid = $("#pid").text();
        var pname = $("#pname").text();
        var file = $("#filename").text();
        if (title == null || title == '') {
            alert("请输入标题！");
        } else if (newsTypeId == null || newsTypeId == '') {
            alert("请选择科普信息类别！");
        } else if (content == null || content == '') {
            alert("请输入内容！");
        } else {

            $.post("${pageContext.request.contextPath}/admin/news/save", {
                'title': title,
                'newsType.id': newsTypeId,
                'content': content,
                'contentNoTag': content,
                'summary': content.substr(0, 155),
                'keyWord': keyWord,
                'pid': pid,
                'pname': pname,
                'file':file
            }, function (result) {
                if (result.success) {
                    alert("科普信息发布成功！");
                    resetValue();
                } else {
                    alert("科普信息发布失败！");
                }
            }, "json");
        }
    }

    // 重置数据
    function resetValue() {
        $("#title").val("");
        $("#newsTypeId").combobox("setValue", "");
        // UE.getEditor('editor').setContent("");
        $("#keyWord").val("");
    }

</script>
</body>
</html>