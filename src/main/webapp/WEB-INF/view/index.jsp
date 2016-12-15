<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%><%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %><!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>Dashboard</title>
  <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
  <link rel="stylesheet" type="text/css" href="/assets/iconfont/iconfont.css" />
  <link rel='stylesheet' href='/assets/css/style.css?v=4' type='text/css'/>
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
      .action{
          float:right;
          font-size:15px;
          margin-right:10px;
      }
  </style>
</head>
<body>
    <div class="header">
        <a href="/">Health Listener</a>

        <div class="action"><a href="/add"><i class="iconfont icon-add blue"></i>add</a></div>
    </div>
          <table class="table">
            <tr>
              <th style="width: 5%">#</th>
              <th>Desc</th>
              <th>Sec</th>
              <th style="width: 45%">URL</th>
              <th style="width: 10%;font-size:20px;">Run Time(ms)</th>
              <th style="width: 5%">Status</th>
              <th style="width: 15%">Control</th>
            </tr>
            <c:forEach items="${list}" var="item" varStatus="status">
            <tr class="${status.index%2==0?'ood':''}">
              <td>${status.index+1}.</td>
              <td>${item.desc}</td>
              <td>${item.sec}</td>
              <td>${item.url}</td>
              <td>${item.runTime}</td>
              <td><code class=" ${200==item.lastStatus?'success':'warning'}" >${item.lastStatus}</code></td>
              <td>
              <c:choose>
                  <c:when test="${1 == item.isRun}">
                    <a href="#" onclick="stop('${item.id}')" class="" title="stop"><i class="iconfont icon-stop red"></i>stop</a>
                  </c:when>
                  <c:otherwise>
                    <a href="#" onclick="start('${item.id}')" class="" title="start"><i class="iconfont icon-start green"></i>start</a>
                  </c:otherwise>
              </c:choose>
              <a href="/edit/${item.id}" ><i class="iconfont icon-edit blue"></i>edit</a>
              <a href="/history/${item.id}" ><i class="iconfont icon-history gray"></i>history</a>
              </td>
            </tr>
            </c:forEach>

          </table>
    <script>
        function stop(id){
            if(confirm("stop it ？")){
                window.location.href = '/stop/'+id;
            }
        }
        function start(id){
            if(confirm("start it ？")){
                window.location.href = '/start/'+id;
            }
        }
        setTimeout(function(){
            //window.location.href = '/';
            window.location.reload();
        },4000);
     </script>
</body>
</html>