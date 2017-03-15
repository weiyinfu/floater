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
			var who =
		<%=request.getParameter("who")%>
			if (who == getMyId()) {
				location = "me.jsp"
			}
		</script>
     <jsp:include page="top-refresh.jsp"></jsp:include>
  <div class="container">
    <div class="row">
      <div class=" col-md-2">
        <jsp:include page="main-nav.jsp"></jsp:include>
      </div>
      <div class="col-md-8">
        <div class="center-block" style="width: 700px">
          <jsp:include page="user-detail.jsp"></jsp:include>
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
	$("#main-nav #user").addClass("active").removeClass("hidden")
</script>
</html>