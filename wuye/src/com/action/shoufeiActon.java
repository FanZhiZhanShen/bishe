package com.action;

import java.util.List;
import java.util.Map;

import org.apache.struts2.ServletActionContext;

import com.dao.TShoufeiDAO;
import com.dao.TTousuDAO;
import com.dao.TZhuhuDAO;
import com.model.TFangwu;
import com.model.TShoufei;
import com.model.TTousu;
import com.model.TZhuhu;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class shoufeiActon extends ActionSupport
{
	private int shoufeiId;
	private int zhuhuId;
	private String shoufeiShijian;
	private String shoufeiXiangmu;
	private String shoufeiJine;
	private String yijiaojine;
	private String message;
	private String path;	
	private TShoufeiDAO shoufeiDAO;
	private TZhuhuDAO zhuhuDAO;
	
	public String shoufeiAdd()
	{
		TShoufei shoufei=new TShoufei();
		shoufei.setShoufeiShijian(shoufeiShijian);
		shoufei.setShoufeiXiangmu(shoufeiXiangmu);
		shoufei.setShoufeiJine(shoufeiJine);
		if(yijiaojine==null){yijiaojine="0";}
		shoufei.setYijiaojine(yijiaojine);
		shoufei.setZhuhuId(zhuhuId);
		shoufei.setDel("no");
	    shoufeiDAO.save(shoufei);
		this.setMessage("保存成功!");
		this.setPath("shoufeiMana.action");
		return "succeed";
	}
	
	public String userShoufeiMana()
	{
		//isnotice=1表示已通知
		TZhuhu zhuhuTmp = (TZhuhu) ServletActionContext.getRequest().getSession().getAttribute("zhuhu"); 
		zhuhuId = zhuhuTmp.getZhuhuId();
		String sql="from TShoufei where del='no' and isnotice=1 and zhuhu_id=" + zhuhuId;
		List shoufeiList=shoufeiDAO.getHibernateTemplate().find(sql);
		for(int i=0;i<shoufeiList.size();i++)
		{
			TShoufei shoufei=(TShoufei)shoufeiList.get(i);
			shoufei.setZhuhuName(zhuhuDAO.findById(shoufei.getZhuhuId()).getZhuhuName());
		}
		Map request=(Map)ServletActionContext.getContext().get("request");
		request.put("shoufeiList", shoufeiList);
		return ActionSupport.SUCCESS;
	}
	
	public String shoufeiMana()
	{
		String sql="from TShoufei where del='no'";
		List shoufeiList=shoufeiDAO.getHibernateTemplate().find(sql);
		for(int i=0;i<shoufeiList.size();i++)
		{
			TShoufei shoufei=(TShoufei)shoufeiList.get(i);
			//设置哪个用户收费要从zhuhuDao里找，通过shoufei里的zhuhuId关联起来保持一致
			shoufei.setZhuhuName(zhuhuDAO.findById(shoufei.getZhuhuId()).getZhuhuName());
		}
		Map request=(Map)ServletActionContext.getContext().get("request");
		request.put("shoufeiList", shoufeiList);
		return ActionSupport.SUCCESS;
	}

	public String shoufeiDel()
	{
		TShoufei shoufei=shoufeiDAO.findById(shoufeiId);
		shoufei.setDel("yes");
		shoufeiDAO.attachDirty(shoufei);
		this.setMessage("删除成功!");
		this.setPath("shoufeiMana.action");
		return "succeed";
	}

	public String userShoufeiEditPre()
	{
		TShoufei shoufei=shoufeiDAO.findById(shoufeiId);
		Map request=(Map)ServletActionContext.getContext().get("request");
		request.put("shoufei", shoufei);
		return ActionSupport.SUCCESS;
	}
	
	public String shoufeiEdit()
	{
		TShoufei shoufei=shoufeiDAO.findById(shoufeiId);
		shoufei.setShoufeiShijian(shoufeiShijian);
		shoufei.setShoufeiXiangmu(shoufeiXiangmu);
		shoufei.setShoufeiJine(shoufeiJine);
		shoufei.setYijiaojine(yijiaojine);
		shoufei.setDel("no");
		shoufeiDAO.attachDirty(shoufei);
		this.setMessage("缴费成功!");
		this.setPath("userShoufeiMana.action");
		return "succeed";
	}
	
	public String shoufeiNotice()
	{
		TShoufei shoufei=shoufeiDAO.findById(shoufeiId);
		//置为已通知状态
		shoufei.setIsnotice(1);
		
		shoufeiDAO.attachDirty(shoufei);
		this.setMessage("通知成功!");
		this.setPath("shoufeiMana.action");
		return "succeed";
	}
	

	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	public String getMessage()
	{
		return message;
	}
	public void setMessage(String message)
	{
		this.message = message;
	}
	public String getPath()
	{
		return path;
	}
	public void setPath(String path)
	{
		this.path = path;
	}


	public String getShoufeiJine()
	{
		return shoufeiJine;
	}


	public void setShoufeiJine(String shoufeiJine)
	{
		this.shoufeiJine = shoufeiJine;
	}


	public TShoufeiDAO getShoufeiDAO()
	{
		return shoufeiDAO;
	}


	public void setShoufeiDAO(TShoufeiDAO shoufeiDAO)
	{
		this.shoufeiDAO = shoufeiDAO;
	}


	public int getShoufeiId()
	{
		return shoufeiId;
	}


	public void setShoufeiId(int shoufeiId)
	{
		this.shoufeiId = shoufeiId;
	}


	public String getShoufeiShijian()
	{
		return shoufeiShijian;
	}


	public void setShoufeiShijian(String shoufeiShijian)
	{
		this.shoufeiShijian = shoufeiShijian;
	}


	public String getShoufeiXiangmu()
	{
		return shoufeiXiangmu;
	}


	public void setShoufeiXiangmu(String shoufeiXiangmu)
	{
		this.shoufeiXiangmu = shoufeiXiangmu;
	}


	public TZhuhuDAO getZhuhuDAO()
	{
		return zhuhuDAO;
	}


	public void setZhuhuDAO(TZhuhuDAO zhuhuDAO)
	{
		this.zhuhuDAO = zhuhuDAO;
	}


	public int getZhuhuId()
	{
		return zhuhuId;
	}


	public void setZhuhuId(int zhuhuId)
	{
		this.zhuhuId = zhuhuId;
	}


	public String getYijiaojine() {
		return yijiaojine;
	}


	public void setYijiaojine(String yijiaojine) {
		this.yijiaojine = yijiaojine;
	}	
}
