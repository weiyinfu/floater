package vo;

public class UserVo {
	Long id;

	String name;
	String password;
	String headImage;
	String school;
	String major;
	Integer age;
	Integer sex;
	String mail;
	Long registerTime;

	Integer postCount;
	Integer topicCount;
	Integer caredUserCount;
	Integer fansCount;
	Integer caredTopicCount;

	Boolean hasCared;
	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getHeadImage() {
		return headImage;
	}

	public void setHeadImage(String headImage) {
		this.headImage = headImage;
	}

	public String getSchool() {
		return school;
	}

	public void setSchool(String school) {
		this.school = school;
	}

	public String getMajor() {
		return major;
	}

	public void setMajor(String major) {
		this.major = major;
	}

	public Integer getAge() {
		return age;
	}

	public void setAge(Integer age) {
		this.age = age;
	}

	public Integer getSex() {
		return sex;
	}

	public void setSex(Integer sex) {
		this.sex = sex;
	}

	public String getMail() {
		return mail;
	}

	public void setMail(String mail) {
		this.mail = mail;
	}

	public Long getRegisterTime() {
		return registerTime;
	}

	public void setRegisterTime(Long registerTime) {
		this.registerTime = registerTime;
	}

	public Integer getPostCount() {
		return postCount;
	}

	public void setPostCount(Integer postCount) {
		this.postCount = postCount;
	}

	public Integer getTopicCount() {
		return topicCount;
	}

	public void setTopicCount(Integer topicCount) {
		this.topicCount = topicCount;
	}

	public Integer getCaredUserCount() {
		return caredUserCount;
	}

	public void setCaredUserCount(Integer caredUserCount) {
		this.caredUserCount = caredUserCount;
	}

	public Integer getFansCount() {
		return fansCount;
	}

	public void setFansCount(Integer fansCount) {
		this.fansCount = fansCount;
	}

	public Integer getCaredTopicCount() {
		return caredTopicCount;
	}

	public void setCaredTopicCount(Integer caredTopicCount) {
		this.caredTopicCount = caredTopicCount;
	}

	public Boolean getHasCared() {
		return hasCared;
	}

	public void setHasCared(Boolean hasCared) {
		this.hasCared = hasCared;
	}

}
