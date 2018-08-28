package com.model;

public class TTousu implements java.io.Serializable
{
	private Integer tousuId;

	private String tousuShijian;

	private String tousuYuanyin;

	private Integer zhuhuId;

	private String del;
	
	private String tousuZhuangtai;
	
	private String zhuhuName;

	public TTousu()
	{
	}

	public TTousu(String tousuShijian, String tousuYuanyin, Integer zhuhuId,
			String del)
	{
		this.tousuShijian = tousuShijian;
		this.tousuYuanyin = tousuYuanyin;
		this.zhuhuId = zhuhuId;
		this.del = del;
	}

	public Integer getTousuId()
	{
		return this.tousuId;
	}

	public void setTousuId(Integer tousuId)
	{
		this.tousuId = tousuId;
	}

	public String getTousuShijian()
	{
		return this.tousuShijian;
	}

	public String getTousuZhuangtai()
	{
		return tousuZhuangtai;
	}

	public void setTousuZhuangtai(String tousuZhuangtai)
	{
		this.tousuZhuangtai = tousuZhuangtai;
	}

	public void setTousuShijian(String tousuShijian)
	{
		this.tousuShijian = tousuShijian;
	}

	public String getZhuhuName()
	{
		return zhuhuName;
	}

	public void setZhuhuName(String zhuhuName)
	{
		this.zhuhuName = zhuhuName;
	}

	public String getTousuYuanyin()
	{
		return this.tousuYuanyin;
	}

	public void setTousuYuanyin(String tousuYuanyin)
	{
		this.tousuYuanyin = tousuYuanyin;
	}

	public Integer getZhuhuId()
	{
		return this.zhuhuId;
	}

	public void setZhuhuId(Integer zhuhuId)
	{
		this.zhuhuId = zhuhuId;
	}

	public String getDel()
	{
		return this.del;
	}

	public void setDel(String del)
	{
		this.del = del;
	}

}