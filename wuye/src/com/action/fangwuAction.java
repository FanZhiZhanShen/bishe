package com.action;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;

import org.apache.struts2.ServletActionContext;

import com.dao.TFangwuDAO;
import com.model.TFangwu;
import com.opensymphony.xwork2.ActionSupport;

public class fangwuAction extends ActionSupport
{
	private int id;
	private String name;
	private String mianji;
	private String weizhi;
	private String fangxing;
	private String danjia;
	private String zongjia;
	private String zhuhu;
	private String zhuhuTel;
	private String del;
	private String message;
	private String path;
	private String fangwuno;
	private TFangwuDAO fangwuDAO;
	
	public String fangwuAdd()
	{
		TFangwu fangwu=new TFangwu();
		fangwu.setName(name);
		fangwu.setMianji(mianji);
		fangwu.setWeizhi(weizhi);
		fangwu.setFangxing(fangxing);
		fangwu.setDanjia(danjia);
		fangwu.setZongjia(zongjia);
		fangwu.setZhuhu(zhuhu);
		fangwu.setZhuhuTel(zhuhuTel);
		fangwu.setFangwuno(fangwuno);
		fangwu.setDel("no");
		fangwuDAO.save(fangwu);
		this.setMessage("保存成功!");
		this.setPath("fangwuMana.action");
		return "succeed";
	}
	
	public String fangwuMana()
	{
		String sql="from TFangwu where del !='yes'";
		List fangwuList=fangwuDAO.getHibernateTemplate().find(sql);
		Map request=(Map)ServletActionContext.getContext().get("request");
		request.put("fangwuList", fangwuList);
		return ActionSupport.SUCCESS;
	}
	
	public String fangwuDel()
	{
		
		TFangwu fangwu=fangwuDAO.findById(id);
		fangwu.setDel("yes");
		fangwuDAO.attachDirty(fangwu);
		this.setMessage("删除成功!");
		this.setPath("fangwuMana.action");
		return "succeed";
	}
	
	public String fangwuSearch()
	{
		String sql="from TFangwu where del !='yes' and name like '%"+name.trim()+"%'";
		List fangwuList=fangwuDAO.getHibernateTemplate().find(sql);
		Map request=(Map)ServletActionContext.getContext().get("request");
		request.put("fangwuList", fangwuList);
		return ActionSupport.SUCCESS;
	}
	
	public void fangwuQuery()
	{
		String sql="from TFangwu where del !='yes'";
		if(fangwuno != null) {
			sql = sql + " and fangwuno = '"+fangwuno+"'";
		}
		
		List fangwuList=fangwuDAO.getHibernateTemplate().find(sql);
		Map request=(Map)ServletActionContext.getContext().get("request");
		//request.put("fangwuList",fangwuList);
		HttpServletResponse response = ServletActionContext.getResponse();
		//防止乱码
        response.setContentType("text/html;charset=utf-8");
        try {
        	//将List转为JSON数据
        	JSONArray fangwuJson = JSONArray.fromObject(fangwuList);
        	//向前台输出这个数据
            response.getWriter().print(fangwuJson);
            response.getWriter().close();
        } catch (Exception e) {        	
        }
	}
	
	public String fangwuEditPre()
	{
		
		TFangwu fangwu=fangwuDAO.findById(id);
		Map request=(Map)ServletActionContext.getContext().get("request");
		request.put("fangwu", fangwu);
		return ActionSupport.SUCCESS;
	}
	
	public String fangwuEdit()
	{
		TFangwu fangwu=fangwuDAO.findById(id);
		fangwu.setName(name);
		fangwu.setMianji(mianji);
		fangwu.setWeizhi(weizhi);
		fangwu.setFangxing(fangxing);
		fangwu.setDanjia(danjia);
		fangwu.setZongjia(zongjia);
		fangwu.setZhuhu(zhuhu);
		fangwu.setZhuhuTel(zhuhuTel);
		fangwu.setFangwuno(fangwuno);
		fangwu.setDel("no");
		fangwuDAO.attachDirty(fangwu);
		this.setMessage("保存成功!");
		this.setPath("fangwuMana.action");
		return "succeed";
	}

	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	public int getId() {
		return id;
	}

	public void setId(int id) {
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

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

	

	public TFangwuDAO getFangwuDAO() {
		return fangwuDAO;
	}

	public void setFangwuDAO(TFangwuDAO fangwuDAO) {
		this.fangwuDAO = fangwuDAO;
	}

	public String getPath() {
		return path;
	}

	public void setPath(String path) {
		this.path = path;
	}

	public String getFangwuno() {
		return fangwuno;
	}

	public void setFangwuno(String fangwuno) {
		this.fangwuno = fangwuno;
	}
}
