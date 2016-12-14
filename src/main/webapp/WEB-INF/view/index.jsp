<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%><%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %><!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>Dashboard</title>
  <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
  <link rel='stylesheet' href='/assets/css/style.css' type='text/css'/>
  <style>
      table{
          border-collapse: collapse;
          border-spacing: 0;
          width:100%;
      }
      table th{
          background:#d5d5d5;
          text-align:left;
          height:50px;
          font-size:30px;
      }
      table tr{
          height:40px;
      }
      table td{
          border-bottom:1px #d5d5d5 solid;
      }
      .ood{
        background:#efefef;
      }
  </style>
</head>
<body>
    <div class="header">
        <a href="/">Health Listener</a>
    </div>
          <table class="table">
            <tr>
              <th style="width: 20px">#</th>
              <th>Task</th>
              <th>Sec</th>
              <th>URL</th>
              <th>Status</th>
              <th>Control</th>
            </tr>
            <c:forEach items="${list}" var="item" varStatus="status">
            <tr class="${status.index%2==0?'ood':''}">
              <td>${status.index+1}.</td>
              <td>${item.desc}</td>
              <td>${item.sec}</td>
              <td>${item.url}</td>
              <td><code class=" ${200==item.lastStatus?'success':'warning'}" >${item.lastStatus}</code></td>
              <td>
              <c:choose>
                  <c:when test="${1 == item.isRun}">
                    <a href="#" onclick="stop('${item.id}')" task-id="${item.id}" class='task-stop'>stop</a>
                  </c:when>
                  <c:otherwise>
                    <a href="#" onclick="start('${item.id}')" class='success'>run</a>
                  </c:otherwise>
              </c:choose>
              <a href="/edit/${item.id}" >edit</a>
              </td>
            </tr>
            </c:forEach>

          </table>
    <script>
        function stop(id){
            if(confirm("确认停止？")){
                window.location.href = '/stop/'+id;
            }
        }
        function start(id){
            if(confirm("确认启动？")){
                window.location.href = '/start/'+id;
            }
        }
     </script>
</body>
</html>