package com.owl.project.dto;

import java.util.Date;
import java.util.HashMap;

import com.owl.chat.dto.ChatRoom;
import com.owl.member.dto.Member;

public class Project {
	private int projectIdx;
	private String projectName;
	private Date startDate;
	private Date dueDate;
	private HashMap<String, Member> members;
	private HashMap<Integer, Issue> issues;
	private HashMap<Integer, Label> lavels;
	private HashMap<Integer, Drive> drives;
	private HashMap<Integer, ChatRoom> chatRooms;
	private HashMap<Integer, Board> boards;
	public int getProjectIdx() {
		return projectIdx;
	}
	public void setProjectIdx(int projectIdx) {
		this.projectIdx = projectIdx;
	}
	public String getProjectName() {
		return projectName;
	}
	public void setProjectName(String projectName) {
		this.projectName = projectName;
	}
	public Date getStartDate() {
		return startDate;
	}
	public void setStartDate(Date startDate) {
		this.startDate = startDate;
	}
	public Date getDueDate() {
		return dueDate;
	}
	public void setDueDate(Date dueDate) {
		this.dueDate = dueDate;
	}
	public HashMap<String, Member> getMembers() {
		return members;
	}
	public void setMembers(HashMap<String, Member> members) {
		this.members = members;
	}
	public HashMap<Integer, Issue> getIssues() {
		return issues;
	}
	public void setIssues(HashMap<Integer, Issue> issues) {
		this.issues = issues;
	}
	public HashMap<Integer, Label> getLavels() {
		return lavels;
	}
	public void setLavels(HashMap<Integer, Label> lavels) {
		this.lavels = lavels;
	}
	public HashMap<Integer, Drive> getDrives() {
		return drives;
	}
	public void setDrives(HashMap<Integer, Drive> drives) {
		this.drives = drives;
	}
	public HashMap<Integer, ChatRoom> getChatRooms() {
		return chatRooms;
	}
	public void setChatRooms(HashMap<Integer, ChatRoom> chatRooms) {
		this.chatRooms = chatRooms;
	}
	public HashMap<Integer, Board> getBoards() {
		return boards;
	}
	public void setBoards(HashMap<Integer, Board> boards) {
		this.boards = boards;
	}
	@Override
	public String toString() {
		return "Project [projectIdx=" + projectIdx + ", projectName=" + projectName + ", startDate=" + startDate
				+ ", dueDate=" + dueDate + ", members=" + members + ", issues=" + issues + ", lavels=" + lavels
				+ ", drives=" + drives + ", chatRooms=" + chatRooms + ", boards=" + boards + "]";
	}
	
	
	

}
