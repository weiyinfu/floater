<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel='stylesheet' href='a/bootstrap.css' />
<link rel='stylesheet' href='fileinput/fileinput.min.css' />
<script type="text/javascript" src='a/jquery.js'></script>
<script type="text/javascript" src='a/bootstrap.js'></script>
<script type="text/javascript" src='fileinput/fileinput.min.js'></script>
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
          <div class="text-center">
            <img class="img-circle" id="oldHeadImage" width="200px" height="200px">
          </div>
          <form role="form" enctype="multipart/form-data" method="POST" action="UpdateUserDetail">
            <div class="form-group">
              <label for="image">用户头像</label>
              <input id="image" name='image' type="file">
            </div>
            <div class="form-group">
              <label for="name">姓名</label>
              <input id='name' name='name' type="text" class="form-control">
            </div>
            <div class="form-group">
              <label>性别</label> <label class="checkbox-inline"> <input type="radio" name="sex" id="sex" value="1" checked class="input-lg">男
              </label> <label class="checkbox-inline"> <input type="radio" name="sex" id="girlRadio" value="0" class="input-lg"> 女
              </label>
            </div>
            <div class="form-group">
              <label for="school">学校</label>
              <input id='school' type="text" name='school' class="form-control">
            </div>
            <div class="form-group">
              <label for="mojor">专业</label>
              <input id='major' name='major' type="text" class="form-control">
            </div>
            <div>
              <button type="submit" class="btn btn-lg btn-block btn-primary">提交</button>
            </div>
          </form>
        </div>
      </div>
      <!-- col-md-8 end -->
      <div class="col-md-2">
        <jsp:include page="right-nav.jsp"></jsp:include>
      </div>
    </div>
    <!-- row end -->
  </div>
  <!-- container end -->
</body>
<script>
	$("#main-nav #edit-user-detail").removeClass("hidden").addClass("active")
	$("input[type='file']").fileinput({
		showUpload : false,
		allowedFileExtensions : fileExtensions[0],
	})
	function loadUserDetail() {
		$.getJSON("UserDetail", {
			who : getMyId()
		}, function(user) {
			$("#oldHeadImage").attr("src", "Image?file=" + user.headImage)
			//$("#image").val("Image?file=" + user.headImage)
			$("#name").val(user.name)
			$("#school").val(user.school)
			$("#major").val(user.major)
		})
	}
	loadUserDetail()
</script>
</html>