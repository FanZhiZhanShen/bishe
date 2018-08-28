package com.action;

import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;

import com.dao.TBaoxiuDAO;
import com.dao.TZhuhuDAO;
import com.model.TBaoxiu;
import com.model.TZhuhu;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class baoxiuActon extends ActionSupport
{
	private int baoxiuId;
	private int zhuhuId;
	private String baoxiuShijian;
	private String baoxiuBeizhu;
	private String message;
	private String path;
	private TBaoxiuDAO baoxiuDAO;
	private TZhuhuDAO zhuhuDAO;
	
	public String baoxiuAdd()
	{
		TBaoxiu baoxiu=new TBaoxiu();
		baoxiu.setBaoxiuBeizhu(baoxiuBeizhu);
		baoxiu.setBaoxiuShijian(new Date().toLocaleString());
		
		Map session=ActionContext.getContext().getSession();
		if(session.get("zhuhu")!=null)
		{
			TZhuhu zhuhu=(TZhuhu)session.get("zhuhu");
			baoxiu.setZhuhuId(zhuhu.getZhuhuId());
		}
		baoxiu.setBaoxiuZhuangtai("weishouli");
		baoxiu.setDel("no");
		baoxiuDAO.save(baoxiu);
		this.setMessage("保存成功!");
		this.setPath("baoxiuMy.action");
		return "succeed";
	}	
	
	public String baoxiuMy()
	{
		Map session=ActionContext.getContext().getSession();
		TZhuhu zhuhu=(TZhuhu)session.get("zhuhu");
		
		String sql="from TBaoxiu where del='no' and zhuhuId="+zhuhu.getZhuhuId();
		List baoxiuList=baoxiuDAO.getHibernateTemplate().find(sql);
		Map request=(Map)ServletActionContext.getContext().get("request");
		request.put("baoxiuList", baoxiuList);
		return ActionSupport.SUCCESS;
	}
	
	public String baoxiuMana()
	{
		String sql="from TBaoxiu where del='no' order by baoxiuId desc";
		List baoxiuList=baoxiuDAO.getHibernateTemplate().find(sql);
		for(int i=0;i<baoxiuList.size();i++)
		{
			TBaoxiu baoxiu=(TBaoxiu)baoxiuList.get(i);
			baoxiu.setZhuhuName(zhuhuDAO.findById(baoxiu.getZhuhuId()).getZhuhuName());
		}
		Map request=(Map)ServletActionContext.getContext().get("request");
		request.put("baoxiuList", baoxiuList);
		return ActionSupport.SUCCESS;
	}
	
	public void baoxiuWaitDealCount()
	{
		String sql="from TBaoxiu where del='no' and baoxiuZhuangtai='weishouli'";
		List baoxiuList=baoxiuDAO.getHibernateTemplate().find(sql);
		HttpServletResponse response = ServletActionContext.getResponse();
        response.setContentType("text/html;charset=utf-8");
        try {
            response.getWriter().print("{baoxiuWaitDealCount:"+baoxiuList.size()+"}");
            response.getWriter().close();
        } catch (Exception e) {
        	
        }
	}
	
	public String baoxiuDel()
	{
		TBaoxiu baoxiu=baoxiuDAO.findById(baoxiuId);
		baoxiu.setDel("yes");
		baoxiuDAO.attachDirty(baoxiu);
		this.setMessage("删除成功!");
		this.setPath("baoxiuMana.action");
		return "succeed";
	}
	
	public String baoxiuShouli()
	{
		TBaoxiu baoxiu=baoxiuDAO.findById(baoxiuId);
		baoxiu.setBaoxiuZhuangtai("yishouli");
		baoxiuDAO.attachDirty(baoxiu);
		this.setMessage("受理成功!");
		this.setPath("baoxiuMana.action");
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


	public String getBaoxiuBeizhu()
	{
		return baoxiuBeizhu;
	}


	public void setBaoxiuBeizhu(String baoxiuBeizhu)
	{
		this.baoxiuBeizhu = baoxiuBeizhu;
	}


	public TBaoxiuDAO getBaoxiuDAO()
	{
		return baoxiuDAO;
	}


	public void setBaoxiuDAO(TBaoxiuDAO baoxiuDAO)
	{
		this.baoxiuDAO = baoxiuDAO;
	}


	public int getBaoxiuId()
	{
		return baoxiuId;
	}


	public void setBaoxiuId(int baoxiuId)
	{
		this.baoxiuId = baoxiuId;
	}


	public String getBaoxiuShijian()
	{
		return baoxiuShijian;
	}


	public void setBaoxiuShijian(String baoxiuShijian)
	{
		this.baoxiuShijian = baoxiuShijian;
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
