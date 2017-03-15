package service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import dao.TopicDao;
import po.TopicCarePo;
import po.TopicPo;
import po.UserPo;
import service.TopicService;
import vo.TopicVo;
@Service
public class TopicServiceImpl implements TopicService {
	@Resource
	TopicDao mapper;

	@Transactional
	@Override
	public void careTopic(long userId, long topicId) {
		TopicCarePo care = mapper.getTopicCare(userId, topicId);
		if (care == null) {
			TopicCarePo po = new TopicCarePo();
			Long time = System.currentTimeMillis();
			po.setCreatedTime(time);
			po.setLastAccessTime(time);
			po.setUserId(userId);
			po.setTopicId(topicId);
			mapper.insertTopicCare(po);
		}
	}
	@Transactional
	@Override
	public void cancelCareTopic(long userId, long topicId) {
		TopicCarePo care = mapper.getTopicCare(userId, topicId);
		if (care != null) {
			mapper.deleteTopicCare(userId, topicId);
		}
	}

	@Transactional
	@Override
	public Long createTopic(TopicPo topic) {
		String iconPath = topic.getIconPath();
		if (iconPath != null) {
			topic.setIconPath(
					iconPath.substring(iconPath.lastIndexOf('/') + 1));
		}
		topic.setCreatedTime(System.currentTimeMillis());
		mapper.insertTopic(topic);
		return mapper.lastInsertId();
	}
	@Transactional
	@Override
	public void deleteTopic(long userId, long topicId) {
		TopicPo topic = mapper.getTopicPo(topicId);
		if (topic.getUserId().equals(userId)) {
			mapper.deleteTopic(topicId);
		}
	}
	// ================
	TopicVo filt(TopicVo data) {
		data.setIconPath("topicIcon/" + data.getIconPath());
		UserPo user = data.getUser();
		if (user != null)
			user.setHeadImage("headImage/" + user.getHeadImage());
		return data;
	}
	List<TopicVo> filt(List<TopicVo> data) {
		data.forEach(this::filt);
		return data;
	}
	@Override
	public TopicVo getTopicDetail(long userId, long topicId) {
		TopicVo data = mapper.getTopicDetail(topicId);
		data.setHasCared(mapper.getTopicCare(userId, data.getId()) != null);
		return filt(data);
	}

	@Override
	public List<TopicVo> getRecommendTopicList() {
		List<TopicVo> data = mapper.getRecommendTopicList();
		return filt(data);
	}
	@Override
	public List<TopicVo> getCaredTopicList(long me, long time, int beg,
			int len) {
		List<TopicVo> data = mapper.getCaredTopicList(me, time, beg, len);
		return filt(data);
	}
	@Override
	public List<TopicVo> getTopicListByForm(long form, long time, int beg,
			int len) {
		List<TopicVo> data = mapper.getTopicListByForm(form, time, beg, len);
		return filt(data);
	}
	@Override
	public List<TopicVo> getTopicListByHot(long recent, long time, int beg,
			int len) {
		List<TopicVo> data = mapper.getTopicListByHot(recent, time, beg, len);
		return filt(data);
	}
	@Override
	public List<TopicVo> getTopicListByPostCount(long time, int beg, int len) {
		List<TopicVo> data = mapper.getTopicListByPostCount(time, beg, len);
		return filt(data);
	}
	@Override
	public List<TopicVo> getTopicListByTime(long time, int beg, int len) {
		List<TopicVo> data = mapper.getTopicListByTime(time, beg, len);
		return filt(data);
	}
	@Override
	public List<TopicVo> getTopicListByUser(long userId, long time, int beg,
			int len) {
		List<TopicVo> data = mapper.getTopicListByUser(userId, time, beg, len);
		return filt(data);
	}
	@Override
	public List<TopicVo> getTopicListByTitle(String keyWord, long time, int beg,
			int len) {

		keyWord = "%" + keyWord.replace("%", "") + "%";
		List<TopicVo> data = mapper.getTopicListByTitle(keyWord, time, beg,
				len);
		return filt(data);
	}

}
