package com.model;

public class TZhuhu implements java.io.Serializable
{

	private Integer zhuhuId;
	private String zhuhuName;
	private String zhuhuIdcard;
	private String zhuhuTel;
	private String zhuhuFangxing;
	private String zhuhuMianji;
	private String zhuhuShiyongmianj;
	private String zhuhuRuzhushijian;
	private String zhuhuCheliangxinxi;
	private String userName;
	private String userPw;
	private String del;
	private String fangwuno;

	public String getFangwuno() {
		return fangwuno;
	}

	public void setFangwuno(String fangwuno) {
		this.fangwuno = fangwuno;
	}

	public TZhuhu()
	{
	}

	public TZhuhu(Integer zhuhuId,String zhuhuName,String zhuhuIdcard,
			String zhuhuTel,String zhuhuFangxing,String zhuhuMianji,
			String zhuhuShiyongmianj,String zhuhuRuzhushijian,
			String zhuhuCheliangxinxi,String userName,String userPw,String del)
	{
		this.zhuhuName = zhuhuName;
		this.zhuhuIdcard = zhuhuIdcard;
		this.zhuhuTel = zhuhuTel;
		this.zhuhuFangxing = zhuhuFangxing;
		this.zhuhuMianji = zhuhuMianji;
		this.zhuhuShiyongmianj = zhuhuShiyongmianj;
		this.zhuhuRuzhushijian = zhuhuRuzhushijian;
		this.zhuhuCheliangxinxi = zhuhuCheliangxinxi;
		this.userName = userName;
		this.userPw = userPw;
		this.del = del;
	}

	public Integer getZhuhuId() {
		return zhuhuId;
	}

	public void setZhuhuId(Integer zhuhuId) {
		this.zhuhuId = zhuhuId;
	}

	public String getZhuhuName() {
		return zhuhuName;
	}

	public void setZhuhuName(String zhuhuName) {
		this.zhuhuName = zhuhuName;
	}

	public String getZhuhuIdcard() {
		return zhuhuIdcard;
	}

	public void setZhuhuIdcard(String zhuhuIdcard) {
		this.zhuhuIdcard = zhuhuIdcard;
	}

	public String getZhuhuTel() {
		return zhuhuTel;
	}

	public void setZhuhuTel(String zhuhuTel) {
		this.zhuhuTel = zhuhuTel;
	}

	public String getZhuhuFangxing() {
		return zhuhuFangxing;
	}

	public void setZhuhuFangxing(String zhuhuFangxing) {
		this.zhuhuFangxing = zhuhuFangxing;
	}

	public String getZhuhuMianji() {
		return zhuhuMianji;
	}

	public void setZhuhuMianji(String zhuhuMianji) {
		this.zhuhuMianji = zhuhuMianji;
	}

	public String getZhuhuShiyongmianj() {
		return zhuhuShiyongmianj;
	}

	public void setZhuhuShiyongmianj(String zhuhuShiyongmianj) {
		this.zhuhuShiyongmianj = zhuhuShiyongmianj;
	}

	public String getZhuhuRuzhushijian() {
		return zhuhuRuzhushijian;
	}

	public void setZhuhuRuzhushijian(String zhuhuRuzhushijian) {
		this.zhuhuRuzhushijian = zhuhuRuzhushijian;
	}

	public String getZhuhuCheliangxinxi() {
		return zhuhuCheliangxinxi;
	}

	public void setZhuhuCheliangxinxi(String zhuhuCheliangxinxi) {
		this.zhuhuCheliangxinxi = zhuhuCheliangxinxi;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getUserPw() {
		return userPw;
	}

	public void setUserPw(String userPw) {
		this.userPw = userPw;
	}

	public String getDel() {
		return del;
	}

	public void setDel(String del) {
		this.del = del;
	}
	
}