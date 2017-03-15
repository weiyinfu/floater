package controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import po.CommentPo;
import service.CommentService;
import util.Util;
import vo.CommentVo;

@Controller
public class CommentController {
	@Resource
	CommentService service;

	@RequestMapping("UpComment")
	@ResponseBody
	void upComment(long commentId) {
		service.upComment(commentId);
	}

	@RequestMapping("DownComment")
	@ResponseBody
	void downComment(long commentId) {
		service.downComment(commentId);
	}

	@RequestMapping("CreateComment")
	@ResponseBody
	void createComment(@CookieValue(defaultValue = "1") long userId,
			CommentPo po) {
		po.setUserId(userId);
		service.createComment(po);
	}
	@RequestMapping("DeleteComment")
	@ResponseBody
	void deleteComment(@CookieValue(defaultValue = "1") long userId,
			long commentId) {
		service.deleteComment(userId, commentId);
	}
	@RequestMapping("CommentListOfPost")
	@ResponseBody
	List<CommentVo> getCommentListOfPost(long postId, int beg, int len,
			HttpServletRequest req) {
		long time = Util.getLoadTime(req, "commentListLoadTime", beg);
		List<CommentVo> data = service.getCommentList(postId, time, beg, len);
		return data;
	}
}
