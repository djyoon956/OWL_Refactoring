package com.owl.member.dto;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class Setting {
	private int settingIdx;
	private String theme;
	private String font;
	private String iconColor;
}
