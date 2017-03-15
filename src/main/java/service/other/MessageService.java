package service.other;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.alibaba.fastjson.JSON;

import dao.MessageDao;
import po.MessagePo;
import po.UserPo;
import vo.MessageVo;

@Service
public class MessageService {
	@Resource
	MessageDao messageDao;
	MessageVo filt(MessageVo messageVo) {
		UserPo srcUser = messageVo.getSrcUser();
		if (srcUser.getHeadImage().startsWith("headImage") == false)
			srcUser.setHeadImage("headImage/" + srcUser.getHeadImage());
		UserPo desUser = messageVo.getDesUser();
		if (desUser.getHeadImage().startsWith("headImage") == false)
			desUser.setHeadImage("headImage/" + desUser.getHeadImage());
		return messageVo;
	}
	List<MessageVo> filt(List<MessageVo> list) {
		list.forEach(this::filt);
		return list;
	}
	public List<MessageVo> getMessageListOfUser(long userId) {
		List<MessageVo> a = messageDao.getMessageListOfUser(userId);
		System.out.println(JSON.toJSONString(a, true));
		return filt(a);
	}
	public void sendMessage(MessagePo msg) {
		msg.setCreatedTime(System.currentTimeMillis());
		messageDao.insertMessage(msg);
	}
}
