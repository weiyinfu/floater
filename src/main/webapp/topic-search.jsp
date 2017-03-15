<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel='stylesheet' href='a/bootstrap.css' />
<script type="text/javascript" src='a/jquery.js'></script>
<script type="text/javascript" src='a/jquery.cookie.js'></script>
<script type="text/javascript" src='a/jquery.scrollTo.js'></script>
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
        <div class="form-group">
          <input id='keywords' name="keywords" type="text" class="form-control input-lg" placeholder="请输入搜索关键字">
        </div>
        <div>
          <jsp:include page="simple-list.jsp"></jsp:include>
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
	$("#main-nav #topic-search").addClass("active")
	function loadTopics(clearBeforeLoad) {
		var topicTable = $("#simpleTable")
		if (clearBeforeLoad) {
			$(topicTable).children().eq(0).siblings().remove()
		}
		$.getJSON("TopicListByTitle", {
			"keywords" : $("#keywords").val(),
			"beg" : $(topicTable).children().size() - 1,
			"len" : 10
		}, function(topicList) {
			addToTopicTable($(topicTable), topicList)
		})
	}
	$('#keywords').keydown(function(event) {
		if (event.which == 13) {
			loadTopics(true)
		}
	})
	onScrollToEnd(function() {
		loadTopics()
	})
	$(document).ready(function() {

	})
</script>
</html>