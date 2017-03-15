package service;

import java.util.List;

import po.TopicPo;
import vo.TopicVo;

public interface TopicService {
	void careTopic(long userId, long topicId);
	void cancelCareTopic(long userId, long topicId);
	Long createTopic(TopicPo topic);
	void deleteTopic(long userId, long topicId);
	// ==============
	TopicVo getTopicDetail(long userId, long topicId);
	List<TopicVo> getRecommendTopicList();
	List<TopicVo> getCaredTopicList(long me, long time, int beg, int len);
	List<TopicVo> getTopicListByForm(long form, long time, int beg, int len);
	List<TopicVo> getTopicListByHot(long recent, long time, int beg, int len);
	List<TopicVo> getTopicListByPostCount(long time, int beg, int len);
	List<TopicVo> getTopicListByTime(long time, int beg, int len);
	List<TopicVo> getTopicListByUser(long userId, long time, int beg, int len);
	List<TopicVo> getTopicListByTitle(String keywords, long time, int beg,
			int len);
}
