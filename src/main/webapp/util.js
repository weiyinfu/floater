var fileExtensions = [ [ 'jpg', 'png', 'gif' ], [ "mp3", "wav" ],
		[ "mp4", "mkv","ogg" ] ]
var form = "picture music film".split(" ")

function getMyId() {
	var userId = $.cookie("userId");
	console.log(userId + " " + isEmpty(userId))
	if (typeof (userId) == "undefined" || isEmpty(userId)) {
		console.log("jump")
		location = "signin.html"
	} else
		return userId;
}
function backAndRefresh() {
	location = document.referer
}
function format(n) {
	if (n < 10)
		return "0" + n;
	else
		return n;
}
function convertTime(t) {
	var date = new Date(t)
	var now = new Date()
	var nowtime = now.getTime()
	if (nowtime - t < 3 * 60 * 1000) {
		return "刚刚"
	}
	if (nowtime - t < 3600 * 1000) {
		return Math.round((nowtime - t) / 60000) + "分钟前"
	}
	var day = " 昨天 前天 大前天".split(" ");
	for (var i = 0; i < day.length; i++) {
		var s = day[i]
		if (nowtime - t < 1000 * 3600 * 24 * (i + 1)
				&& date.getDate() + i >= now.getDate()) {
			if (date.getHours() < 12) {
				return s + "上午" + format(date.getHours()) + ":"
						+ format(date.getMinutes())
			} else if (date.getHours() == 12) {
				return s + "中午12:" + format(date.getMinutes())
			} else {
				return s + "下午" + format(date.getHours() - 12) + ":"
						+ format(date.getMinutes())
			}
		}
	}
	if (date.getFullYear() == now.getFullYear()) {
		return date.getMonth() + "月" + date.getDay() + "日"
	}
	return date.toLocaleDateString()
}

function addToTopicTable(topicTable, topicList) {
	for ( var index in topicList) {
		var i = topicList[index]
		var item = $(topicTable).children().eq(0).clone()
		$(item).find("#icon").attr("src", "Image?file=" + i.iconPath)
		$(item).find("#right-span").addClass(
				"glyphicon glyphicon-" + form[i.form]).css("font-size", "50px")
		$(item).find("#title").text(i.title)
		$(item).find("#description").text("已编造" + i.postCount + "帖")
		$(item).removeClass("hidden").data("topicId", i.id).click(
				gotoTopicDetail).appendTo($(topicTable))
	}
}
function addToCommentList(commentList, data) {
	for ( var index in data) {
		var i = data[index]
		var item = $(commentList).children().eq(0).clone()
		var user = i.user
		$(item).find("#headImage").attr("src", "Image?file=" + user.headImage)
				.data("userId", user.id).click(gotoUserDetail)
		$(item).find("#userName").text(user.name).data("userId", user.id)
				.click(gotoUserDetail)
		$(item).find("#schoolMajor").text(user.school + " " + user.major)
		$(item).find("#createdTime").text(convertTime(i.createdTime))
		$(item).find("#content").text(i.content)

		if (i.user.id == getMyId()) {
			var trash = $(item).find(".glyphicon-trash").click(deleteComment)
			$(item).mouseover(function() {
				$(this).find(".glyphicon-trash").show()
			}).mouseout(function() {
				$(this).find(".glyphicon-trash").hide()
			})
		} else {
			$(item).find(".glyphicon-thumbs-up").text(i.upCount).click(
					upComment).removeClass("hidden")
			$(item).find(".glyphicon-thumbs-down").text(i.downCount).click(
					downComment).removeClass("hidden")
		}
		$(item).removeClass("hidden").data("comment", i).appendTo(
				$(commentList))
	}
}
function addToMessageList(messageView, data) {
	for ( var index in data) {
		var i = data[index]
		var item = $(messageView).children().eq(0).clone()
		var user = i.srcUser
		$(item).find("#headImage").attr("src", "Image?file=" + user.headImage)
				.data("userId", user.id).click(gotoUserDetail)
		$(item).find("#userName").text(user.name).data("userId", user.id)
				.click(gotoUserDetail)
		$(item).find("#schoolMajor").text(user.school + " " + user.major)
		$(item).find("#createdTime").text(convertTime(i.createdTime))
		$(item).find("#content").text(i.content)
		$(item).find("#reply").click(clickReplyButton)
		$(item).find("#inputBox").data("state", 0)
		$(item).removeClass("hidden").data("message", i).appendTo(
				$(messageView))
	}
}
function isEmpty(s) {
	return s == null || s == ""
}
function addToPostList(postView, postList) {
	for ( var index in postList) {
		var i = postList[index]
		var item = $(postView).children().eq(0).clone()
		// 用户信息
		$(item).find("#headImage")
				.attr("src", "Image?file=" + i.user.headImage).data("userId",
						i.user.id).click(gotoUserDetail)
		$(item).find("#userName").text(i.user.name).data("userId", i.user.id)
				.click(gotoUserDetail)
		$(item).find("#schoolMajor").text(i.user.school + i.user.major)
		$(item).find("#realTime").text(convertTime(i.realTime))
		// 帖子内容
		if (typeof (i.mediaPath) != "undefined"
				&& isEmpty(i.mediaPath) == false) {
			console.log(i.mediaPath + " " + i.topic.form)
			$(item).find("#mediaPath").children().eq(i.topic.form).attr("src",
					"Image?file=" + i.mediaPath).removeClass("hidden")
		}
		$(item).find("#content").text(i.content)
		// 如果是话题主页，隐藏话题部分
		if (typeof (topicHomePage) == "undefined") {
			$(item).find("#topicInfo").text("#" + i.topic.title).data(
					"topicId", i.topic.id).click(gotoTopicDetail).removeClass(
					"hidden")
		}
		// 是不是转发的
		if (i.authorId != i.user.id) {
			// 如果我是第一个转发的，不显示lastUser
			if (i.lastUserId != i.authorId) {
				$(item).find("#lastUserInfo").text(i.lastUserName).removeClass(
						"hidden").data("userId", i.lastUserId).click(
						gotoUserDetail)
			}
			$(item).find("#authorName").text(i.authorName)
			$(item).find("#authorInfo").removeClass("hidden").data("userId",
					i.authorId).click(gotoUserDetail)
		}
		// 是不是我的帖子
		if (i.user.id != getMyId()) {
			$(item).find("#hi").removeClass("hidden")
		} else {
			$(item).find("#trash").removeClass("hidden")
		}

		if (i.commentCount > 0)
			$(item).find("#comment span").eq(1)
					.text("(" + i.commentCount + ")")
		if (i.forwardCount > 0)
			$(item).find("#forward span").eq(1)
					.text("(" + i.forwardCount + ")")
		if (i.praiseCount > 0)
			$(item).find("#praise span").eq(1).text("(" + i.praiseCount + ")")
		if (i.hasPraised) {
			$(item).find("#praise span").eq(0).css("color", "red")
		}
		if (i.hasForwarded) {
			$(item).find("#forward span").eq(0).css("color", "red")
		}
		$(item).find("#postContent").click(gotoPostDetail)
		$(item).find("#hi").click(clickHiButton)
		$(item).find("#comment").click(clickCommentButton)
		$(item).find("#trash").click(deletePost)
		$(item).find("#praise").click(praisePost)
		$(item).find("#forward").click(forwardPost)
		$(item).find("#inputBox").data("state", 0)
		$(item).removeClass("hidden").data("post", i).appendTo($(postView))
	}
}
function addToUserTable(table, userList) {
	for ( var index in userList) {
		var i = userList[index]
		var item = $(table).find("#simpleItem").eq(0).clone()
		$(item).find("#icon").attr("src", "Image?file=" + i.headImage)
		$(item).find("#title").text(i.name)
		$(item).find("#description").text(i.school + " " + i.major)
		$(item).data("userId", i.id).click(gotoUserDetail)
				.removeClass("hidden").appendTo($(table))
	}
}

// ====================comment 事件处理===========
function deleteComment() {
	var commentItem = $(this).parents("#commentItem")
	var comment = $(commentItem).data("comment")
	$.post("DeleteComment", {
		commentId : comment.id
	}, function() {
		$(commentItem).slideUp(1000, function() {
			$(commentItem).remove()
		})
	})
}
function upComment() {
	var target = $(this)
	var comment = $(this).parents("#commentItem").data("comment")
	console.log(comment.downCount)
	$.post("UpComment", {
		commentId : comment.id
	}, function() {
		comment.upCount++
		$(target).text(comment.upCount).animate({
			"font-size" : "+=10px"
		}).animate({
			"font-size" : "-=10px"
		})
	})
}
function downComment() {
	var target = $(this)
	var comment = $(this).parents("#commentItem").data("comment")
	console.log(comment.downCount)
	$.post("DownComment", {
		commentId : comment.id
	}, function() {
		comment.downCount++
		$(target).text(comment.downCount).animate({
			"font-size" : "-=10px"
		}).animate({
			"font-size" : "+=10px"
		})
	})
}
// ====================comment 事件处理结束===========
// ================messaeg事件处理=========
function clickReplyButton() {
	var messageItem = $(this).parents("#messageItem")
	var message = $(messageItem).data("message")
	var replySpan = $(messageItem).find("#reply")
	var inputBox = $(messageItem).find("#inputBox")
	if ($(inputBox).data("state") == 0) {
		$(inputBox).slideDown(1000)
		$(inputBox).find("button").click(function() {
			sendMessage(message.srcUser.id, $(inputBox).find("textArea").val())
			$(replySpan).click()
		})
		$(replySpan).text("取消回复")
		$(inputBox).data("state", 1).slideDown(700, function() {
			$(inputBox).find("textArea").focus()
		})
		$.scrollTo($(inputBox), 700)
	} else if ($(inputBox).data("state") == 1) {
		$(inputBox).slideUp(1000,function(){
			$(inputBox).data("state",0)
		})
		$(replySpan).text("回复")
	}
}
// =======post 事件处理============
// inputBox:state 0 隐藏，1 正在评论，2 正在私信;评论和私信共用一个inputBox
function clickHiButton() {
	var postItem = $(this).parents("#postItem")
	var inputBox = $(postItem).find("#inputBox")
	var hiSpan = $(postItem).find("#hi span").eq(1)
	var post = $(postItem).data("post")
	if ($(inputBox).data("state") == 0) {
		$(hiSpan).text("取消私信")
		$(inputBox).find("textArea").attr("placeholder", "私信内容").val("")
		$(inputBox).find("button").unbind().click(function() {
			sendMessage(post.user.id, $(inputBox).find("textArea").val())
			$(hiSpan).click()
		})
		$(inputBox).data("state", 2).slideDown(700, function() {
			$(inputBox).find("textArea").focus()
		})
		$.scrollTo($(inputBox), 700)
	} else if ($(inputBox).data("state") == 2) {
		$(hiSpan).text("私信")
		$(inputBox).data("state", 0).slideUp()
	}
}
function sendMessage(userId, msg) {
	$.post("SendMessage", {
		desUserId : userId,
		content : msg
	}, function() {

	})
}

function clickCommentButton() {
	var postItem = $(this).parents("#postItem")
	var inputBox = $(postItem).find("#inputBox")
	var commentSpan = $(postItem).find("#comment span").eq(1)
	var post = $(postItem).data("post")
	if ($(inputBox).data("state") == 0) {
		$(commentSpan).text("取消评论")
		$(inputBox).find("textArea").attr("placeholder", "评论内容").val("")
		$(inputBox).find("button").unbind().click(function() {
			commentPost($(inputBox).find("textArea").val(), postItem)
			$(commentSpan).click()
		})
		$(inputBox).data("state", 1).slideDown()
		$.scrollTo($(inputBox), 700, function() {
			$(inputBox).find("textArea").focus()
		})
	} else if ($(inputBox).data("state") == 1) {
		$(commentSpan).text(post.commentCount == 0 ? "评论" : post.commentCount)
		$(inputBox).data("state", 0).slideUp()
	}
}
function commentPost(comment, postItem) {
	var post = $(postItem).data("post")
	$.post("CreateComment", {
		postId : post.id,
		content : comment
	}, function() {
		post.commentCount++
		$(postItem).find("#comment span").eq(1).text(post.commentCount)
		//location = "post.jsp?postId=" + post.id
	})
}

function praisePost() {
	var post = $(this).parents("#postItem").data("post")
	var button = $(this).find("span").eq(0)
	var cnt = $(this).find("span").eq(1)
	if (post.hasPraised) {
		$.post("CancelPraisePost", {
			postId : post.id
		}, function() {
			post.hasPraised = false
			post.praiseCount -= 1
			$(button).css("color", "grey").animate({
				"font-size" : "-=10px"
			}, 1000).animate({
				"font-size" : "+=10px"
			})
			$(cnt).text(post.praiseCount == 0 ? "赞" : post.praiseCount)
		})
	} else {
		$.post("PraisePost", {
			postId : post.id
		}, function() {
			post.hasPraised = true
			post.praiseCount += 1
			$(button).css("color", "red").animate({
				"font-size" : "+=50px"
			}, 1000).animate({
				"font-size" : "-=50px",
			}, 1000)
			$(cnt).text(post.praiseCount)
		})
	}
}

function forwardPost() {
	var post = $(this).parents("#postItem").data("post")
	var button = $(this).find("span").eq(0)
	var cnt = $(this).find("span").eq(1)
	if (post.hasForwarded) {
		$.post("CancelForwardPost", {
			postId : post.id
		}, function() {
			post.hasForwarded = false
			post.forwardCount -= 1
			$(button).css("color", "grey").animate({
				"font-size" : "-=10px;"
			}).animate({
				"font-size" : "+=10px;"
			})
			$(cnt).text(post.forwardCount == 0 ? "转发" : post.forwardCount)
		})
	} else {
		if (post.authorId == getMyId())
			return;
		$.post("ForwardPost", {
			postId : post.id,
			lastUserId : post.user.id
		}, function() {
			post.hasForwarded = true
			post.forwardCount += 1
			$(button).css("color", "red").animate({
				"font-size" : "+=10px",
			}, 1000).animate({
				"font-size" : "-=10px",
			}, 1000)
			$(cnt).text(post.forwardCount)
		})
	}
}
function deletePost() {
	var postItem = $(this).parents("#postItem")
	var post = $(postItem).data("post")
	if (post.authorId == getMyId()) {
		$.post("DeletePost", {
			postId : post.id
		}, function() {
			$(postItem).slideUp(1400, function() {
				$(postItem).remove()
			})
		})
	}
}
// ==========detail===========
function gotoPostDetail() {
	var post = $(this).parents("#postItem").data("post")
	location = "post.jsp?postId=" + post.id
}
function gotoTopicDetail() {
	location = "topic.jsp?topicId=" + $(this).data("topicId")
}
function gotoUserDetail() {
	location = "user.jsp?who=" + $(this).data("userId")
}
// ===========user 事件处理结束=============
function onScrollToEnd(loadMore) {
	$(document).scroll(
			function() {
				if ($(document).scrollTop() + window.innerHeight == $(document)
						.height()) {
					loadMore()
				}
			});
}
