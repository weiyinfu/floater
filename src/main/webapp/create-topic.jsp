<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel='stylesheet' href='a/bootstrap.css' />
<script type="text/javascript" src='a/jquery.js'></script>
<script type="text/javascript" src='a/bootstrap.js'></script>
<script type="text/javascript" src='a/jquery.cookie.js'></script>
<script type="text/javascript" src='util.js'></script>
</head>
<body>
  <div class="container">
    <div class="row">
      <div class="col-md-2">
        <jsp:include page="main-nav.jsp"></jsp:include></div>
      <div class="col-md-8">
        <div class="center-block" style="width: 700px">
          <form role="form" enctype="multipart/form-data" method="POST" action="CreateTopic" style="padding-top: 20px; font-size: 20px;">
            <div class="form-group">
              <input name='title' type="text" class="form-control" placeholder="话题名称">
            </div>
            <div class="form-group">
              <label>话题类型</label> <label class="checkbox-inline"> <input type="radio" name="form" value="0" checked class="input-lg">
                <span class="glyphicon glyphicon-picture"></span>
              </label> <label class="checkbox-inline"> <input type="radio" name="form" value="1" class="input-lg"> <span
                  class="glyphicon glyphicon-music"></span>
              </label> <label class="checkbox-inline"> <input type="radio" name="form" value="2" class="input-lg"> <span
                  class="glyphicon glyphicon-film"></span>
              </label>
            </div>
            <div class="form-group">
              <textarea class="form-control" rows="13" placeholder="话题内容" name="content" cols="13"></textarea>
            </div>
            <div>
              <button type="submit" class="btn btn-lg btn-block btn-primary">提交</button>
            </div>
          </form>
        </div>
      </div>
      <!-- col-md-8  end-->
      <div class="col-md-2">
        <jsp:include page="right-nav.jsp"></jsp:include>
      </div>
    </div>
    <!-- row end-->
  </div>
  <!-- container end -->
</body>
<script type="text/javascript">
	$("#main-nav #create-topic").addClass("active")
</script>
</html>