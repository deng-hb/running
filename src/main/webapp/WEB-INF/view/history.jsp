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
    </style>
</head>
<body>
  <%@ include file="/WEB-INF/view/_header.jsp" %>
  <table class="table">
    <tr>
      <th style="width: 5%">#</th>
      <th>URL</th>
      <th>Status</th>
      <th>Brief</th>
      <th>Time</th>
    </tr>
    <c:forEach items="${result.list}" var="item" varStatus="status">
    <tr class="${status.index%2==0?'ood':''}">
      <td>${result.paging.start + status.index}.</td>
      <td><a href="${item.taskUrl}" target="_blank">${item.taskUrl}</a></td>
      <td><code class=" ${200 == item.code?'success':'warning'}" >${item.code}</code></td>
      <td>
        <a href="/history/err/${item.id}" target="_blank">${item.responseBrief}</a>
      </td>
      <td>${item.createdTime}</td>
    </tr>
    </c:forEach>

  </table>

  <div style="height:100px;width:100%;line-height:100px;text-align:center">
  <%@ include file="/WEB-INF/view/_paginate.jsp" %>
  </div>
</body>
</html>