package service;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import po.UserPo;
import vo.UserVo;

public interface UserService {
	// long login(UserPo user);
	void careUser(long me, long who);
	void cancelCareUser(long me, long who);
	void updateUserDetail(MultipartFile image, UserPo user);
	long loginByMailAndPassword(String mail, String password);
	long registerByMailAndPassword(String mail, String password);
	// ====================
	UserVo getUserDetail(long me, long who);
	List<UserVo> getFansList(long who, long time, int beg, int len);
	List<UserVo> getCaredUserList(long me, long time, int beg, int len);
	List<UserVo> getPraiseUserList(long postId, long time, int beg, int len);
	List<UserVo> getForwardUserList(long postId, long time, int beg, int len);
	List<UserVo> getUserListByName(String keyWord, long time, int beg, int len);
}
