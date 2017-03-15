package service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import dao.CommentDao;
import po.CommentPo;
import service.CommentService;
import vo.CommentVo;

@Service
public class CommentServiceImpl implements CommentService {
	@Resource
	CommentDao mapper;
	List<CommentVo> filt(List<CommentVo> data) {
		for (CommentVo i : data) {
			i.getUser().setHeadImage("headImage/" + i.getUser().getHeadImage());
		}
		return data;
	}
	@Override
	public void upComment(long commentId) {
		mapper.upComment(commentId);
	}
	@Override
	public void downComment(long commentId) {
		mapper.downComment(commentId);
	}
	@Transactional
	@Override
	public void deleteComment(long userId, long commentId) {
		CommentPo comment = mapper.getCommentById(commentId);
		if (comment.getUserId().equals(userId)) {
			mapper.deleteComment(commentId);
		}
	}

	@Transactional
	@Override
	public Long createComment(CommentPo comment) {
		comment.setCreatedTime(System.currentTimeMillis());
		mapper.insertComment(comment);
		return mapper.lastInsertId();
	}

	@Override
	public List<CommentVo> getCommentList(long postId, long time, int beg,
			int len) {
		List<CommentVo> data = mapper.getCommentList(postId, time, beg, len);
		return filt(data);
	}
}
