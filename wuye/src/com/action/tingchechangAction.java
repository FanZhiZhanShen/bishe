package com.action;

import java.util.List;
import java.util.Map;

import org.apache.struts2.ServletActionContext;

import com.dao.TTingchechangDAO;
import com.model.TTingchechang;
import com.opensymphony.xwork2.ActionSupport;

public class tingchechangAction extends ActionSupport
{
	private int id;
	private String tingchechangname;
	private String cheweizhuangtai;
	private String danjia;
	private String del;
	private String message;
	private String path;
	private TTingchechangDAO tingchechangDAO;
	
	public String tingchechangAdd()
	{
		TTingchechang tingchechang=new TTingchechang();
		tingchechang.setTingchechangname(tingchechangname);
		tingchechang.setCheweizhuangtai(cheweizhuangtai);
		tingchechang.setDanjia(danjia);         
		tingchechang.setDel("no");
		tingchechangDAO.save(tingchechang);
		this.setMessage("保存成功!");
		this.setPath("tingchechangMana.action");
		return "succeed";
	}
	
	public String tingchechangMana()
	{
		String sql="from TTingchechang where del !='yes'";
		List tingchechangList=tingchechangDAO.getHibernateTemplate().find(sql);
		Map request=(Map)ServletActionContext.getContext().get("request");
		request.put("tingchechangList", tingchechangList);
		return ActionSupport.SUCCESS;
	}
		
	public String tingchechangDel()
	{
		
		TTingchechang tingchechang=tingchechangDAO.findById(id);
		tingchechang.setDel("yes");
		tingchechangDAO.attachDirty(tingchechang);
		this.setMessage("删除成功!");
		this.setPath("tingchechangMana.action");
		return "succeed";
	}
		
	public String tingchechangSearch()
	{
		String sql="from TTingchechang where del !='yes' and tingchechangName like '%"+tingchechangname.trim()+"%'";
		List tingchechangList=tingchechangDAO.getHibernateTemplate().find(sql);
		Map request=(Map)ServletActionContext.getContext().get("request");
		request.put("tingchechangList", tingchechangList);
		return ActionSupport.SUCCESS;
	}
		
	public String tingchechangEditPre()
	{
		
		TTingchechang tingchechang=tingchechangDAO.findById(id);
		Map request=(Map)ServletActionContext.getContext().get("request");
		request.put("tingchechang", tingchechang);
		return ActionSupport.SUCCESS;
	}

	public String tingchechangEdit()
	{
		TTingchechang tingchechang=tingchechangDAO.findById(id);
		tingchechang.setTingchechangname(tingchechangname);
		tingchechang.setCheweizhuangtai(cheweizhuangtai);
		tingchechang.setDanjia(danjia);
		tingchechang.setDel("no");
		tingchechangDAO.attachDirty(tingchechang);
		this.setMessage("保存成功!");
		this.setPath("tingchechangMana.action");
		return "succeed";
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	public TTingchechangDAO getZhuhuDAO() {
		return tingchechangDAO;
	}

	public void setZhuhuDAO(TTingchechangDAO tingchechangDAO) {
		this.tingchechangDAO = tingchechangDAO;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
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

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

	public String getPath() {
		return path;
	}

	public void setPath(String path) {
		this.path = path;
	}

	public TTingchechangDAO getTingchechangDAO() {
		return tingchechangDAO;
	}

	public void setTingchechangDAO(TTingchechangDAO tingchechangDAO) {
		this.tingchechangDAO = tingchechangDAO;
	}
}
