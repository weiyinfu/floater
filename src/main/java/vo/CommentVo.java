package vo;

public class CommentVo {
	Long id;
	UserVo user;
	Long createdTime;
	String content;
	Long postId;
	Long upCount;
	Long downCount;
	
	
	
	
	public Long getUpCount() {
		return upCount;
	}
	public void setUpCount(Long upCount) {
		this.upCount = upCount;
	}
	public Long getDownCount() {
		return downCount;
	}
	public void setDownCount(Long downCount) {
		this.downCount = downCount;
	}
	public Long getPostId() {
		return postId;
	}
	public void setPostId(Long postId) {
		this.postId = postId;
	}
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public UserVo getUser() {
		return user;
	}
	public void setUser(UserVo user) {
		this.user = user;
	}
	public Long getCreatedTime() {
		return createdTime;
	}
	public void setCreatedTime(Long createdTime) {
		this.createdTime = createdTime;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
}
