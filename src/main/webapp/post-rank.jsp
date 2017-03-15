<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel='stylesheet' href='a/bootstrap.css' />
<script type="text/javascript" src='a/jquery.js'></script>
<script type="text/javascript" src='a/jquery.scrollTo.js'></script>
<script type="text/javascript" src='a/jquery.cookie.js'></script>
<script type="text/javascript" src='a/bootstrap.js'></script>
<script type="text/javascript" src='util.js'></script>
</head>
<body>
  <jsp:include page="top-refresh.jsp"></jsp:include>
  <div class="container">
    <div class="row">
      <div class=" col-md-2">
        <jsp:include page="main-nav.jsp"></jsp:include>
      </div>
      <div class="col-md-8">
        <div class="center-block">
          <!-- 头部三个玩意 -->
          <div id="headerNav" class="row">
            <ul id="orderType" class="nav nav-pills nav-justified">
              <li class="active"><a href="#byTime" data-toggle="pill"><span class="glyphicon glyphicon-time" style="font-size: 50px;"></span>
                  <br> <span class="center-block">最近</span></a></li>
              <li><a href="#byPraiseCount" data-toggle="tab"><span class="glyphicon glyphicon-heart" style="font-size: 50px;"></span> <span
                    class="center-block">最赞</span></a></li>
              <li><a href="#byForwardCount" data-toggle="tab"><span class="glyphicon glyphicon-retweet" style="font-size: 50px;"></span> <span
                    class="center-block">狂转</span></a></li>
              <li><a href="#byCommentCount" data-toggle="pill"><span class="glyphicon glyphicon-comment" style="font-size: 50px;"></span> <span
                    class="center-block" data-toggle="pill">热评</span></a></li>
            </ul>
          </div>
          <!-- 头部三个玩意结束 -->
          <!-- 话题列表 -->
          <div class="tab-content" class="row">
            <div class="tab-pane fade in active" id="byTime">
              <jsp:include page="post-list.jsp"></jsp:include></div>
            <div id="byPraiseCount" class="tab-pane fade">
              <jsp:include page="post-list.jsp"></jsp:include></div>
            <div id="byForwardCount" class="tab-pane fade">
              <jsp:include page="post-list.jsp"></jsp:include></div>
            <div id="byCommentCount" class="tab-pane fade">
              <jsp:include page="post-list.jsp"></jsp:include></div>
          </div>
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
<script type="text/javascript">
	$("#main-nav #post-rank").addClass("active")
	var column = "createdTime;praiseCount;forwardCount;commentCount".split(";")
	function loadPostList(columnId) {
		console.log(columnId)
		var table = $(".tab-content #postList").eq(columnId)
		$.getJSON("PostListOrderedByColumn", {
			column : column[columnId],
			beg : $(table).children().size() - 1,
			len : 10
		}, function(posts) {
			addToPostList($(table), posts)
		})
	}
	onScrollToEnd(function() {
		loadPostList($("#orderType .active").index())
	})
	var debug
	$(document).ready(function() {
		loadPostList(0)
		$("#orderType").children().eq(0).siblings().one("click", function() {
			loadPostList($(this).index())
		})
	})
</script>
</html>