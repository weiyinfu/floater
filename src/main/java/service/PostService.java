package service;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import po.PostPo;
import vo.PostVo;

public interface PostService {
	void praisePost(long userId, long postId);
	void cancelPraisePost(long userId, long postId);
	boolean forwardPost(long userId, long lastUserId, long postId);
	boolean cancelForwardPost(long userId, long postId);
	void deletePost(long userId, long postId);
	Long createPost(MultipartFile mediaFile, PostPo postPo);
	// ===========
	PostVo getPostDetail(long me, long postId);

	List<PostVo> getCaredPostList(long me, long time, int beg, int len);

	List<PostVo> getPostListByTopic(long me, long topicId, long time, int beg,
			int len);
	List<PostVo> getPostListOrderedByColumn(long me, String column, long time,
			int beg, int len);

	List<PostVo> getPostListByUser(long me, long who, long time, int beg,
			int len);
}
