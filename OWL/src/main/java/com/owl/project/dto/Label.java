package com.owl.project.dto;

public class Label {
	private int labelIdx;
	private String labelName;
	private String labelColor;
	public int getLabelIdx() {
		return labelIdx;
	}
	public void setLabelIdx(int labelIdx) {
		this.labelIdx = labelIdx;
	}
	public String getLabelName() {
		return labelName;
	}
	public void setLabelName(String labelName) {
		this.labelName = labelName;
	}
	public String getLabelColor() {
		return labelColor;
	}
	public void setLabelColor(String labelColor) {
		this.labelColor = labelColor;
	}
	@Override
	public String toString() {
		return "Label [labelIdx=" + labelIdx + ", labelName=" + labelName + ", labelColor=" + labelColor + "]";
	}
	
	
	

}
