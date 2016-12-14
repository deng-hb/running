<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%><%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %><!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>Starter</title>
  <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
  <link rel='stylesheet' href='/assets/css/style.css' type='text/css'/>
</head>
<body>
    <div class="header">
        <a href="/">Health Listener</a>
    </div>
    <div>${message}<div>
    <form action="/save" method="POST">
        <input type="hidden" name="id" value="${task.id}" />
        <table>
            <tr>
                <td>desc</td>
                <td><input type="text" name="desc" value="${task.desc}"/></td>
            </tr>
            <tr>
                <td>Url</td>
                <td><input type="text" name="url" value="${task.url}"/></td>
            </tr>
            <tr>
                <td>Sec</td>
                <td><input type="text" name="sec" value="${task.sec}"/></td>
            </tr>
            <tr>
                <td>is Email</td>
                <td><input type="radio" name="isMail" value="1"  ${task.isMail==1?'checked':''}/>Y
                <input type="radio" name="isMail" value="0"  ${task.isMail!=1?'checked':''}/>N
                </td>
            </tr>
            <tr>
                <td>Email</td>
                <td><input type="text" name="mailAddress" value="${task.mailAddress}"/></td>
            </tr>
            <tr>
                <td>&nbsp;</td>
                <td><input type="submit" /></td>
            </tr>
        </table>

    </form>

    <script>

    </script>
</body>
</html>