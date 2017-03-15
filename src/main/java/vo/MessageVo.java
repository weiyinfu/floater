package vo;

import po.UserPo;

public class MessageVo {
	UserPo srcUser;
	UserPo desUser;
	String content;
	Long srcUserId;
	Long desUserId;
	Long createdTime;
	Long id;

	public Long getSrcUserId() {
		return srcUserId;
	}
	public void setSrcUserId(Long srcUserId) {
		this.srcUserId = srcUserId;
	}
	public Long getDesUserId() {
		return desUserId;
	}
	public void setDesUserId(Long desUserId) {
		this.desUserId = desUserId;
	} 
	public UserPo getSrcUser() {
		return srcUser;
	}
	public void setSrcUser(UserPo srcUser) {
		this.srcUser = srcUser;
	}
	public UserPo getDesUser() {
		return desUser;
	}
	public void setDesUser(UserPo desUser) {
		this.desUser = desUser;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Long getCreatedTime() {
		return createdTime;
	}
	public void setCreatedTime(Long createdTime) {
		this.createdTime = createdTime;
	}
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}

}
