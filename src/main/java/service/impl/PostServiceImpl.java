package service.impl;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.UUID;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.alibaba.fastjson.JSON;

import dao.PostDao;
import dao.TopicDao;
import po.ForwardPo;
import po.PostPo;
import po.PraisePo;
import po.TopicPo;
import po.UserPo;
import service.PostService;
import util.Sky;
import util.Util;
import vo.PostVo;
@Service
public class PostServiceImpl implements PostService {
	@Resource
	PostDao postDao;
	@Resource
	TopicDao topicDao;

	PostVo filt(PostVo postVo) {
		if (postVo.getMediaPath() != null) {
			System.out.println(JSON.toJSONString(postVo));
			postVo.setMediaPath(Sky.mediaFolder[postVo.getTopic().getForm()]
					+ postVo.getMediaPath());
		}
		UserPo user = postVo.getUser();
		user.setHeadImage("headImage/" + user.getHeadImage());
		TopicPo topic = postVo.getTopic();
		topic.setIconPath("topicIcon/" + topic.getIconPath());
		return postVo;
	}
	List<PostVo> filt(List<PostVo> data) {
		data.forEach(this::filt);
		return data;
	}
	@Override
	public PostVo getPostDetail(long me, long postId) {
		PostVo postVo = postDao.getPostDetail(me, postId);
		return filt(postVo);
	}
	@Override
	public List<PostVo> getCaredPostList(long me, long time, int beg, int len) {
		List<PostVo> data = postDao.getCaredPostList(me, time, beg, len);
		if (data != null)
			data = filt(data);
		return data;
	}
	@Override
	public List<PostVo> getPostListByUser(long me, long who, long time, int beg,
			int len) {
		List<PostVo> data = postDao.getPostListByUser(me, who, time, beg, len);
		if (data != null)
			filt(data);
		return data;
	}
	@Override
	public List<PostVo> getPostListByTopic(long me, long topicId, long time,
			int beg, int len) {
		List<PostVo> data = postDao.getPostListByTopic(me, topicId, time, beg,
				len);
		if (beg == 0) {
			postDao.updateTopicLastAccessTime(me, topicId, time);
		}
		if (data != null) {
			filt(data);
		}
		return data;
	}

	@Override
	public List<PostVo> getPostListOrderedByColumn(long me, String column,
			long time, int beg, int len) {
		List<PostVo> data = postDao.getPostListOrderedByColumn(me, column, time,
				beg, len);
		if (data != null) {
			filt(data);
		}
		return data;
	}

	// ==============
	@Transactional
	@Override
	public void praisePost(long userId, long postId) {
		PraisePo praise = postDao.getPraise(userId, postId);
		if (praise == null) {
			PraisePo po = new PraisePo();
			po.setCreatedTime(System.currentTimeMillis());
			po.setUserId(userId);
			po.setPostId(postId);
			postDao.insertPraise(po);
		}
	}
	@Override
	@Transactional
	public void cancelPraisePost(long userId, long postId) {
		PraisePo praise = postDao.getPraise(userId, postId);
		if (praise != null) {
			postDao.deletePraise(userId, postId);
		}
	}
	@Override
	@Transactional
	public boolean forwardPost(long userId, long postId, long lastUserId) {
		boolean result = false;
		PostPo postPo = postDao.getPostPo(postId);
		// cannot forward your own post
		if (postPo.getUserId().equals(userId) == false) {
			ForwardPo forward = postDao.getForward(userId, postId);
			if (forward == null) {
				ForwardPo po = new ForwardPo();
				po.setUserId(userId);
				po.setPostId(postId);
				po.setLastUserId(lastUserId);
				po.setCreatedTime(System.currentTimeMillis());
				postDao.insertForward(po);
			}
		}
		return result;
	}
	@Override
	@Transactional
	public boolean cancelForwardPost(long userId, long postId) {
		ForwardPo forward = postDao.getForward(userId, postId);
		boolean res = false;
		if (forward != null) {
			postDao.deleteForward(userId, postId);
			res = true;
		}
		return res;
	}
	@Override
	@Transactional
	public void deletePost(long userId, long postId) {
		PostPo po = postDao.getPostPo(postId);
		int form = postDao.getPostForm(postId);
		if (po.getUserId().equals(userId)) {
			postDao.deletePost(postId);
			Util.deleteFile(
					Sky.resPath + Sky.mediaFolder[form] + po.getMediaPath());
		}
	}
	@Override
	@Transactional
	public Long createPost(MultipartFile midiaFile, PostPo postPo) {
		postPo.setCreatedTime(System.currentTimeMillis());
		if (midiaFile.getSize() > 0) {
			String mediaPath = UUID.randomUUID().toString();
			postPo.setMediaPath(mediaPath);
			Integer form = topicDao.getTopicPo(postPo.getTopicId()).getForm();
			String filePath = Sky.resPath + Sky.mediaFolder[form] + "/"
					+ mediaPath;
			try {
				midiaFile.transferTo(new File(filePath));
			} catch (IllegalStateException | IOException e) {
				e.printStackTrace();
			}
		}
		postDao.insertPost(postPo);
		return postDao.lastInsertId();
	}
}
