<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%><%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>Starter</title>
  <!-- Tell the browser to be responsive to screen width -->
  <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
  <!-- Bootstrap 3.3.6 -->
  <link rel="stylesheet" href="assets/bootstrap/css/bootstrap.min.css">
  <!-- Font Awesome -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.5.0/css/font-awesome.min.css">
  <!-- Ionicons -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/ionicons/2.0.1/css/ionicons.min.css">
  <!-- Theme style -->
  <link rel="stylesheet" href="assets/dist/css/AdminLTE.min.css">
  <!-- AdminLTE Skins. We have chosen the skin-blue for this starter
        page. However, you can choose any other skin. Make sure you
        apply the skin class to the body tag so the changes take effect.
  -->
  <link rel="stylesheet" href="assets/dist/css/skins/skin-blue.min.css">
  <link rel="stylesheet" href="assets/plugins/pace/pace.min.css">

  <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
  <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
  <!--[if lt IE 9]>
  <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
  <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
  <![endif]-->
</head>
<body class="hold-transition">


    <!-- Main content -->
    <section class="content">

      <!-- Your Page Content Here -->
        <!-- /.box-header -->
        <div class="box-body no-padding">
          <table class="table">
            <tr>
              <th style="width: 10px">#</th>
              <th>Task</th>
              <th>URL</th>
              <th>Can Email</th>
              <th>Email Address</th>
              <th style="width: 40px">Status</th>
              <th >Control</th>
            </tr>
            <c:forEach items="${list}" var="item">
            <tr>
              <td>${item.id}.</td>
              <td>${item.desc}</td>
              <td>${item.url}</td>
              <td>${1 == item.isMail?'Y':'N'}</td>
              <td>${item.mailAddress}</td>
              <c:set var="isRun" value="${1==item.isRun}" />
              <td><span class="badge ${isRun?' bg-green">running':' bg-red">stop'}</span></td>
              <td>
              <c:choose>
                  <c:when test="${isRun}">
                    <a href="#" task-id="${item.id}" class='task-stop'>stop</a>
                  </c:when>
                  <c:otherwise>
                    <a href="#" task-id="${item.id}" class='task-run'>run</a>
                  </c:otherwise>
              </c:choose>
              </td>
            </tr>
            </c:forEach>

          </table>
    </section>
    <!-- /.content -->

  <!-- Main Footer -->
  <hr/>
    <!-- Default to the left -->
    <strong style="padding-left:20px;">Copyright &copy; 2016 <a href="https://denghb.com">denghb.com</a>.</strong> All rights reserved.

</div>
<!-- ./wrapper -->

<!-- REQUIRED JS SCRIPTS -->

<!-- jQuery 2.2.3 -->
<script src="assets/plugins/jQuery/jquery-2.2.3.min.js"></script>
<!-- Bootstrap 3.3.6 -->
<script src="assets/bootstrap/js/bootstrap.min.js"></script>
<!-- AdminLTE App -->
<script src="assets/dist/js/app.min.js"></script>
<script src="assets/plugins/pace/pace.min.js"></script>
<script src="assets/js/jq.utils.js"></script>

<!-- Optionally, you can add Slimscroll and FastClick plugins.
     Both of these plugins are recommended to enhance the
     user experience. Slimscroll is required when using the
     fixed layout. -->
<script>

     $(function(){
         $(document).ajaxStart(function() { Pace.restart(); });
        $('.task-run').click(function(){
            var $this = $(this);
            var id = $this.attr('task-id');

            jq.ajax('/start',{id:id},function(data){
                console.log(data);
                window.location.href = '/';
            });
        });
        $('.task-stop').click(function(){

            var $this = $(this);
            var id = $this.attr('task-id');
            jq.ajax('/cancel',{id:id},function(data){
                console.log(data);
                window.location.href = '/';
            });
        });
     });
     </script>
</body>
</html>