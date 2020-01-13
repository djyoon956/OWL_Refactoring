package com.owl.project.dto;

import java.util.HashMap;

import com.owl.chat.dto.ChatRoom;
import com.owl.drive.dto.Drive;
import com.owl.kanban.dto.Issue;
import com.owl.member.dto.Member;
import com.owl.notice.dto.Notice;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class Project {
	
	private int projectIdx;
	private String projectName;
	private HashMap<String, Member> members;
	private HashMap<Integer, Issue> issues;
	private HashMap<Integer, Label> lavels;
	private HashMap<Integer, Drive> drives;
	private HashMap<Integer, ChatRoom> chatRooms;
	private HashMap<Integer, Notice> boards;

}
