package controller;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import service.other.FlashService;
import service.other.SchoolService;
import service.other.TopicIconService;
import util.FileToStream;
import util.Sky;
import util.Util;
import vo.FlashVo;

@Controller
public class ResourceController {
	@Resource
	TopicIconService topicIconService;
	@Resource
	SchoolService schoolService;
	@Resource
	FlashService flashService;

	@ResponseBody
	@RequestMapping("TopicIconList")
	List<String> getTopicIconList(HttpServletRequest req, int beg, int len) {
		List<String> ans = topicIconService.getIcons(beg, len);
		return ans;
	}

	@ResponseBody
	@RequestMapping("SchoolList")
	List<String> getSchoolList(HttpServletRequest req, String key) {
		List<String> list = null;
		if (key != null) {
			list = schoolService.getSchoolsByName(key);
		}
		return list;
	}

	@ResponseBody
	@RequestMapping("Flash")
	List<FlashVo> getFlash() {
		List<FlashVo> data = flashService.getFlash();
		return data;
	}

	@ResponseBody
	@RequestMapping("Apk")
	void getApk(HttpServletResponse resp) throws IOException {
		resp.setContentType("application/apk");
		resp.addHeader("Content-Disposition",
				"attachment; filename=" + "floater.apk");
		String path = Sky.resPath + "floater.apk";
		resp.setContentLengthLong(Files.size(Paths.get(path)));
		FileToStream.writeAndClose(resp.getOutputStream(), path);
	}

	@ResponseBody
	@RequestMapping("Image")
	void getMedia(HttpServletRequest req, HttpServletResponse resp, String file)
			throws IOException {
		resp.setContentLengthLong(Files.size(Paths.get(Sky.resPath+file)));
		FileToStream.writeAndClose(resp.getOutputStream(), Sky.resPath + file);
	}

	@ResponseBody
	@RequestMapping("test")
	void test(HttpServletRequest req) {
		Util.debug(req);
	}
}
