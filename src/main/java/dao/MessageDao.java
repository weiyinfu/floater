package dao;

import java.util.List;

import po.MessagePo;
import vo.MessageVo;

public interface MessageDao {
	void insertMessage(MessagePo msg); 
	List<MessageVo> getMessageListOfUser(long userId);
}
