package service.impl;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.UUID;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import dao.UserDao;
import po.UserCarePo;
import po.UserPo;
import service.UserService;
import util.Sky;
import vo.UserVo;
@Service
public class UserServiceImpl implements UserService {
	@Resource
	UserDao mapper;

	UserVo filt(UserVo data) {
		data.setHeadImage("headImage/" + data.getHeadImage());
		return data;
	}
	List<UserVo> filt(List<UserVo> data) {
		data.forEach(this::filt);
		return data;
	}
	@Override
	public UserVo getUserDetail(long who, long me) {
		UserVo data = mapper.getUserDetail(who);
		data.setHasCared(mapper.getUserCare(me, who) != null);
		return filt(data);
	}
	@Override
	public List<UserVo> getCaredUserList(long me, long time, int beg, int len) {
		List<UserVo> data = mapper.getCaredUserList(me, time, beg, len);
		return filt(data);
	}
	@Override
	public List<UserVo> getFansList(long me, long time, int beg, int len) {
		List<UserVo> data = mapper.getFansList(me, time, beg, len);
		return filt(data);
	}
	@Override
	public List<UserVo> getPraiseUserList(long postId, long time, int beg,
			int len) {
		List<UserVo> data = mapper.getPraiseUserList(postId, time, beg, len);
		return filt(data);
	}

	@Override
	public List<UserVo> getForwardUserList(long postId, long time, int beg,
			int len) {
		List<UserVo> data = mapper.getForwardUserList(postId, time, beg, len);
		return filt(data);
	}

	@Override
	public List<UserVo> getUserListByName(String keyWord, long time, int beg,
			int len) {
		keyWord = "%" + keyWord.replace("%", "") + "%";
		List<UserVo> data = mapper.getUserListByName(keyWord, time, beg, len);
		return filt(data);
	}
	// =================
	// @Transactional
	// public long login(UserPo user) {
	// Long userId = mapper.getUserId(user.getThirdPartyType(),
	// user.getThirdPartyId());
	// if (userId == null) {
	// String headImageUrl = user.getHeadImage();
	// if (headImageUrl != null) {
	// String headImage = UUID.randomUUID() + ".png";
	// StreamToFile.fromNet(headImageUrl,
	// Sky.resPath + "headImage/" + headImage);
	// user.setHeadImage(headImage);
	// } else {
	// user.setHeadImage("default.jpg");
	// }
	// user.setRegisterTime(System.currentTimeMillis());
	// mapper.insertUser(user);
	// userId = mapper.getUserId(user.getThirdPartyType(),
	// user.getThirdPartyId());
	//
	// }
	// return userId;
	// }
	@Override
	public long loginByMailAndPassword(String mail, String password) {
		UserPo userPo = mapper.getUserByMailAndPassword(mail, password);
		return userPo == null ? -1 : userPo.getId();
	}
	@Transactional
	@Override
	public long registerByMailAndPassword(String mail, String password) {
		UserPo userPo = mapper.getUserByMail(mail);
		if (userPo != null)
			return -1;
		userPo = new UserPo();
		userPo.setMail(mail);
		userPo.setPassword(password);
		userPo.setRegisterTime(System.currentTimeMillis());
		mapper.insertUser(userPo);
		return mapper.lastInsertId();
	}
	@Transactional
	@Override
	public void careUser(long me, long who) {
		if (mapper.getUserCare(me, who) == null) {
			UserCarePo po = new UserCarePo();
			po.setUserId(me);
			po.setCaredUserId(who);
			po.setCreatedTime(System.currentTimeMillis());
			mapper.insertUserCare(po);
		}
	}
	@Transactional
	@Override
	public void cancelCareUser(long me, long who) {
		if (mapper.getUserCare(me, who) != null) {
			mapper.deleteUserCare(me, who);
		}
	}
	@Override
	@Transactional
	public void updateUserDetail(MultipartFile image, UserPo user) {
		if (image != null && image.getSize() > 0) {
			String headImage = UUID.randomUUID().toString() + ".png";
			try {
				image.transferTo(
						new File(Sky.resPath + "headImage/" + headImage));
			} catch (IllegalStateException | IOException e) {
				e.printStackTrace();
			}
			user.setHeadImage(headImage);
		}
		mapper.updateUserDetail(user);
	}
}
