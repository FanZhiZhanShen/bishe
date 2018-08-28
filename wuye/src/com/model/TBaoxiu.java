package com.model;

public class TBaoxiu implements java.io.Serializable
{

	private Integer baoxiuId;

	private String baoxiuShijian;

	private String baoxiuBeizhu;

	private int zhuhuId;

	private String del;
	
	private String baoxiuZhuangtai;
	
	private String zhuhuName;
	
	public TBaoxiu()
	{
	}

	public TBaoxiu(String baoxiuShijian, String baoxiuBeizhu, String zhuhuId,
			String del)
	{
		this.baoxiuShijian = baoxiuShijian;
		this.baoxiuBeizhu = baoxiuBeizhu;
		this.del = del;
	}

	public Integer getBaoxiuId()
	{
		return this.baoxiuId;
	}

	public String getZhuhuName()
	{
		return zhuhuName;
	}

	public String getBaoxiuZhuangtai()
	{
		return baoxiuZhuangtai;
	}

	public void setBaoxiuZhuangtai(String baoxiuZhuangtai)
	{
		this.baoxiuZhuangtai = baoxiuZhuangtai;
	}

	public void setZhuhuName(String zhuhuName)
	{
		this.zhuhuName = zhuhuName;
	}

	public void setBaoxiuId(Integer baoxiuId)
	{
		this.baoxiuId = baoxiuId;
	}

	public String getBaoxiuShijian()
	{
		return this.baoxiuShijian;
	}

	public void setBaoxiuShijian(String baoxiuShijian)
	{
		this.baoxiuShijian = baoxiuShijian;
	}

	public String getBaoxiuBeizhu()
	{
		return this.baoxiuBeizhu;
	}

	public void setBaoxiuBeizhu(String baoxiuBeizhu)
	{
		this.baoxiuBeizhu = baoxiuBeizhu;
	}


	public int getZhuhuId()
	{
		return zhuhuId;
	}

	public void setZhuhuId(int zhuhuId)
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