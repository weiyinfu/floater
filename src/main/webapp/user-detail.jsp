<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<div style="font-size: 30px;">
  <!-- 头部 -->
  <div class="text-center" id="userDetailDiv">
    <span id="logout" class="pull-right glyphicon glyphicon-log-out hidden" style="font-size: 30px;"></span>
    <div>
      <img id="headImage" class="img-circle" width="300px" height="300px">
    </div>
    <span id="userName">用户名</span>
    <br>
    <span id="schoolMajor">学校专业</span>
    <br>
    <button id="bottomButton" type="button" class="btn btn-primary btn-lg btn-block">编辑、关注、取消关注</button>
  </div>
  <!-- 头部 结束-->
  <hr>
  <!-- 尾部 -->
  <div>
    <ul id="myTab" class="nav nav-tabs nav-justified">
      <li class="active"><a href="#topicDiv" data-toggle="tab"> <span>12</span> <br> <span>话题</span>
      </a></li>
      <li><a href="#postDiv" data-toggle="tab"> <span>1234</span> <br> <span>帖子 </span></a></li>
      <li><a href="#careDiv" data-toggle="tab"> <span>34</span> <br> <span>关注 </span></a></li>
      <li><a href="#fansDiv" data-toggle="tab"> <span>789</span> <br> <span>粉丝 </span></a></li>
    </ul>
    <div id="myTabContent" class="tab-content">
      <div class="tab-pane fade in active" id="topicDiv">
        <jsp:include page="simple-list.jsp"></jsp:include>
      </div>
      <div class="tab-pane fade" id="postDiv"><jsp:include page="post-list.jsp"></jsp:include></div>
      <div class="tab-pane fade" id="careDiv"><jsp:include page="simple-list.jsp"></jsp:include></div>
      <div class="tab-pane fade" id="fansDiv"><jsp:include page="simple-list.jsp"></jsp:include></div>
    </div>
  </div>
</div>
<script>
	function loadUserDetail() {
		$.getJSON("UserDetail", {
			who : who
		}, function(user) {
			$("#userDetailDiv #headImage").attr("src",
					"Image?file=" + user.headImage)
			$("#userDetailDiv #userName").text(
					user.name + " " + ("女.男.性别无".split(".")[user.sex]))
			$("#userDetailDiv #schoolMajor").text(
					user.school + " " + user.major)
			console.log(getMyId() + " " + who)
			if (getMyId() == who) {
				$("#bottomButton").text("编辑")
				$("#logout").click(logout).removeClass("hidden")
			} else {
				setBottomButton(user.hasCared)
			}
			$("#myTab li:eq(0)").find("span").eq(0).text(user.topicCount)
			$("#myTab li:eq(1)").find("span ").eq(0).text(user.postCount)
			$("#myTab li:eq(2)").find("span ").eq(0).text(user.caredUserCount)
			$("#myTab li:eq(3)").find("span").eq(0).text(user.fansCount)
		})
	}
	function setBottomButton(hasCared) {
		console.log(hasCared)
		if (hasCared) {
			$("#bottomButton").css("background-color", "grey").text("取消关注")
		} else {
			$("#bottomButton").css("background-color", "#f1c232").text("关注")
		}
	}
	function loadTopic() {
		var topicTable = $("#topicDiv #simpleTable")
		$.getJSON("TopicListByUser", {
			who : who,
			beg : $(topicTable).children().size() - 1,
			len : 10
		}, function(topicList) {
			addToTopicTable($(topicTable), topicList)
		})
	}
	function loadPost() {
		var postTable = $("#postDiv #postList")
		$.getJSON("PostListByUser", {
			who : who,
			beg : $(postTable).children().size() - 1,
			len : 10
		}, function(postList) {
			addToPostList($(postTable), postList)
		})
	}
	function loadCare() {
		var caredUserTable = $("#careDiv #simpleTable")
		$.getJSON("CaredUserList", {
			who : who,
			beg : $(caredUserTable).children().size() - 1,
			len : 10
		}, function(userList) {
			addToUserTable($(caredUserTable), userList)
		})
	}
	function loadFans() {
		var fansTable = $("#fansDiv #simpleTable")
		$.getJSON("FansList", {
			who : who,
			beg : $(fansTable).children().size() - 1,
			len : 10
		}, function(userList) {
			addToUserTable($(fansTable), userList)
		})
	}
	function logout() {
		$.cookie("userId", "")
		location = "signin.html"
	}
	function doCare() {
		$.get("CareUser", {
			caredUserId : who
		}, function() {
			setBottomButton(true)
		})
	}
	function cancelCare() {
		$.get("CancelCareUser", {
			caredUserId : who
		}, function() {
			setBottomButton(false)
		})
	}
	function clickBottomButton() {
		var hasCared = $("#bottomButton").text() == "取消关注"
		if (hasCared) {
			cancelCare()
		} else {
			doCare()
		}
	}
	var loadMoreFuns = [ loadTopic, loadPost, loadCare, loadFans ]
	onScrollToEnd(function() {
		var active = $("#myTab .active").index()
		loadMoreFuns[active]()
	})
	$(document).ready(function() {
		if (who == getMyId()) {
			$("#bottomButton").text("编辑").click(function() {
				location = "edit-user-detail.jsp";
			})
		} else {
			$("#bottomButton").click(clickBottomButton)
		}
		loadUserDetail()
		loadTopic()
		$("[href='#postDiv']").one("click", loadPost)
		$("[href='#careDiv']").one("click", loadCare)
		$("[href='#fansDiv']").one("click", loadFans)
	})
</script>