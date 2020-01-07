package com.owl.member.dto;

public class Setting {
	private int settingIdx;
	private String theme;
	private String font;
	private String iconColor;
	public int getSettingIdx() {
		return settingIdx;
	}
	public void setSettingIdx(int settingIdx) {
		this.settingIdx = settingIdx;
	}
	public String getTheme() {
		return theme;
	}
	public void setTheme(String theme) {
		this.theme = theme;
	}
	public String getFont() {
		return font;
	}
	public void setFont(String font) {
		this.font = font;
	}
	public String getIconColor() {
		return iconColor;
	}
	public void setIconColor(String iconColor) {
		this.iconColor = iconColor;
	}
	@Override
	public String toString() {
		return "Setting [settingIdx=" + settingIdx + ", theme=" + theme + ", font=" + font + ", iconColor=" + iconColor
				+ "]";
	}

	
	
}
 