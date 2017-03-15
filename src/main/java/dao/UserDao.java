package dao;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import po.UserCarePo;
import po.UserPo;
import vo.UserVo;

public interface UserDao {
	@Select("select last_insert_id()")
	long lastInsertId();

	@Select("select id from user_care where userId=#{userId} and caredUserId=#{caredUserId}")
	UserCarePo getUserCare(@Param("userId") long userId,
			@Param("caredUserId") long caredUserId);

	@Insert("insert into user_care(userId,caredUserId,createdTime)values(#{userId},#{caredUserId},#{createdTime})")
	void insertUserCare(UserCarePo userCarePo);

	@Delete(" delete from user_care where userId=#{userId} and caredUserId=#{caredUserId}")
	void deleteUserCare(@Param("userId") long userId,
			@Param("caredUserId") long caredUserId);

	void updateUserDetail(UserPo user);

	void insertUser(UserPo user);

	@Select("select * from user where mail=#{mail} and password=#{password}")
	UserPo getUserByMailAndPassword(@Param("mail") String mail,
			@Param("password") String password);
	@Select("select*  from user where mail=#{mail}")
	UserPo getUserByMail(String mail);
	// =======
	@Select("SELECT id FROM user WHERE thirdPartyId=#{thirdPartyId} AND thirdPartyType=#{thirdPartyType}")
	Long getUserId(@Param("thirdPartyType") int thirdPartyType,
			@Param("thirdPartyId") String thirdPartyId);

	@Select("SELECT*FROM user_view WHERE id = #{who}")
	UserVo getUserDetail(long who);

	@Select("SELECT*FROM user WHERE id = #{who}")
	UserPo getUserPo(long who);

	List<UserVo> getCaredUserList(@Param("me") long me,
			@Param("time") long time, @Param("beg") int beg,
			@Param("len") int len);
	List<UserVo> getFansList(@Param("me") long me, @Param("time") long time,
			@Param("beg") int beg, @Param("len") int len);
	List<UserVo> getPraiseUserList(@Param("postId") long postId,
			@Param("time") long time, @Param("beg") int beg,
			@Param("len") int len);
	List<UserVo> getForwardUserList(@Param("postId") long postId,
			@Param("time") long time, @Param("beg") int beg,
			@Param("len") int len);
	List<UserVo> getUserListByName(@Param("keyWord") String keyWord,
			@Param("time") long time, @Param("beg") int beg,
			@Param("len") int len);
}
