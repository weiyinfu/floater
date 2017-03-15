<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<div id="top-refresh-div" class="text-center affix" style="color: white; font-size: 50px; left: 1200px; top: 400px;">
  <span id="gotoTop" class="glyphicon glyphicon-chevron-up  img-circle"
    style="width: 80px; height: 80px; background-color: purple; padding-top: 15px;"></span>
  <span id="refreshPage" class="glyphicon glyphicon-refresh img-circle"
    style="width: 80px; height: 80px; background-color: purple; padding-top: 15px;"></span>
  <script> 
			$(document).ready(function() {
				$("#gotoTop").click(function() {
					$.scrollTo($("body"), 1000)
				})
				$("#refreshPage").click(function() {
					location.reload()
				})
			})
		</script>
</div>