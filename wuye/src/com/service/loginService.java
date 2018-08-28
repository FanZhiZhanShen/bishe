package com.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.directwebremoting.WebContext;
import org.directwebremoting.WebContextFactory;

import com.dao.TAdminDAO;
import com.dao.TFangwuDAO;
import com.dao.TZhuhuDAO;
import com.model.TAdmin;
import com.model.TZhuhu;

public class loginService
{
	private TAdminDAO adminDAO;
	private TZhuhuDAO zhuhuDAO;
	private TFangwuDAO fangwuDAO;
	
	public TZhuhuDAO getZhuhuDAO()
	{
		return zhuhuDAO;
	}
	public void setZhuhuDAO(TZhuhuDAO zhuhuDAO)
	{
		this.zhuhuDAO = zhuhuDAO;
	}
	public TAdminDAO getAdminDAO()
	{
		return adminDAO;
	}
	public void setAdminDAO(TAdminDAO adminDAO)
	{
		this.adminDAO = adminDAO;
	}
	
	public TFangwuDAO getFangwuDAO() {
		return fangwuDAO;
	}
	public void setFangwuDAO(TFangwuDAO fangwuDAO) {
		this.fangwuDAO = fangwuDAO;
	}
	public String login(String userName,String userPw,int userType, String userCheckCode)
	{
		//dwr框架中获取session的方法
		WebContext ctx = WebContextFactory.get(); 
		HttpSession session=ctx.getSession(); 
		
		String result="no";
		String checkCode = session.getAttribute("vcode") + "";
		if(!userCheckCode.equals(checkCode)) {
			result="checkcodeerror";
		} else {
			try
			{
				if(userType==0)//管理员登录
				{
					String sql="from TAdmin where userName=? and userPw=?";
					Object[] con={userName,userPw};
					List adminList=adminDAO.getHibernateTemplate().find(sql,con);
					if(adminList.size()==0)
					{
						result="no";
					}
					else
					{
						TAdmin admin=(TAdmin)adminList.get(0);
						session.setAttribute("userType", 0);
						session.setAttribute("admin", admin);
						result="yes";
					}
				}
				if(userType==1)//住户登录
				{
					String sql="from TZhuhu where userName=? and userPw=? and del='no'";
					Object[] con={userName,userPw};
					List zhuhuList=zhuhuDAO.getHibernateTemplate().find(sql,con);
					if(zhuhuList.size()==0)
					{
						result="no";
					}
					else
					{
						TZhuhu zhuhu=(TZhuhu)zhuhuList.get(0);
						session.setAttribute("userType", 1);
						session.setAttribute("zhuhu", zhuhu);
						result="yes";
					}
				}
			} catch (Exception e)
			{
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return result;
	}

    public String zhuhuPwEdit(String userPwNew)
    {
		WebContext ctx = WebContextFactory.get(); 
		HttpSession session=ctx.getSession(); 
		 
		TZhuhu zhuhu=(TZhuhu)session.getAttribute("zhuhu");
		zhuhu.setUserPw(userPwNew);
		
		adminDAO.getHibernateTemplate().update(zhuhu);
		session.setAttribute("zhuhu", zhuhu);
		
		return "yes";
    }

    public List zhuhuSelect()
    {
    	String sql="from TZhuhu where del='no'";
		List zhuhuList=zhuhuDAO.getHibernateTemplate().find(sql);
		return zhuhuList;
    }
    public List fangwuSelect()
    {
    	String sql="from TFangwu where del='no'";
    	List fangwuList=fangwuDAO.getHibernateTemplate().find(sql);
    	return fangwuList;
    }
    
}
