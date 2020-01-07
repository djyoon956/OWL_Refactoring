package com.owl.member.dto;

import java.util.HashMap;

import com.owl.calendar.dto.Pcalendar;
import com.owl.project.dto.Project;

public class Member {
	private String userName;
	private String password;
	private int enabled;
	private String name;
	private String profilePic;
	private String signFrom;
	private HashMap<Integer, Project> projects;
	private Setting setting;
	private HashMap<Integer, Pcalendar> pCalendars;
	private Boolean authOk;
	private String authority;
	private String role;
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public int getEnabled() {
		return enabled;
	}
	public void setEnabled(int enabled) {
		this.enabled = enabled;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getProfilePic() {
		return profilePic;
	}
	public void setProfilePic(String profilePic) {
		this.profilePic = profilePic;
	}
	public String getSignFrom() {
		return signFrom;
	}
	public void setSignFrom(String signFrom) {
		this.signFrom = signFrom;
	}
	public HashMap<Integer, Project> getProjects() {
		return projects;
	}
	public void setProjects(HashMap<Integer, Project> projects) {
		this.projects = projects;
	}
	public Setting getSetting() {
		return setting;
	}
	public void setSetting(Setting setting) {
		this.setting = setting;
	}
	public HashMap<Integer, Pcalendar> getpCalendars() {
		return pCalendars;
	}
	public void setpCalendars(HashMap<Integer, Pcalendar> pCalendars) {
		this.pCalendars = pCalendars;
	}
	public Boolean getAuthOk() {
		return authOk;
	}
	public void setAuthOk(Boolean authOk) {
		this.authOk = authOk;
	}
	public String getAuthority() {
		return authority;
	}
	public void setAuthority(String authority) {
		this.authority = authority;
	}
	public String getRole() {
		return role;
	}
	public void setRole(String role) {
		this.role = role;
	}
	@Override
	public String toString() {
		return "Member [userName=" + userName + ", password=" + password + ", enabled=" + enabled + ", name=" + name
				+ ", profilePic=" + profilePic + ", signFrom=" + signFrom + ", projects=" + projects + ", setting="
				+ setting + ", pCalendars=" + pCalendars + ", authOk=" + authOk + ", authority=" + authority + ", role="
				+ role + "]";
	}
	
	
	
	
	
	
	
	
	
	
	
}
