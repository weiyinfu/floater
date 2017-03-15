package service;

import java.util.List;

import po.CommentPo;
import vo.CommentVo;

public interface CommentService {
	void upComment(long commentId);
	void downComment(long commentId);
	List<CommentVo> getCommentList(long postId, long time, int beg, int len);
	void deleteComment(long userId, long commentId);
	Long createComment(CommentPo comment);
}
