package com.model;

public class TShoufei implements java.io.Serializable
{
	private Integer shoufeiId;

	private String shoufeiShijian;

	private String shoufeiXiangmu;
	
	private String shoufeiJine;
	private String yijiaojine;
	

	private Integer zhuhuId;
	private Integer isnotice;

	private String del;
	
	private String zhuhuName;

	public TShoufei()
	{
	}

	public TShoufei(String shoufeiShijian, String shoufeiXiangmu,
			Integer zhuhuId, String del)
	{
		this.shoufeiShijian = shoufeiShijian;
		this.shoufeiXiangmu = shoufeiXiangmu;
		this.zhuhuId = zhuhuId;
		this.del = del;
	}
	public Integer getShoufeiId()
	{
		return this.shoufeiId;
	}

	public void setShoufeiId(Integer shoufeiId)
	{
		this.shoufeiId = shoufeiId;
	}

	public String getZhuhuName()
	{
		return zhuhuName;
	}

	public String getShoufeiJine()
	{
		return shoufeiJine;
	}

	public void setShoufeiJine(String shoufeiJine)
	{
		this.shoufeiJine = shoufeiJine;
	}

	public void setZhuhuName(String zhuhuName)
	{
		this.zhuhuName = zhuhuName;
	}

	public String getShoufeiShijian()
	{
		return this.shoufeiShijian;
	}

	public void setShoufeiShijian(String shoufeiShijian)
	{
		this.shoufeiShijian = shoufeiShijian;
	}

	public String getShoufeiXiangmu()
	{
		return this.shoufeiXiangmu;
	}

	public void setShoufeiXiangmu(String shoufeiXiangmu)
	{
		this.shoufeiXiangmu = shoufeiXiangmu;
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

	public String getYijiaojine() {
		return yijiaojine;
	}

	public void setYijiaojine(String yijiaojine) {
		this.yijiaojine = yijiaojine;
	}

	public Integer getIsnotice() {
		return isnotice;
	}

	public void setIsnotice(Integer isnotice) {
		this.isnotice = isnotice;
	}
	
	

}