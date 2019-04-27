<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title></title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- 引入bootstrap -->
    <link rel="stylesheet" type="text/css" href="/css/bootstrap.min.css">
    <!-- 引入JQuery  bootstrap.js-->
    <script src="/js/jquery-3.2.1.min.js"></script>
    <script src="/js/bootstrap.min.js"></script>
    <style type="text/css">
        body {
            background: url(images/a.jpg) repeat;
        }

        #login-box {
            /*border:1px solid #F00;*/
            padding: 35px;
            border-radius: 15px;
            background: #56666B;
            color: #fff;
        }

    </style>
    <script>
        function checkUserName() {
            var username = $("#userID").val();
            var url = '/user/exist?username=' + username;
            $.getJSON(
                url,
                //处理数据 data指向的是返回来的JSON数据
                function (data) {
                    var code = data.retCode;
                    if(code==1){
                        $("#username_message").attr("style","color: green")
                        $("#submit").attr("disabled","true");
                        $("#username_message").html(data.message)
                    }
                    if(code==-1){
                        $("#username_message").attr("style","color: red")
                        $("#submit").attr("disabled","true");
                        $("#username_message").html(data.message)
                    }
                }
            )
        }

        function checkPassword() {
            var username = $("#userID").val();
            if(username==null || username==''){
                $("#submit").attr("disabled","disabled");
                $("#username_message").attr("style","color: red")
                $("#username_message").html('用户名不能为空')
            }
            var password = $("#password").val();
            var url = '/user/pass?username=' + username+'&password='+password;
            $.getJSON(
                url,
                //处理数据 data指向的是返回来的JSON数据
                function (data) {
                    var code = data.retCode;
                    if(code==1){
                        $("#password_message").attr("style","color: green")
                        $("#submit").removeAttr("disabled");
                        $("#password_message").html(data.message)
                    }
                    if(code==-1){
                        $("#password_message").attr("style","color: red")
                        $("#submit").attr("disabled","true");
                        $("#password_message").html(data.message)
                    }
                }
            )
        }
    </script>
</head>
<body>
<div class="container" id="top">
    <div class="row" style="margin-top: 280px; ">
        <div class="col-md-4"></div>
        <div class="col-md-4" id="login-box">
            <form class="form-horizontal" role="form" action="/login" id="from1" method="post">
                <div class="form-group">
                    <label for="firstname" class="col-sm-3 control-label">用户id</label>
                    <div class="col-sm-9">
                        <input type="text" class="form-control" id="userID" placeholder="请输入名字" name="username"
                               oninput="checkUserName()">
                        <span id="username_message" style="color: red"></span>
                    </div>
                </div>
                <div class="form-group">
                    <label for="lastname" class="col-sm-3 control-label">密码</label>
                    <div class="col-sm-9">
                        <input type="password" class="form-control" id="password" placeholder="请输入密码" name="password"
                        oninput="checkPassword()">
                        <span id="password_message" style="color: red"></span>
                    </div>
                </div>
                <%--<div class="form-group">--%>
                <%--<div class="col-sm-offset-2 col-sm-10">--%>
                <%--<div class="checkbox">--%>
                <%--<label class="checkbox-inline">--%>
                <%--<input type="radio" name="role" value="1" checked>管理员--%>
                <%--</label>--%>
                <%--<label class="checkbox-inline">--%>
                <%--<input type="radio" name="role" value="2">老师--%>
                <%--</label>--%>
                <%--<label class="checkbox-inline">--%>
                <%--<input type="radio" name="role" value="3">学生--%>
                <%--</label>--%>
                <%--</div>--%>
                <%--</div>--%>
                <%--</div>--%>
                <div class="form-group pull-right" style="margin-right: 15px;">
                    <div class="col-sm-offset-2 col-sm-10">
                        <button type="submit" id="submit" class="btn btn-default btn-info">登录</button>
                    </div>
                </div>
            </form>
        </div>
        <div class="col-md-4"></div>
    </div>
</div>
</body>
</html>