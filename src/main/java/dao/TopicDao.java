package dao;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import po.TopicCarePo;
import po.TopicPo;
import vo.TopicVo;

public interface TopicDao {
	@Select("select last_insert_id()")
	long lastInsertId();
 
	@Select("SELECT * FROM topic_care WHERE userId = #{me} AND topicId = #{topicId}")
	TopicCarePo getTopicCare(@Param("me") long me,
			@Param("topicId") long topicId);

	void insertTopicCare(TopicCarePo topicCarePo);

	@Delete("DELETE FROM topic_care WHERE userId = #{me} AND topicId =#{topicId}")
	void deleteTopicCare(@Param("me") long me, @Param("topicId") long topicId);

	void insertTopic(TopicPo topicPo);
	@Delete("delete from topic where id=#{topicId}")
	void deleteTopic(Long topicId);
	// =========
	@Select("select * from topic where id=#{topicId}")
	TopicPo getTopicPo(long topicId);

	TopicVo getTopicDetail(@Param("topicId") long topicId);

	@Select("SELECT * FROM topic_view WHERE id IN (SELECT topicId FROM recommend_topic)")
	List<TopicVo> getRecommendTopicList();

	List<TopicVo> getCaredTopicList(@Param("me") long me,
			@Param("time") long time, @Param("beg") int beg,
			@Param("len") int len);

	List<TopicVo> getTopicListByForm(@Param("form") long form,
			@Param("time") long time, @Param("beg") int beg,
			@Param("len") int len);

	List<TopicVo> getTopicListByHot(@Param("recent") long recent,
			@Param("time") long time, @Param("beg") int beg,
			@Param("len") int len);
	
	List<TopicVo> getTopicListByPostCount(@Param("time") long time,
			@Param("beg") int beg, @Param("len") int len);
	List<TopicVo> getTopicListByTime(@Param("time") long time,
			@Param("beg") int beg, @Param("len") int len);
	List<TopicVo> getTopicListByUser(@Param("who") long who,
			@Param("time") long time, @Param("beg") int beg,
			@Param("len") int len);
	List<TopicVo> getTopicListByTitle(@Param("keyWord") String keyWord,
			@Param("time") long time, @Param("beg") int beg,
			@Param("len") int len);
}
