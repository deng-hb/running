<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%><%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %><!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>Dashboard</title>
  <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
  <link rel='stylesheet' href='/assets/css/style.css' type='text/css'/>
</head>
<body>
          <table class="table">
            <tr>
              <th style="width: 20px">#</th>
              <th>Task</th>
              <th>Sec</th>
              <th>URL</th>
              <th>Error</th>
              <th>Control</th>
            </tr>
            <c:forEach items="${list}" var="item" varStatus="status"><c:set var="isRun" value="${1==item.isRun}" />
            <tr class="${isRun?'success':'warning'}">
              <td>${status.index+1}.</td>
              <td>${item.desc}</td>
              <td>${item.sec}</td>
              <td>${item.url}</td>
              <td>${1 == item.isMail?'Y':'N'}</td>
              <td>
              <c:choose>
                  <c:when test="${isRun}">
                    <a href="#" onclick="stop('${item.id}')" task-id="${item.id}" class='task-stop'>stop</a>
                  </c:when>
                  <c:otherwise>
                    <a href="#" onclick="start('${item.id}')" class='success'>run</a>
                  </c:otherwise>
              </c:choose>
              <a href="#" onclick="/edit/${item.id}" >edit</a>
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