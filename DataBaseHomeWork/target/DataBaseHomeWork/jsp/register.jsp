<%--
  Created by IntelliJ IDEA.
  User: 97347
  Date: 2019/4/30
  Time: 16:52
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <title>图书管理系统登录</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" type="text/css" href="../resources/css/font.css">
    <link rel="stylesheet" type="text/css" href="../resources/css/xadmin.css">
    <link rel="stylesheet" type="text/css" href="../resources/css/swiper.min.css">
    <script src="../resources/lib/layui/layui.js" type="text/javascript" ></script>
    <script type="text/javascript" src="../resources/js/jquery.min.js"></script>
    <script type="text/javascript" src="../resources/js/jquery-2.0.0.min.js"></script>
    <script type="text/javascript" src="../resources/js/swiper.jquery.min.js"></script>
    <script src="../resources/lib/layui/layui.js" charset="utf-8"></script>
    <script type="text/javascript" src="../resources/js/xadmin.js"></script>
</head>
<body>
<!-- 中部开始 -->
<div class="wrapper">
    <!-- 右侧主体开始 -->
    <div class="page-content">
        <div class="content">
            <!-- 右侧内容框架，更改从这里开始 -->
            <div class="layui-form">
                <div class="layui-form-item">
                    <label for="uphone" class="layui-form-label"> <span
                            class="x-red">*</span>手机号
                    </label>
                    <div class="layui-input-inline">
                        <input type="text" id="uphone" name="email" required=""
                               lay-verify="nikename" autocomplete="off" class="layui-input">
                    </div>
                    <div class="layui-form-mid layui-word-aux">
                        <span class="x-red">*</span>将会成为您唯一的登入名
                    </div>
                </div>
                <div class="layui-form-item">
                    <label for="uname" class="layui-form-label"> <span
                            class="x-red">*</span>昵称
                    </label>
                    <div class="layui-input-inline">
                        <input type="text" id="uname" name="uname" required=""
                               lay-verify="nikename" autocomplete="off" class="layui-input">
                    </div>
                </div>
                <label class="layui-form-label">性别</label>
                <div class="layui-input-inline">
                    <select name="quiz1" id="usex">
                        <option value="男">男</option>
                        <option value="女">女</option>
                    </select>
                </div>
                <div class="layui-form-item">
                    <label for="upass" class="layui-form-label"> <span
                            class="x-red">*</span>密码
                    </label>
                    <div class="layui-input-inline">
                        <input type="password" id="upass" name="upass" required=""
                               lay-verify="pass" autocomplete="off" class="layui-input">
                    </div>
                    <div class="layui-form-mid layui-word-aux">6到16个字符</div>
                </div>
                <div class="layui-form-item">
                    <label for="L_repass" class="layui-form-label"> <span
                            class="x-red">*</span>确认密码
                    </label>
                    <div class="layui-input-inline">
                        <input type="password" id="L_repass" name="repass" required=""
                               lay-verify="repass" autocomplete="off" class="layui-input">
                    </div>
                </div>
                <div class="layui-form-item">
                    <label for="L_repass" class="layui-form-label"> </label>
                    <button class="layui-btn" lay-filter="add" lay-submit="" onclick="register()">注册</button>
                    <button class="layui-btn" lay-filter="demo1" onclick="javascript :history.back(-1)">返回</button>
                </div>
            </div>
            <!-- 右侧内容框架，更改从这里结束 -->
        </div>
    </div>
    <!-- 右侧主体结束 -->
</div>
<!-- 中部结束 -->
<script type="text/javascript">
    function register(){
        var uphone = document.getElementById("uphone").value;
        var upass = document.getElementById("upass").value;
        var uname = document.getElementById("uname").value;
        var usex = document.getElementById("usex").value;
        $.ajax({
            type : "POST",
            url : "/DataBaseHomeWork/useres/register",
            async : false ,
            data : {
                uphone : uphone,
                upass : upass,
                uname : uname,
                usex : usex,
            },
            dataType : "json",
            success : function(msg){
                if(msg.flag>0){
                    layer.msg('注册成功哦~', {
                        async : false ,
                        time: 10000, //10s后自动关闭
                        btn: ['好的'],
                        btn1: function(){
                            goon();
                        }
                    });
                }
                else{
                    //配置一个透明的询问框
                    layer.msg('你的输入信息有误哦~', {
                        async : false ,
                        time: 10000, //10s后自动关闭
                        btn: ['知道了']
                    });
                    return false
                }
            },
            error : function(XMLHttpRequest, textStatus, errorThrown){
                alert(XMLHttpRequest.status);
                alert(XMLHttpRequest.readyState);//状态
                alert(textStatus);//错误信息
            }
        });
    }

    function goon(){
        window.location.href = './login.jsp';
    }
</script>

</body>
</html>
