package com.model;

/**
 * TZhuhu generated by MyEclipse Persistence Tools
 */

public class TFangwu implements java.io.Serializable
{
	private Integer id;
	private String name;
	private String mianji;
	private String weizhi;
	private String fangxing;
	private String danjia;
	private String zongjia;
	private String zhuhu;
	private String zhuhuTel;
	private String fangwuno;
	private String del;

	public TFangwu()
	{
	}

	public TFangwu(Integer id,String name,String mianji,String weizhi,String fangxing,String danjia,String zongjia,String zhuhu,String zhuhuTel,String del)
	{
		this.id = id ;
		this.name = name;
		this.mianji = mianji;
		this.weizhi = weizhi;
		this.fangxing = fangxing;
		this.danjia = danjia;
		this.zongjia = zongjia;
		this.zhuhu = zhuhu ;
		this.zhuhuTel = zhuhuTel;
		this.del = del;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getMianji() {
		return mianji;
	}

	public void setMianji(String mianji) {
		this.mianji = mianji;
	}

	public String getWeizhi() {
		return weizhi;
	}

	public void setWeizhi(String weizhi) {
		this.weizhi = weizhi;
	}

	public String getFangxing() {
		return fangxing;
	}

	public void setFangxing(String fangxing) {
		this.fangxing = fangxing;
	}

	public String getFangwuno() {
		return fangwuno;
	}

	public void setFangwuno(String fangwuno) {
		this.fangwuno = fangwuno;
	}

	public String getDanjia() {
		return danjia;
	}

	public void setDanjia(String danjia) {
		this.danjia = danjia;
	}

	public String getZongjia() {
		return zongjia;
	}

	public void setZongjia(String zongjia) {
		this.zongjia = zongjia;
	}

	public String getZhuhu() {
		return zhuhu;
	}

	public void setZhuhu(String zhuhu) {
		this.zhuhu = zhuhu;
	}

	public String getZhuhuTel() {
		return zhuhuTel;
	}

	public void setZhuhuTel(String zhuhuTel) {
		this.zhuhuTel = zhuhuTel;
	}

	public String getDel() {
		return del;
	}

	public void setDel(String del) {
		this.del = del;
	}
	
	
}