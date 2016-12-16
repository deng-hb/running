<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%><%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %><!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>Dashboard</title>
  <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
  <link rel="shortcut icon" href="https://denghb.com/usr/themes/default/img/favicon.ico" />
  <link rel="stylesheet" type="text/css" href="/assets/iconfont/iconfont.css" />
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
      td a{
        color:#333;
        text-decoration:none;
      }
      .stop a{
        text-decoration:line-through;
      }
  </style>
</head>
<body>
    <%@ include file="/WEB-INF/view/_header.jsp" %>

          <table class="table">
            <tr>
              <th style="width: 5%">#</th>
              <th>Desc</th>
              <th>Sec</th>
              <th style="width: 40%">URL</th>
              <th style="width: 15%;">Run Time</th>
              <th style="width: 8%">Status</th>
              <th style="width: 15%">Control</th>
            </tr>
            <c:forEach items="${list}" var="task" varStatus="status">
            <tr class="${status.index%2==0?'ood':''}">
              <td>${result.paging.start + status.index}.</td>
              <td>${task.desc}</td>
              <td>${task.sec}s</td>
              <td class="${1 == task.isRun?'':'stop'}"><a href="${task.url}" target="_blank">${task.url}</a></td>
              <td><code class=" ${1000 < task.runTime?'red':'green'}" >${task.runTime}ms</code></td>
              <td><code class=" ${200 == task.lastStatus?'success':'warning'}" >${task.lastStatus}</code></td>
              <td>
              <c:choose>
                  <c:when test="${1 == task.isRun}">
                    <a href="#" onclick="stop('${task.id}')" class="" title="stop"><i class="iconfont icon-stop red"></i>stop</a>
                  </c:when>
                  <c:otherwise>
                    <a href="#" onclick="start('${task.id}')" class="" title="start"><i class="iconfont icon-start green"></i>start</a>
                  </c:otherwise>
              </c:choose>
              <a href="/edit/${task.id}" ><i class="iconfont icon-edit blue"></i>edit</a>
              <a href="/history/${task.id}" ><i class="iconfont icon-history gray"></i>history</a>
              </td>
            </tr>
            </c:forEach>

          </table>
    <script>
        function stop(id){
            if(confirm("stop it ？")){
                window.location.href = '/stop/'+id;
            }
			return false;
        }
        function start(id){
            if(confirm("start it ？")){
                window.location.href = '/start/'+id;
            }
			return false;
        }
        setTimeout(function(){
            //window.location.href = '/';
            window.location.reload();
        },30*1000);
     </script>
</body>
</html>