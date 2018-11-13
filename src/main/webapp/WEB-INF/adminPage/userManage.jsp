<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8" import="java.util.*,com.cy.bean.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta charset="utf-8">
    <title>
        后台用户管理
    </title>
    <meta name="renderer" content="webkit">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <meta name="apple-mobile-web-app-status-bar-style" content="black">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="format-detection" content="telephone=no">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/x-admin.css" media="all">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/pag.css" media="all">
</head>

<body>
<div class="x-nav">
            <span class="layui-breadcrumb">
              <a><cite>首页</cite></a>
              <a><cite>用户管理</cite></a>
            </span>
    <a class="layui-btn layui-btn-small" style="line-height:1.6em;margin-top:3px;float:right"  href="adminFind.action" title="刷新"><i class="layui-icon" style="line-height:30px">ဂ</i></a>
</div>

<div class="tools">

</div>

<form class="layui-form x-center" action="search.action" method="post" style="width:85%">
    <div class="layui-form-pane">
        <div class="layui-form-item">
        <ul class="toolbar">
            <li onclick="user_management_add('添加用户','huser_management_add.jsp','600','500')"><span><img src="../images/t01.png" /></span>添加</li>
        </ul>
        <label class="layui-form-label">名称</label>
        <div class="layui-input-inline" style="width:80px">
            <input type="text" name="searchname" id="searchname"  placeholder="名称" autocomplete="off" class="layui-input">
        </div>
        <div class="layui-input-inline" style="width:80px">
            <button class="layui-btn"  lay-submit="" lay-filter="*" onclick="check()">搜索</button>
        </div>
        </div>
    </div>
</form>

<form method="post">
    <input type="hidden" id="num" name="num" >
    <table class="tablelist" lay-filter="demo">
        <thead>
        <tr>
            <th>ID</th>
            <th>名称</th>
            <th>密码</th>
            <th>性别</th>
            <th>年龄</th>
            <th>角色</th>
            <th>手机号</th>
            <th>状态</th>
            <th>存在状态</th>
            <th>操作</th>
        </tr>
        </thead>
        <tbody>
        <c:choose>
            <c:when test="${not empty requestScope.adminList.list}">
                <c:forEach items="${requestScope.adminList.list}"  var="admin" >
                    <tr>

                        <td name ="adstate">${admin.adminId} </td>
                        <td >${admin.adminName}
                            <!--     隐藏域 -->
                            <input type="hidden" id="adminName" name="adminName" value="${admin.adminName}"></td>
                        <td>${admin.password}</td>
                        <td>${admin.adminSex}</td>
                        <td>${admin.adminAge}</td>
                        <td>null</td>
                        <td>${admin.adminPhone}</td>
                        <c:if test="${admin.adminState=='启用'}">
                            <td class="td-status">
                                <button class="sp">${admin.adminState}</button>
                            </td>
                        </c:if>
                        <c:if test="${admin.adminState=='禁用'}">
                            <td class="td-status">
                                <button class="sp3">${admin.adminState}</button>
                            </td>
                        </c:if>
                        <c:if test="${admin.adminDetele=='存在'}">
                            <td class="td-status">
                                <button class="sp">${admin.adminDetele}</button>
                            </td>
                        </c:if>
                        <c:if test="${admin.adminDetele=='删除'}">
                            <td class="td-status">
                                <button class="sp2">${admin.adminDetele}</button>
                            </td>
                        </c:if>


                        <td class="td-manage">
                            <c:if test="${admin.adminState=='启用'}">
                                <a style="text-decoration:none" onclick="member_stop()"  href="stopState.action?name=${admin.adminName}" title="禁用">
                                    <i class="layui-icon">&#xe601;</i>
                                </a>
                            </c:if>
                            <c:if test="${admin.adminState=='禁用'}">
                                <a style="text-decoration:none" onclick="member_start()"  href="startState.action?name=${admin.adminName}" title="启用">
                                    <i class="layui-icon">&#xe62f;</i>
                                </a>
                            </c:if>
                            <a title="编辑" href="javascript:;" onclick="user_management_edit('编辑','userEditView.action?name=${admin.adminName}','4','','510')"
                               class="ml-5" style="text-decoration:none">
                                <i class="layui-icon">&#xe642;</i>
                            </a>
                            <a style="text-decoration:none"  onclick="newPassword(this)"
                               href="newPassword.action?name=${admin.adminName}" title="重置密码">
                                <i class="layui-icon">&#xe631;</i>
                            </a>
                            <a title="删除" href="userDetele.action?name=${admin.adminName}" onclick="member_del(this)"
                               style="text-decoration:none">
                                <i class="layui-icon">&#xe640;</i>
                            </a>
                        </td>
                    </tr>
                </c:forEach>
            </c:when>
        </c:choose>
        <tr>
            <td colspan="3" align="left">共有${adminList.total}条记录，当前第${adminList.pageNum}页，共${adminList.pages}页</td>
            <td colspan="9" align="right">
                <a href="#" onclick="chageNum(1)"   target="main">首页</a>
                <a href="#" onclick="chageNum(${adminList.prePage})"  target="main">上一页</a>
                <a href="#" onclick="chageNum(${adminList.nextPage})"   target="main">下一页</a>
                <a href="#" onclick="chageNum(${adminList.navigateLastPage})"   target="main">尾页</a>
            </td>
        </tr>
        </tbody>
    </table>
</form>

<script src="${pageContext.request.contextPath}/lib/layui/layui.js" charset="utf-8"></script>
<script src="${pageContext.request.contextPath}/js/x-layui.js" charset="utf-8"></script>
<script src="${pageContext.request.contextPath}/js/jquery2.js" charset="utf-8"></script>
<script src="${pageContext.request.contextPath}/js/js.js" charset="utf-8"></script>
<script>
    layui.use(['laydate','element','laypage','layer'], function(){
        $ = layui.jquery;//jquery
        lement = layui.element();//面包导航
        laypage = layui.laypage;//分页
        layer = layui.layer;//弹出层

    });


    /*用户-禁用*/
    function member_stop(){
        // var t=confirm("确定要禁用？");
        // var name=document.getElementById("adminName").value;
        // alert(name);
        // if(t==true){
        //     location.href="stopState.action?name="+name;
        //     layer.msg('已禁用!',{icon: 5,time:1000});
        // }else{
        //     location.href="adminFind.action";
        // }
    }

    /*用户-启用*/
    function member_start(){
        // var t=confirm("确定要启用？");
        // var name=document.getElementById("adminName").value;
        // alert(name);
        // if(t==true){
        //     location.href="startState.action?name="+name;
        //     layer.msg('已启用!',{icon: 6,time:1000});
        // }else{
        //     location.href="adminFind.action";
        // }

    }

    // 用户-编辑
    function user_management_edit (title,url,id,w,h) {
        x_admin_show(title,url,w,h);
    }

    //用户重置密码
    function newPassword(){
        // var t=confirm("确定要重置密码？");
        // var name=document.getElementById("adminName").value;
        // alert(name);
        // if(t==true){
        //     location.href="newPassword.action?name="+name;
        //     layer.msg('重置成功!',{icon: 6,time:1000});
        // }else{
        //     location.href="adminFind.action";
        // }

    }

    //用户删除
    function member_del(){
        // var t=confirm("确定要删除该用户？");
        // var name=document.getElementById("adminName").value;
        // alert(name);
        // if(t==true){
        //     location.href="userDetele.action?name="+name;
        //     layer.msg('删除成功!',{icon: 6,time:1000});
        // }else{
        //     location.href="adminFind.action";
        // }

    }

</script>
<script type="text/javascript">
    $('.tablelist tbody tr:odd').addClass('odd');
</script>
<script>


    function chageNum(num) {
        console.log(num);
        var form = $("form");
        form.action="${pageContext.request.contextPath}/adminPage/adminFind.action";
        $("input[name='num']").val(num);
        form.method="post";
        form.submit();
    }
</script>
</body>
</html>