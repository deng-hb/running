<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%><%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %><!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>Dashboard</title>
  <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
  <link rel="shortcut icon" href="https://denghb.com/usr/themes/default/img/favicon.ico" />
  <link rel='stylesheet' href='/assets/css/style.css' type='text/css'/>
  <style>
    p{
        padding:0 10px;
    }
  </style>
  <script src="/assets/js/sockjs.js"></script>
  <script src="/assets/js/stomp.js"></script>

    <script type="text/javascript">

    //创建sockJS协议
    var socket = new SockJS("/ws");
    var stompClient = Stomp.over(socket);

    //连接服务器
    stompClient.connect("guest", "guest", function () {
        //成功连接后，设定接受服务器的地址和处理方法
        stompClient.subscribe('/topic/${exec}', function (frame) {
            var p = document.createElement('p');
            p.innerHTML = frame.body;
            document.body.appendChild(p)
            // console.log(frame);
            //document.body.scrollTop = document.body.scrollHeight;// 滚动到底部
        });
        stompClient.send("/app/${exec}", {}, ${id});
    }, function (error) {
        //连接出现错误回调函数
        alert(error.headers.message);
    });

    </script>

</head>
<body>
  <%@ include file="/WEB-INF/view/_header.jsp" %>
</body>
</html>