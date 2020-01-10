package com.owl.project.dto;

import java.util.Date;
import java.util.HashMap;

import com.owl.chat.dto.ChatRoom;
import com.owl.member.dto.Member;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
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

}
