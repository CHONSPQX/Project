<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zh-cn">

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no"/>
    <meta name="renderer" content="webkit">
    <title>用户登录</title>

    <link rel="stylesheet" href="http://www.pintuer.com/css/pintuer.css">
    <link rel="stylesheet" href="css/admin.css">
    <!--  link type="image/x-icon" href="images/favicon.ico" rel="shortcut icon"/>-->
    <link href="images/favicon.ico" rel="bookmark icon"/>
</head>

<body>
<div class="container">
    <div class="line">
        <div class="xs6 xm4 xs3-move xm4-move">
            <br/>
            <br/>
            <div class="media media-y">
                <img src="images/logo1.png" class="radius" alt="后台管理系统"/>
            </div>
            <br/>
            <br/>
            <form method="post" action="UserAction!UserLogin">
                <div class="panel">
                    <div class="panel-head"><strong>用户登录</strong></div>
                    <div class="panel-body" style="padding:30px;">
                        <div class="form-group">
                            <div class="field field-icon-right">
                                <input type="text" class="input" name="user.Name" placeholder="Username"/>
                                <span class="icon icon-user"></span>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="field field-icon-right">
                                <input type="password" class="input" name="user.Password" placeholder="Password"/>
                                <span class="icon icon-key"></span>
                            </div>
                        </div>

                    </div>
                    <div class="panel-foot text-center">
                        <button class="button button-block bg-main text-big">登录</button>
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>

</body>

</html>