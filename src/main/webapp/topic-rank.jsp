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
            <ul id="rankType" class="nav nav-pills nav-justified">
              <li class="active"><a href="#byTime" data-toggle="pill"><span class="glyphicon glyphicon-time" style="font-size: 50px;"></span>
                  <br> <span class="center-block">按时间</span></a></li>
              <li><a href="#byHot" data-toggle="tab"><span class="glyphicon glyphicon-fire" style="font-size: 50px;"></span> <span
                    class="center-block">按热度</span></a></li>
              <li><a href="#byPostCount" data-toggle="pill"><span class="glyphicon glyphicon-pencil" style="font-size: 50px;"></span> <span
                    class="center-block" data-toggle="pill">按帖子数</span></a></li>
            </ul>
          </div>
          <!-- 头部三个玩意结束 -->
          <!-- 话题列表 -->
          <div class="tab-content" class="row">
            <div class="tab-pane fade in active" id="byTime">
              <jsp:include page="simple-list.jsp"></jsp:include></div>
            <div id="byHot" class="tab-pane fade">
              <jsp:include page="simple-list.jsp"></jsp:include></div>
            <div id="byPostCount" class="tab-pane fade">
              <jsp:include page="simple-list.jsp"></jsp:include></div>
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
	$("#main-nav #topic-rank").addClass("active")
	var rankURL = "TopicListByTime TopicListByPostCount TopicListByHot"
			.split(" ")
	function loadTopics(byWhatRank) {
		var table = $(".tab-content #simpleTable").eq(byWhatRank)
		$.getJSON(rankURL[byWhatRank], {
			"beg" : $(table).children().size() - 1,
			"len" : 10
		}, function(topicList) {
			addToTopicTable($(table), topicList)
		})
	}
	onScrollToEnd(function() {
		loadTopics($("#rankType .active").index())
	})
	$(document).ready(function() {
		loadTopics(0)
		$("[href='#byHot']").one("click", function() {
			loadTopics(1)
		})
		$("[href='#byPostCount']").one("click", function() {
			loadTopics(2)
		})
	})
</script>
</html>