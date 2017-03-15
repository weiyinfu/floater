package vo;

import po.UserPo;

public class TopicVo {
	Long id;
	Long createdTime;
	String title;
	String content;
	String iconPath;
	Integer form;

	Integer postCount;
	Integer fansCount;
	Integer newPostCount;

	Long userId;
	UserPo user;
	boolean hasCared;
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public Long getCreatedTime() {
		return createdTime;
	}
	public void setCreatedTime(Long createdTime) {
		this.createdTime = createdTime;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getIconPath() {
		return iconPath;
	}
	public void setIconPath(String iconPath) {
		this.iconPath = iconPath;
	}
	public Integer getForm() {
		return form;
	}
	public void setForm(Integer form) {
		this.form = form;
	}
	public Integer getPostCount() {
		return postCount;
	}
	public void setPostCount(Integer postCount) {
		this.postCount = postCount;
	}
	public Integer getFansCount() {
		return fansCount;
	}
	public void setFansCount(Integer fansCount) {
		this.fansCount = fansCount;
	}
	public Integer getNewPostCount() {
		return newPostCount;
	}
	public void setNewPostCount(Integer newPostCount) {
		this.newPostCount = newPostCount;
	}
	public UserPo getUser() {
		return user;
	}
	public void setUser(UserPo user) {
		this.user = user;
	}
	public boolean isHasCared() {
		return hasCared;
	}
	public void setHasCared(boolean hasCared) {
		this.hasCared = hasCared;
	}

}
