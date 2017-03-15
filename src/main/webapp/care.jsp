<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel='stylesheet' href='a/bootstrap.css' />
<script type="text/javascript" src='a/jquery.js'></script>
<script type="text/javascript" src='a/bootstrap.js'></script>
<script type="text/javascript" src='a/jquery.scrollTo.js'></script>
<script type="text/javascript" src='a/jquery.cookie.js'></script>
<script type="text/javascript" src='util.js'></script>
</head>
<body>
  <jsp:include page="top-refresh.jsp"></jsp:include>
  <div class="container">
    <div class="row">
      <div class="col-md-2">
        <jsp:include page="main-nav.jsp"></jsp:include></div>
      <div class="col-md-8">
        <div class="center-block" style="width: 700px">
          <div id="postDiv">
            <jsp:include page="post-list.jsp"></jsp:include>
          </div>
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
	$("#main-nav #care").addClass("active")
	function loadPost() {
		var postView = $("#postDiv #postList")
		$.getJSON("CaredPostList", {
			"beg" : $(postView).children().size() - 1,
			"len" : 10
		}, function(json) {
			addToPostList($(postView), json)
		})
	}
	loadPost()
	onScrollToEnd(function() {
		loadPost()
	})
</script>
</html>