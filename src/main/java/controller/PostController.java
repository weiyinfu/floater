package controller;

import java.io.IOException;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import po.PostPo;
import service.PostService;
import util.Util;
import vo.PostVo;

@Controller
public class PostController {
	@Resource
	PostService service;

	@RequestMapping("PostDetail")
	@ResponseBody
	PostVo getPostDetail(@CookieValue(defaultValue = "1") long userId,
			long postId) {
		PostVo data = service.getPostDetail(userId, postId);
		return data;
	}

	@RequestMapping("CancelForwardPost")
	@ResponseBody
	void cancelForwardPost(@CookieValue(defaultValue = "1") long userId,
			long postId) {
		service.cancelForwardPost(userId, postId);
	}

	@RequestMapping("CancelPraisePost")
	@ResponseBody
	void cancelPraisePost(@CookieValue(defaultValue = "1") long userId,
			long postId) {
		service.cancelPraisePost(userId, postId);
	}

	@RequestMapping("PraisePost")
	@ResponseBody
	void PraisePost(@CookieValue(defaultValue = "1") long userId, long postId) {
		service.praisePost(userId, postId);
	}
	@RequestMapping("CreatePost")
	@ResponseBody
	void createPost(MultipartFile mediaFile, PostPo po,
			@CookieValue(defaultValue = "1") long userId,
			HttpServletRequest req, HttpServletResponse resp)
					throws IOException {
		po.setUserId(userId);
		service.createPost(mediaFile, po);
		if (Util.isMobile(req) == false) {
			resp.sendRedirect("topic.jsp?topicId=" + po.getTopicId());
		}
	}
	@RequestMapping("DeletePost")
	@ResponseBody
	void deletePost(@CookieValue(defaultValue = "1") long userId, long postId) {
		service.deletePost(userId, postId);
	}
	@RequestMapping("ForwardPost")
	@ResponseBody
	void forwardPost(@CookieValue(defaultValue = "1") long userId, long postId,
			long lastUserId) {
		service.forwardPost(userId, postId, lastUserId);
	}
	@RequestMapping("CaredPostList")
	@ResponseBody
	List<PostVo> caredPostList(HttpServletRequest req,
			@CookieValue(defaultValue = "1") long userId, int beg, int len) {
		long time = Util.getLoadTime(req, "postListByTopicLoadtime", beg);
		List<PostVo> data = service.getCaredPostList(userId, time, beg, len);
		return data;
	}
	@RequestMapping("PostListByTopic")
	@ResponseBody
	List<PostVo> postListByTopic(HttpServletRequest req,
			@CookieValue(defaultValue = "1") long userId, long topicId, int beg,
			int len) {
		long time = Util.getLoadTime(req, "postListByTopicLoadtime", beg);
		List<PostVo> data = service.getPostListByTopic(userId, topicId, time,
				beg, len);
		return data;
	}

	@RequestMapping("PostListOrderedByColumn")
	@ResponseBody
	List<PostVo> postListOrderedByColumn(HttpServletRequest req,
			@CookieValue(defaultValue = "1") long userId, String column,
			int beg, int len) {
		long time = Util.getLoadTime(req, "postListByTopicLoadtime", beg);
		List<PostVo> data = service.getPostListOrderedByColumn(userId, column,
				time, beg, len);
		return data;
	}

	@RequestMapping("PostListByUser")
	@ResponseBody
	List<PostVo> postListByUser(HttpServletRequest req,
			@CookieValue(defaultValue = "1") long userId, long who, int beg,
			int len) {
		long time = Util.getLoadTime(req, "postListByUser", beg);
		List<PostVo> data = service.getPostListByUser(userId, who, time, beg,
				len);
		return data;
	}
}
