<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel='stylesheet' href='a/bootstrap.css' />
<script type="text/javascript" src='a/jquery.js'></script>
<script type="text/javascript" src='a/bootstrap.js'></script>
<link rel="stylesheet" href="carousel/carousel.css" type="text/css" />
<script type="text/javascript" src='carousel/holder.min.js'></script>
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
          <!-- Carousel begin -->
          <div id="myCarousel" class="carousel slide" data-ride="carousel">
            <!-- Indicators -->
            <ol class="carousel-indicators">
              <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
              <li data-target="#myCarousel" data-slide-to="1"></li>
              <li data-target="#myCarousel" data-slide-to="2"></li>
            </ol>
            <div class="carousel-inner" role="listbox" style="font-size: 40px;">
              <div class="item active">
                <img>
                <div class="carousel-caption"></div>
              </div>
              <div class="item">
                <img>
                <div class="carousel-caption"></div>
              </div>
              <div class="item">
                <img>
                <div class="carousel-caption"></div>
              </div>
            </div>
            <a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev"> <span class="glyphicon glyphicon-chevron-left"
                aria-hidden="true"></span> <span class="sr-only">Previous</span>
            </a> <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next"> <span class="glyphicon glyphicon-chevron-right"
                aria-hidden="true"></span> <span class="sr-only">Next</span>
            </a>
          </div>
          <!--carousel end-->
          <!-- 每日话题推荐 -->
          <div>
            <img src='icons/每日话题推荐.png' height='100px'>
          </div>
          <div id="recommendTopicDiv">
            <jsp:include page="simple-list.jsp"></jsp:include>
          </div>
          <!-- 每日话题推荐 结束 -->
          <!-- 我关注的话题 -->
          <div>
            <img src='icons/我关注的话题.png' height='100px'>
          </div>
          <div id="iCareTopicDiv">
            <jsp:include page="simple-list.jsp"></jsp:include>
          </div>
          <!--我关注的话题 结束 -->
        </div>
      </div>
      <!-- col-md-8 end-->
      <div class="col-md-2">
        <jsp:include page="right-nav.jsp"></jsp:include>
      </div>
    </div>
    <!-- row end-->
  </div>
  <!-- container end-->
</body>
<script type="text/javascript">
	$("#main-nav #recommend").addClass("active")
	function loadCarousel() {
		$.getJSON("Flash", function(flashArray) {
			for ( var i in flashArray) {
				var flash = flashArray[i]
				$(".carousel img").eq(i).attr("src",
						"Image?file=" + flash.imagePath)
				$(".carousel .carousel-caption").eq(i).text(flash.title)
			}
		})
	}

	function loadRecommendTopics() {
		$.getJSON("RecommendTopicList", function(topicList) {
			addToTopicTable($("#recommendTopicDiv #simpleTable"), topicList)
		})
	}

	function loadICareTopics() {
		var icareTable = $("#iCareTopicDiv #simpleTable")
		$.getJSON("CaredTopicList", {
			beg : $(icareTable).children().size() - 1,
			len : 5
		}, function(topicList) {
			addToTopicTable($(icareTable), topicList)
		})
	}
	loadCarousel()
	loadRecommendTopics()
	loadICareTopics()
	onScrollToEnd(function() {
		loadICareTopics()
	})
</script>
</html>