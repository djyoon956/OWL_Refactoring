package com.owl.project.dto;

public class ProjectList {
	private int projectIdx;
	private String email;
	private int favorite;
	private String projectColor;
	public int getProjectIdx() {
		return projectIdx;
	}
	public void setProjectIdx(int projectIdx) {
		this.projectIdx = projectIdx;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public int getFavorite() {
		return favorite;
	}
	public void setFavorite(int favorite) {
		this.favorite = favorite;
	}
	public String getProjectColor() {
		return projectColor;
	}
	public void setProjectColor(String projectColor) {
		this.projectColor = projectColor;
	}
	@Override
	public String toString() {
		return "ProjectList [projectIdx=" + projectIdx + ", email=" + email + ", favorite=" + favorite
				+ ", projectColor=" + projectColor + "]";
	}
	
	

}
