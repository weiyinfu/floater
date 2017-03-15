package controller;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import po.MessagePo;
import service.other.MessageService;
import vo.MessageVo;

@Controller
public class MessageController {
	@Resource
	MessageService service;

	@RequestMapping("SendMessage")
	@ResponseBody
	void sendMessage(MessagePo msg, @CookieValue long userId) {
		msg.setSrcUserId(userId);
		service.sendMessage(msg);
	}

	@RequestMapping("MessageListOfUser")
	@ResponseBody
	List<MessageVo> getMessageListOfUser(
			@CookieValue(defaultValue = "1") long userId) {
		return service.getMessageListOfUser(userId);
	}

}
