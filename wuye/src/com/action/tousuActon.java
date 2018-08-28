package com.action;

import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;

import com.dao.TTousuDAO;
import com.dao.TZhuhuDAO;
import com.model.TTousu;
import com.model.TZhuhu;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class tousuActon extends ActionSupport
{
	private int tousuId;
	private int zhuhuId;
	private String tousuYuanyin;
	private String message;
	private String path;	
	private TTousuDAO tousuDAO;
	private TZhuhuDAO zhuhuDAO;
	
	public String tousuAdd()
	{
		TTousu tousu=new TTousu();
		//根据本地时间把Date对象转换为字符串
		tousu.setTousuShijian(new Date().toLocaleString());
		tousu.setTousuYuanyin(tousuYuanyin);
		Map session=ActionContext.getContext().getSession();
		if(session.get("zhuhu")!=null)
		{
			TZhuhu zhuhu=(TZhuhu)session.get("zhuhu");
			tousu.setZhuhuId(zhuhu.getZhuhuId());
		}
		tousu.setTousuZhuangtai("weishouli");
		tousu.setDel("no");
		tousuDAO.save(tousu);
		this.setMessage("保存成功!");
		this.setPath("tousuMy.action");
		return "succeed";
	}
	
	public String tousuMy()
	{
		//Action(struts)中获得Session的map的固定方法
		Map session=ActionContext.getContext().getSession();
		//通过map.get方法获得zhuhu键的值以便在下面hql查找使用zhuhu的id
		TZhuhu zhuhu=(TZhuhu)session.get("zhuhu");
		
		String sql="from TTousu where del='no' and zhuhuId="+zhuhu.getZhuhuId();
		List tousuList=tousuDAO.getHibernateTemplate().find(sql);
		
		Map request=(Map)ServletActionContext.getContext().get("request");
		request.put("tousuList", tousuList);
		return ActionSupport.SUCCESS;
	}
	
	public String tousuMana()
	{
		String sql="from TTousu where del='no' order by tousuId desc";
		List tousuList=tousuDAO.getHibernateTemplate().find(sql);
		for(int i=0;i<tousuList.size();i++)
		{
			TTousu tousu=(TTousu)tousuList.get(i);
			tousu.setZhuhuName(zhuhuDAO.findById(tousu.getZhuhuId()).getZhuhuName());
		}
		Map request=(Map)ServletActionContext.getContext().get("request");
		request.put("tousuList", tousuList);
		return ActionSupport.SUCCESS;
	}
	
	public void tousuWaitDealCount()
	{
		String sql="from TTousu where del='no' and tousuZhuangtai='weishouli'";
		List tousuList=tousuDAO.getHibernateTemplate().find(sql);
		//ServletActionContext.getContext().get(args)返回的是args键所对应的值
		Map request=(Map)ServletActionContext.getContext().get("request");
		
		HttpServletResponse response = ServletActionContext.getResponse();
        response.setContentType("text/html;charset=utf-8");
        try {
            response.getWriter().print("{tousuWaitDealCount:"+tousuList.size()+"}");
            response.getWriter().close();
        } catch (Exception e) {
        	
        }
	}
	
	public String tousuDel()
	{
		TTousu tousu=tousuDAO.findById(tousuId);
		tousu.setDel("yes");
		tousuDAO.attachDirty(tousu);
		this.setMessage("删除成功!");
		this.setPath("tousuMana.action");
		return "succeed";
	}
	
	public String tousuShouli()
	{
		TTousu tousu=tousuDAO.findById(tousuId);
		
		tousu.setTousuZhuangtai("yishouli");
		tousuDAO.attachDirty(tousu);
		this.setMessage("受理成功!");
		this.setPath("tousuMana.action");
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
	public TTousuDAO getTousuDAO()
	{
		return tousuDAO;
	}
	public void setTousuDAO(TTousuDAO tousuDAO)
	{
		this.tousuDAO = tousuDAO;
	}
	public int getTousuId()
	{
		return tousuId;
	}
	public void setTousuId(int tousuId)
	{
		this.tousuId = tousuId;
	}
	public String getTousuYuanyin()
	{
		return tousuYuanyin;
	}
	public void setTousuYuanyin(String tousuYuanyin)
	{
		this.tousuYuanyin = tousuYuanyin;
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
}
