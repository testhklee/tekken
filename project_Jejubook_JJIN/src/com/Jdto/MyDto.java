package com.Jdto;

public class MyDto {
	
	private String name;
	private String emailorphone;
	private String password;
	private String birth;
	private int gender;
	private String enabled;
	private String role;
	private String userdate;
	
	public MyDto() {
		super();
	}

	public MyDto(String name, String emailorphone, String password, String birth, int gender,
			String enabled, String role, String userdate) {
		super();
		this.name = name;
		this.emailorphone = emailorphone;
		this.password = password;
		this.birth = birth;
		this.gender = gender;
		this.enabled = enabled;
		this.role = role;
		this.userdate = userdate;
	}

	public MyDto(String name, String emailorphone, String password, String birth, int gender) {
		super();
		this.name = name;
		this.emailorphone = emailorphone;
		this.password = password;
		this.birth = birth;
		this.gender = gender;
	}
	
	public MyDto(String emailorphone, String password) {
		super();
		this.emailorphone = emailorphone;
		this.password = password;
	}
	
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getEmailorphone() {
		return emailorphone;
	}

	public void setEmailorphone(String emailorphone) {
		this.emailorphone = emailorphone;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getBirth() {
		return birth;
	}

	public void setBirth(String birth) {
		this.birth = birth;
	}

	public int getGender() {
		return gender;
	}

	public void setGender(int gender) {
		this.gender = gender;
	}

	public String getEnabled() {
		return enabled;
	}

	public void setEnabled(String enabled) {
		this.enabled = enabled;
	}

	public String getRole() {
		return role;
	}

	public void setRole(String role) {
		this.role = role;
	}

	public String getUserdate() {
		return userdate;
	}

	public void setUserdate(String userdate) {
		this.userdate = userdate;
	}
	
}
