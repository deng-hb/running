<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%><%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %><!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>${null==task.desc?'add task':task.desc}</title>
  <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
  <link rel="stylesheet" type="text/css" href="/assets/iconfont/iconfont.css" />
  <link rel='stylesheet' href='/assets/css/style.css' type='text/css'/>
  <style>
    .msg{
        background:#99CC66;
        font-size:14px;
        color:#fff;
    }
    table{
      border-collapse: collapse;
      border-spacing: 0;
      width:100%;
    }
    table tr{
        height:45px;
    }
    .field{
        border: 1px solid #b6b6b6;
        min-width:280px;
        height:30px;
        padding-left:3px;
        font-size:16px;
    }
    .button {
        border: 1px solid #b6b6b6;
        background:#f9f9f9;
        padding:5px 20px;
        font-size:20px;
    }
  </style>
</head>
<body>
    <div class="header">
        <a href="/">Health Listener</a>
    </div>
    <form id="form" action="/save" method="POST">
        <input type="hidden" name="id" value="${task.id}" />
        <table>
            <tr class="${null != param.message?'msg':''}">
                <td>&nbsp;</td>
                <td>${param.message}</td>
            </tr>
            <tr>
                <td align="right">desc：</td>
                <td><input class="field" type="text" name="desc" value="${task.desc}"/></td>
            </tr>
            <tr>
                <td align="right">Url：</td>
                <td><input class="field" type="text" name="url" value="${task.url}"/></td>
            </tr>
            <tr>
                <td align="right">Sec：</td>
                <td><input class="field" type="text" name="sec" value="${task.sec}"/></td>
            </tr>
            <tr>
                <td align="right">is Email：</td>
                <td>
                <input type="radio" name="isEmail" value="1"  ${task.isEmail==1?'checked':''}/>Y
                <input type="radio" name="isEmail" value="0"  ${task.isEmail!=1?'checked':''}/>N
                </td>
            </tr>
            <tr>
                <td align="right">Email(,)：</td>
                <td><input class="field" type="text" name="emailAddress" value="${task.emailAddress}"/></td>
            </tr>
            <tr>
                <td align="right">is run：</td>
                <td>
                <input type="radio" name="isRun" value="1"  ${task.isRun==1?'checked':''}/>Y
                <input type="radio" name="isRun" value="0"  ${task.isRun!=1?'checked':''}/>N
                </td>
            </tr>
            <tr>
                <td>&nbsp;</td>
                <td>
                <a class="button" href="#" onclick="submit()"><i class="iconfont icon-save blue"></i> save</a>

                <a href="/">back</a>
                </td>
            </tr>
        </table>

    </form>

    <script>
        function submit(){
            document.getElementById("form").submit();
        }
    </script>
</body>
</html>