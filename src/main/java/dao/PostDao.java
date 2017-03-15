package dao;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import po.ForwardPo;
import po.PostPo;
import po.PraisePo;
import vo.PostVo;

public interface PostDao {
	@Select("select last_insert_id()")
	long lastInsertId();

	@Update("update topic_care set lastAccessTime=#{time} where topicId=#{topicId} and userId=#{me}")
	void updateTopicLastAccessTime(@Param("me") long me,
			@Param("topicId") long topicId, @Param("time") long time);

	@Select("select form from topic,post where topic.id=post.topicId and post.id=#{postId}")
	int getPostForm(long postId);

	@Select("select * from post where id =#{postId}")
	PostPo getPostPo(long postId);

	PostVo getPostDetail(@Param("me") long me, @Param("postId") long postId);

	@Select("select * from praise where userId=#{userId} and postId=#{postId}")
	PraisePo getPraise(@Param("userId") long userId,
			@Param("postId") long postId);

	@Select("select id from forward where userId=#{userId} and postId=#{postId}")
	ForwardPo getForward(@Param("userId") long userId,
			@Param("postId") long postId);

	@Insert("insert into praise (userId,postId,createdTime) values(#{userId},#{postId},#{createdTime})")
	void insertPraise(PraisePo praisePo);

	@Insert("insert into forward(userId,postId,createdTime,lastUserId) values(#{userId},#{postId},#{createdTime},#{lastUserId})")
	void insertForward(ForwardPo forwardPo);

	@Delete("delete from praise where userId=#{userId} and postId=#{postId}")
	void deletePraise(@Param("userId") long userId,
			@Param("postId") long postId);

	@Delete("delete from forward where userId=#{userId} and postId=#{postId}")
	void deleteForward(@Param("userId") long userId,
			@Param("postId") long postId);

	@Delete("delete from post where id=#{postId}")
	void deletePost(long postId);

	void insertPost(PostPo postPo);

	List<PostVo> getCaredPostList(@Param("me") long me,
			@Param("time") long time, @Param("beg") int beg,
			@Param("len") int len);
	List<PostVo> getPostListByTopic(@Param("me") long me,
			@Param("topicId") long topicId, @Param("time") long time,
			@Param("beg") int beg, @Param("len") int len);
	List<PostVo> getPostListOrderedByColumn(@Param("me") long me,
			@Param("column") String column, @Param("time") long time,
			@Param("beg") int beg, @Param("len") int len);
	List<PostVo> getPostListByUser(@Param("me") long me, @Param("who") long who,
			@Param("time") long time, @Param("beg") int beg,
			@Param("len") int len);
}
