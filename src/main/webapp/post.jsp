<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel='stylesheet' href='a/bootstrap.css' />
<script type="text/javascript" src='a/jquery.js'></script>
<script type="text/javascript" src='a/bootstrap.js'></script>
<script type="text/javascript" src='a/jquery.scrollTo.js'></script>
<script type="text/javascript" src='a/jquery.cookie.js'></script>
<script type="text/javascript" src='util.js'></script>
</head>
<body>
  <script>
			var postId =
		<%=request.getParameter("postId")%>
			
		</script>
     <jsp:include page="top-refresh.jsp"></jsp:include>
  <div class="container">
    <div class="row">
      <div class="col-md-2">
        <jsp:include page="main-nav.jsp"></jsp:include></div>
      <div class="col-md-8">
        <div class="center-block" style="width: 700px">
          <div id="postDetail">
            <jsp:include page="post-list.jsp"></jsp:include>
          </div>
          <div>
            <ul id="myTab" class="nav nav-tabs nav-justified">
              <li class="active"><a href="#commentDiv" data-toggle="tab"> 评论 </a></li>
              <li><a href="#praiseDiv" data-toggle="tab"> 赞 </a></li>
              <li><a href="#forwardDiv" data-toggle="tab"> 转发 </a></li>
            </ul>
            <div id="myTabContent" class="tab-content">
              <div class="tab-pane fade in active" id="commentDiv">
                <jsp:include page="comment-list.jsp"></jsp:include>
              </div>
              <div class="tab-pane fade" id="praiseDiv"><jsp:include page="simple-list.jsp"></jsp:include></div>
              <div class="tab-pane fade" id="forwardDiv"><jsp:include page="simple-list.jsp"></jsp:include></div>
            </div>
          </div>
        </div>
      </div>
      <!-- col-md-8 end -->
      <div class="col-md-2">
        <jsp:include page="right-nav.jsp"></jsp:include>
      </div>
    </div>
    <!-- row end-->
  </div>
  <!-- container end-->
</body>
<script type="text/javascript">
	$("#main-nav #post").addClass("active").removeClass("hidden")
	function loadDetail() {
		$.getJSON("PostDetail", {
			postId : postId
		}, function(post) {
			addToPostList($("#postDetail #postList"), [ post ])
		})
	}
	function loadComment() {
		var commentList = $("#commentDiv #commentList")
		$.getJSON("CommentListOfPost", {
			postId : postId,
			beg : $(commentList).children().size() - 1,
			len : 10
		}, function(comments) {
			addToCommentList($(commentList), comments)
		})
	}
	function loadPraise() {
		var praiseTable = $("#praiseDiv #simpleTable")
		$.getJSON("PraiseUserList", {
			postId : postId,
			beg : $(praiseTable).children().size() - 1,
			len : 10
		}, function(praiseUsers) {
			addToUserTable($(praiseTable), praiseUsers)
		})
	}
	function loadForward() {
		var forwardTable = $("#forwardDiv #simpleTable")
		$.getJSON("ForwardUserList", {
			postId : postId,
			beg : $(forwardTable).children().size() - 1,
			len : 10
		}, function(forwardUsers) {
			addToUserTable($(forwardTable),forwardUsers)
		})
	}
	onScrollToEnd(function() {
		var funs = [ loadComment, loadPraise, loadForward ]
		funs[$("#myTab .active").index()]()
	})
	$(document).ready(function() {
		loadDetail()
		loadComment()
		$("[href='#praiseDiv']").click(loadPraise)
		$("[href='#forwardDiv']").click(loadForward)
	})
</script>
</html>