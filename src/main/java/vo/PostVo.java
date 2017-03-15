package vo;

import po.TopicPo;
import po.UserPo;

public class PostVo {
	Long id;
	Long createdTime;
	String mediaPath;
	String content;

	TopicPo topic;
	UserPo user;

	Long authorId;
	String authorName;
	Long lastUserId;
	String lastUserName;

	Boolean hasForwarded;
	Boolean hasPraised;
	Integer commentCount;
	Integer praiseCount;
	Integer forwardCount;

	Long forwardTime;
	Long realTime;

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
	public String getMediaPath() {
		return mediaPath;
	}
	public void setMediaPath(String mediaPath) {
		this.mediaPath = mediaPath;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public TopicPo getTopic() {
		return topic;
	}
	public void setTopic(TopicPo topic) {
		this.topic = topic;
	}
	public UserPo getUser() {
		return user;
	}
	public void setUser(UserPo user) {
		this.user = user;
	}
	public Long getAuthorId() {
		return authorId;
	}
	public void setAuthorId(Long authorId) {
		this.authorId = authorId;
	}
	public String getAuthorName() {
		return authorName;
	}
	public void setAuthorName(String authorName) {
		this.authorName = authorName;
	}
	public Long getLastUserId() {
		return lastUserId;
	}
	public void setLastUserId(Long lastUserId) {
		this.lastUserId = lastUserId;
	}
	public String getLastUserName() {
		return lastUserName;
	}
	public void setLastUserName(String lastUserName) {
		this.lastUserName = lastUserName;
	}
	public Boolean getHasForwarded() {
		return hasForwarded;
	}
	public void setHasForwarded(Boolean hasForwarded) {
		this.hasForwarded = hasForwarded;
	}
	public Boolean getHasPraised() {
		return hasPraised;
	}
	public void setHasPraised(Boolean hasPraised) {
		this.hasPraised = hasPraised;
	}
	public Integer getCommentCount() {
		return commentCount;
	}
	public void setCommentCount(Integer commentCount) {
		this.commentCount = commentCount;
	}
	public Integer getPraiseCount() {
		return praiseCount;
	}
	public void setPraiseCount(Integer praiseCount) {
		this.praiseCount = praiseCount;
	}
	public Integer getForwardCount() {
		return forwardCount;
	}
	public void setForwardCount(Integer forwardCount) {
		this.forwardCount = forwardCount;
	}
	public Long getForwardTime() {
		return forwardTime;
	}
	public void setForwardTime(Long forwardTime) {
		this.forwardTime = forwardTime;
	}
	public Long getRealTime() {
		return realTime;
	}
	public void setRealTime(Long realTime) {
		this.realTime = realTime;
	}
}
