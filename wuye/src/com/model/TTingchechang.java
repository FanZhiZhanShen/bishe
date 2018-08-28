package com.model;

public class TTingchechang implements java.io.Serializable
{
	private Integer id;
	private String tingchechangname;
	private String cheweizhuangtai;
	private String danjia;
	private String del;

	public TTingchechang()
	{
	}

	public TTingchechang(Integer id,String tingchechangname,String cheweizhuangtai,String danjia,String del)
	{
		this.id = id;
		this.tingchechangname= tingchechangname;
		this.cheweizhuangtai= cheweizhuangtai; 
		this.danjia= danjia;          
		this.del= del;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getTingchechangname() {
		return tingchechangname;
	}

	public void setTingchechangname(String tingchechangname) {
		this.tingchechangname = tingchechangname;
	}

	public String getCheweizhuangtai() {
		return cheweizhuangtai;
	}

	public void setCheweizhuangtai(String cheweizhuangtai) {
		this.cheweizhuangtai = cheweizhuangtai;
	}

	public String getDanjia() {
		return danjia;
	}

	public void setDanjia(String danjia) {
		this.danjia = danjia;
	}

	public String getDel() {
		return del;
	}

	public void setDel(String del) {
		this.del = del;
	}

	
	
}