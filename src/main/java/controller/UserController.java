package controller;

import java.io.IOException;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import po.UserPo;
import service.UserService;
import util.Util;
import vo.UserVo;

@Controller
public class UserController {
	@Resource
	UserService service;

	@RequestMapping("Login")
	@ResponseBody
	long login(String mail, String password, HttpServletRequest req,
			HttpServletResponse resp) throws IOException {
		long id = service.loginByMailAndPassword(mail, password);
		return id;
	}

	@RequestMapping("Register")
	@ResponseBody
	long register(String mail, String password, HttpServletRequest req,
			HttpServletResponse resp) {
		long id = service.registerByMailAndPassword(mail, password);
		return id;
	}

	@RequestMapping("UserDetail")
	@ResponseBody
	UserVo getDetail(@CookieValue(defaultValue = "1") long userId, long who) {
		UserVo data = service.getUserDetail(who, userId);
		return data;
	}
	@RequestMapping("CancelCareUser")
	@ResponseBody
	void cancelCareUser(@CookieValue(defaultValue = "1") long userId,
			long caredUserId) {
		service.cancelCareUser(userId, caredUserId);
	}
	@ResponseBody
	@RequestMapping("CareUser")
	void careUser(@CookieValue(defaultValue = "1") long userId,
			long caredUserId) {
		service.careUser(userId, caredUserId);
	}
	@ResponseBody
	@RequestMapping("UpdateUserDetail")
	void updateUserDetail(@CookieValue(defaultValue = "1") long userId,
			@RequestHeader(value = "user-agent") String userAgent,
			HttpServletResponse resp, UserPo userPo, MultipartFile image) {
		userPo.setId(userId);
		service.updateUserDetail(image, userPo);
		if (Util.isMobile(userAgent) == false) {
			try {
				resp.sendRedirect("me.jsp");
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
	}
	@ResponseBody
	@RequestMapping("CaredUserList")
	List<UserVo> caredUserList(long who, int beg, int len,
			HttpServletRequest req) {
		long time = Util.getLoadTime(req, "caredUserList", beg);
		List<UserVo> data = service.getCaredUserList(who, time, beg, len);
		return data;
	}
	@ResponseBody
	@RequestMapping("FansList")
	List<UserVo> fansList(long who, int beg, int len, HttpServletRequest req) {
		long time = Util.getLoadTime(req, "fansList", beg);
		List<UserVo> data = service.getFansList(who, time, beg, len);
		return data;
	}
	@ResponseBody
	@RequestMapping("PraiseUserList")
	List<UserVo> praiseUserList(long postId, int beg, int len,
			HttpServletRequest req) {
		long time = Util.getLoadTime(req, "praiseUserList", beg);
		List<UserVo> data = service.getPraiseUserList(postId, time, beg, len);
		return data;
	}

	@ResponseBody
	@RequestMapping("ForwardUserList")
	List<UserVo> forwardUserList(long postId, int beg, int len,
			HttpServletRequest req) {
		long time = Util.getLoadTime(req, "praiseUserList", beg);
		List<UserVo> data = service.getForwardUserList(postId, time, beg, len);
		return data;
	}

	@ResponseBody
	@RequestMapping("UserListByName")
	List<UserVo> userListByName(String keyword, int beg, int len,
			HttpServletRequest req) {
		long time = Util.getLoadTime(req, "userListByname", beg);
		List<UserVo> data = service.getUserListByName(keyword, time, beg, len);
		return data;
	}
	// @ResponseBody
	// @RequestMapping("UserListBySchool")
	// List<UserVo> userListBySchool(String keyword, int beg, int len,
	// HttpServletRequest req) {
	// long time = Util.getLoadTime(req, "userListByname", beg);
	// List<UserVo> data = service.getUserListBySchool(keyword, time, beg,
	// len);
	// return data;
	// }
}
