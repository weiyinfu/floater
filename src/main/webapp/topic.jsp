<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel='stylesheet' href='a/bootstrap.css' />
<script type="text/javascript" src='a/jquery.js'></script>
<script type="text/javascript" src='a/jquery.scrollTo.js'></script>
<script type="text/javascript" src='a/jquery.cookie.js'></script>
<script type="text/javascript" src='a/bootstrap.js'></script>

<link rel="stylesheet" href="fileinput/fileinput.min.css" type="text/css" />
<script type="text/javascript" src='fileinput/fileinput.min.js'></script>
<script type="text/javascript" src='util.js'></script>
</head>
<body>
  <script>
			var topicId =
		<%=request.getParameter("topicId")%>
			if (topicId == null || topicId == "") {
				topicId = 1
			}
			var topicHomePage = true
		</script>
  <jsp:include page="top-refresh.jsp"></jsp:include>
  <div class="container">
    <div class="row">
      <div class=" col-md-2">
        <jsp:include page="main-nav.jsp"></jsp:include>
      </div>
      <div class="col-md-8">
        <!-- 主要容器 -->
        <div class="center-block" style="width: 700px">
          <!-- 话题面板 -->
          <div class="row" id="topicPanel">
            <div class="panel panel-default">
              <div class="panel-heading" style="font-size: 30px;">
                <img id="topicIcon" width="70px" height="70px" class="img-circle">
                <span id="topicTitle" style="font-size: 40px;"></span>
                <span id="topicForm" class="pull-right"></span>
                <button class="btn btn-primary btn-default" id="careButton">关注</button>
                <span id="deleteTopic" class="glyphicon glyphicon-trash collapse"></span>
                <span id="createdTime" class="pull-right"></span>
              </div>
              <div class="panel-body">
                <pre style="background-color: white; font-size: 30px; border: none;" id="content"></pre>
              </div>
              <div class="panel-footer">
                <img class="img-circle" id="headImage" width="40px" height="40px">
                <span id="userName" style="font-size: 30px;"></span>
                <span id="userSchoolMajor" class="pull-right" style="font-size: 20px;"></span>
              </div>
            </div>
          </div>
          <!-- 创建帖子 表单-->
          <div id="createPostDiv">
            <form id='postForm' role="form" class="collapse" enctype="multipart/form-data" method="POST" action="CreatePost">
              <input name="topicId" hidden="true">
              <div class="form-group">
                <input name='mediaFile' type="file">
              </div>
              <div class="form-group">
                <textarea name="content" style="font-size: 20px;" class="form-control" rows="13" placeholder="帖子内容"></textarea>
              </div>
              <button type="submit" class="btn btn-primary btn-block">提交</button>
            </form>
          </div>
          <!-- 本话题下的帖子内容 -->
          <div>
            <jsp:include page="post-list.jsp"></jsp:include>
          </div>
        </div>
        <span id="createPost"
          style="background-color: purple; color: white; font-size: 50px; position: fixed; width: 100px; height: 100px; left: 1100px; top: 500px; padding-top: 25px;"
          class="glyphicon glyphicon-pencil text-center img-circle"></span>

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
	$("#main-nav #topic").removeClass("hidden").addClass("active")
	function initPostForm() {
		var topic = $(document).data("topicDetail")
		$("#postForm [name=topicId]").attr("value", topicId)
		$("#postForm [name=mediaFile]").fileinput({
			showUpload : false,
			allowedFileExtensions : fileExtensions[topic.form]
		})
	}
	function loadTopicDetail() {
		$.getJSON("TopicDetail", {
			topicId : topicId
		}, function(topic) {
			$("#topicPanel #topicIcon").attr("src",
					"Image?file=" + topic.iconPath)
			$("#topicPanel #topicForm").addClass(
					"glyphicon glyphicon-" + form[topic.form]).css("font-size",
					"50px")
			$("#topicPanel #topicTitle").text(topic.title)
			$("#topicPanel #content").text(topic.content)
			$("#topicPanel #createdTime").text(convertTime(topic.createdTime))
			var user = topic.user;
			$("#topicPanel #userName").text(user.name).data("userId", user.id)
					.click(gotoUserDetail)
			$("#topicPanel #userSchoolMajor").text(user.school + user.major)
			$("#topicPanel #headImage").attr("src",
					"Image?file=" + user.headImage).data("userId", user.id)
					.click(gotoUserDetail)
			$(document).data("topicDetail", topic)
			initPostForm()
			$("#careButton").text(topic.hasCared ? "取消关注" : "关注")
			console.log(topic.user.id + " " + getMyId())
			if (topic.user.id == getMyId()) {
				$("#topicPanel .panel-heading").mouseover(function() {
					$("#deleteTopic").show()
					console.log("mouseEnter")
				}).mouseout(function() {
					$("#deleteTopic").hide()
				})
			}
		})
	}
	function loadPost() {
		$.getJSON("PostListByTopic", {
			topicId : topicId,
			beg : $("#postList").children().size() - 1,
			len : 10
		}, function(json) {
			addToPostList($("#postList"), json)
		})
	}
	onScrollToEnd(function() {
		loadPost()
	})
	function clickCreatePost() {
		if ($("#createPost").hasClass("glyphicon-pencil")) {
			$.scrollTo("#createPostDiv", 700)
			$("#postForm").slideDown(2700, function() {
				$("#postForm [name=content]").focus()
			})
			$("#createPost").removeClass("glyphicon-pencil").addClass(
					"glyphicon-trash")
		} else {
			$("#postForm").slideUp(1000)
			$("#createPost").removeClass("glyphicon-trash").addClass(
					"glyphicon-pencil")
		}
	}
	function clickCareButton() {
		var btn = $(this)
		if ($(this).text() == "关注") {
			$.get("CareTopic", {
				topicId : topicId
			}, function() {
				$(btn).text("取消关注")
			})
		} else {
			$.get("CancelCareTopic", {
				topicId : topicId
			}, function() {
				$(btn).text("关注")
			})
		}
	}
	function deleteTopic() {
		$.get("DeleteTopic", {
			topicId : topicId
		}, function() {
			backAndRefresh()
		})
	}
	$(document).ready(function() {
		loadTopicDetail()
		loadPost()
		$("#createPost").click(clickCreatePost)
		$("#careButton").click(clickCareButton)
		$("#deleteTopic").click(deleteTopic)
	})
</script>
</html>