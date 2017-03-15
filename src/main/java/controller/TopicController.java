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

import po.TopicPo;
import service.TopicService;
import util.Util;
import vo.TopicVo;
@Controller
public class TopicController {
	@Resource
	TopicService service;

	@RequestMapping("TopicDetail")
	@ResponseBody
	TopicVo getTopicDetail(@CookieValue(defaultValue = "1") long userId,
			long topicId) {
		TopicVo data = service.getTopicDetail(userId, topicId);
		return data;
	}
	@RequestMapping("CancelCareTopic")
	@ResponseBody
	void cancelCareTopic(long topicId, HttpServletRequest req) {
		long userId = Util.getUserId(req);
		service.cancelCareTopic(userId, topicId);
	}

	@RequestMapping("CareTopic")
	@ResponseBody
	void careTopic(@CookieValue(defaultValue = "1") long userId, long topicId) {
		service.careTopic(userId, topicId);
	}
	@RequestMapping("CreateTopic")
	@ResponseBody
	void createTopic(HttpServletRequest req,
			@CookieValue(defaultValue = "1") long userId,
			HttpServletResponse resp, TopicPo topic) {
		topic.setUserId(userId);
		long topicId = service.createTopic(topic);
		if (Util.isMobile(req) == false) {
			try {
				resp.sendRedirect("topic.jsp?topicId=" + topicId);
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
	}

	@RequestMapping("DeleteTopic")
	@ResponseBody
	void createTopic(@CookieValue(defaultValue = "1") long userId,
			long topicId) {
		service.deleteTopic(userId, topicId);
	}

	@ResponseBody
	@RequestMapping("CaredTopicList")
	List<TopicVo> caredTopicList(HttpServletRequest req,
			@CookieValue(defaultValue = "1") long userId, int beg, int len) {
		long time = Util.getLoadTime(req, "caredTopicList", beg);
		List<TopicVo> data = service.getCaredTopicList(userId, time, beg, len);
		return data;
	}
	@RequestMapping("RecommendTopicList")
	@ResponseBody
	List<TopicVo> recommentTopicList() {
		List<TopicVo> data = service.getRecommendTopicList();
		return data;
	}
	@RequestMapping("TopicListByForm")
	@ResponseBody
	List<TopicVo> topicListByForm(int form, int beg, int len,
			HttpServletRequest req) {
		long time = Util.getLoadTime(req, "topiclistByformLoadTime", beg);
		List<TopicVo> data = service.getTopicListByForm(form, time, beg, len);
		return data;
	}
	@ResponseBody
	@RequestMapping("TopicListByHot")
	List<TopicVo> topicListByHot(int beg, int len, HttpServletRequest req) {
		long lastLoadTime = Util.getLoadTime(req, "topicListByhot", beg);
		long recent = lastLoadTime - 3 * 3600 * 24;
		List<TopicVo> data = service.getTopicListByHot(recent, lastLoadTime,
				beg, len);
		return data;
	}
	@ResponseBody
	@RequestMapping("TopicListByPostCount")
	List<TopicVo> topicListByPostCount(HttpServletRequest req, int beg,
			int len) {
		long lastLoadTime = Util.getLoadTime(req, "topicListByPostCount", beg);
		List<TopicVo> data = service.getTopicListByPostCount(lastLoadTime, beg,
				len);
		return data;
	}

	@RequestMapping("TopicListByTime")
	@ResponseBody
	List<TopicVo> topicListByTime(HttpServletRequest req, int beg, int len) {
		long time = Util.getLoadTime(req, "topicListByTimeLoadTime", beg);
		List<TopicVo> data = service.getTopicListByTime(time, beg, len);
		return data;
	}
	@ResponseBody
	@RequestMapping("TopicListByTitle")
	List<TopicVo> topicListByTitle(HttpServletRequest req, int beg, int len,
			String keywords) {
		long time = Util.getLoadTime(req, "topicListByTitle", beg);
		List<TopicVo> data = service.getTopicListByTitle(keywords, time, beg,
				len);
		return data;
	}
	@ResponseBody
	@RequestMapping("TopicListByUser")
	List<TopicVo> topicListByUser(long who, int beg, int len,
			HttpServletRequest req) {
		long time = Util.getLoadTime(req, "topicListByUser", beg);
		List<TopicVo> data = service.getTopicListByUser(who, time, beg, len);
		return data;
	}
}
