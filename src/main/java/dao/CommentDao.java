package dao;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import po.CommentPo;
import vo.CommentVo;

public interface CommentDao {
	@Select("select last_insert_id()")
	long lastInsertId();

	@Update("update comment set upCount=upCount+1 where id=#{commentId}")
	void upComment(long commentId);
	@Update("update comment set downCount=downCount+1 where id=#{commentId}")
	void downComment(long commentId);

	void insertComment(CommentPo comment);

	@Delete("delete from comment where id=#{commentId}")
	void deleteComment(long commentId);

	@Select("select * from comment where id=#{commentId}")
	CommentPo getCommentById(long commentId);

	List<CommentVo> getCommentList(@Param("postId") long postId,
			@Param("time") long time, @Param("beg") int beg,
			@Param("len") int len);
}
