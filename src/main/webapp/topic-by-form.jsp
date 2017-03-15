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
      <div class=" col-md-2">
        <jsp:include page="main-nav.jsp"></jsp:include>
      </div>
      <div class="col-md-8">
        <div class="center-block">
          <!-- 头部三个玩意 -->
          <div id="topicFormNav">
            <ul class="nav nav-pills nav-justified" style="font-size: 50px; text-align: center;">
              <li class="active"><a href="#textImage" data-toggle="pill"><span class="glyphicon glyphicon-picture"></span></a></li>
              <li><a href="#audio" data-toggle="pill"><span class="glyphicon glyphicon-music"></span></a></li>
              <li><a href="#video" data-toggle="pill"><span class="glyphicon glyphicon-film"></span></a></li>
            </ul>
          </div>
          <!-- 头部三个玩意结束 -->
          <!-- 话题列表 -->
          <div class="tab-content">
            <div class="tab-pane fade in active" id="textImage">
              <jsp:include page="simple-list.jsp"></jsp:include></div>
            <div class="tab-pane fade" id="audio">
              <jsp:include page="simple-list.jsp"></jsp:include></div>
            <div class="tab-pane fade" id="video">
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
	$("#main-nav #topic-by-form").addClass("active")
	function loadTopics(byWhatForm) {
		console.log(byWhatForm)
		var table = $(".tab-content #simpleTable").eq(byWhatForm)
		$.getJSON("TopicListByForm", {
			"form" : byWhatForm,
			"beg" : $(table).children().size() - 1,
			"len" : 10
		}, function(topicList) {
			addToTopicTable($(table), topicList)
		})
	}
	onScrollToEnd(function() {
		loadTopics($("#topicFormNav .active").index())
	})
	$(document).ready(function() {
		loadTopics(0)
		$("[href='#audio']").one("click", function() {
			loadTopics(1)
		})
		$("[href='#video']").one("click", function() {
			loadTopics(2)
		})
	})
</script>
</html>