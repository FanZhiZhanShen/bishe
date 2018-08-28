package com.action;

import java.util.List;
import java.util.Map;

import org.apache.struts2.ServletActionContext;

import com.dao.TZhuhuDAO;
import com.model.TZhuhu;
import com.opensymphony.xwork2.ActionSupport;

public class zhuhuAction extends ActionSupport
{
	private int zhuhuId;
	private String zhuhuName;
	private String zhuhuIdcard;
	private String zhuhuTel;
	private String zhuhuFangxing;
	private String zhuhuMianji;
	private String zhuhuShiyongmianj;
	private String zhuhuRuzhushijian;
	private String zhuhuCheliangxinxi;
	private String userName;
	private String userPw;
	private String del;
	private String fangwuno;
	private String message;
	private String path;
	private TZhuhuDAO zhuhuDAO;
	
	public String zhuhuAdd()
	{
		TZhuhu zhuhu=new TZhuhu();
		zhuhu.setZhuhuName(zhuhuName);
		zhuhu.setZhuhuName(zhuhuName);         
		zhuhu.setZhuhuIdcard(zhuhuIdcard);       
		zhuhu.setZhuhuTel(zhuhuTel);          
		zhuhu.setZhuhuFangxing(zhuhuFangxing);     
		zhuhu.setZhuhuMianji(zhuhuMianji);       
		zhuhu.setZhuhuShiyongmianj(zhuhuShiyongmianj); 
		zhuhu.setZhuhuRuzhushijian(zhuhuRuzhushijian); 
		zhuhu.setZhuhuCheliangxinxi(zhuhuCheliangxinxi);
		zhuhu.setUserName(userName);          
		zhuhu.setUserPw(userPw);            
		zhuhu.setFangwuno(fangwuno);            
		zhuhu.setDel("no");
		zhuhuDAO.save(zhuhu);
		this.setMessage("保存成功!");
		this.setPath("zhuhuMana.action");
		return "succeed";
		//通过struts里的succeed的全球配置跳转到common/succeed.jsp，然后决定有没有message跳转，和path跳转
	}
	
	public String zhuhuMana()
	{
		String sql="from TZhuhu where del !='yes'";
		//在数据库中找到zhuhu
		List zhuhuList=zhuhuDAO.getHibernateTemplate().find(sql);
		//在Action(Struts)获取request的固定方法，并实例化
		Map request=(Map)ServletActionContext.getContext().get("request");
		//把zhuhu给request，以便jsp页面迭代使用
		request.put("zhuhuList", zhuhuList);
		return ActionSupport.SUCCESS;
	}
	
	public String zhuhuDel()
	{
		
		TZhuhu zhuhu=zhuhuDAO.findById(zhuhuId);
		zhuhu.setDel("yes");
		zhuhuDAO.attachDirty(zhuhu);
		this.setMessage("删除成功!");
		this.setPath("zhuhuMana.action");
		return "succeed";
	}
	
	public String zhuhuSearch()
	{
		//trim()方法不仅保证了严谨性，还实现了一个类似”刷新“的功能：什么都不输入直接点查询就等于zhuhuName like %,也就是搜索全部，产生了刷新的假象
		String sql="from TZhuhu where del !='yes' and zhuhuName like '%"+zhuhuName.trim()+"%'";
		List zhuhuList=zhuhuDAO.getHibernateTemplate().find(sql);
		Map request=(Map)ServletActionContext.getContext().get("request");
		request.put("zhuhuList", zhuhuList);
		return ActionSupport.SUCCESS;
	}
	
	public String zhuhuEditPre()
	{
		
		TZhuhu zhuhu=zhuhuDAO.findById(zhuhuId);
		Map request=(Map)ServletActionContext.getContext().get("request");
		request.put("zhuhu", zhuhu);
		return ActionSupport.SUCCESS;
	}
	
	public String zhuhuInfo()
	{
		TZhuhu zhuhuTmp = (TZhuhu) ServletActionContext.getRequest().getSession().getAttribute("zhuhu"); 
		zhuhuId = zhuhuTmp.getZhuhuId();
		TZhuhu zhuhu=zhuhuDAO.findById(zhuhuId);
		Map request=(Map)ServletActionContext.getContext().get("request");
		request.put("zhuhu", zhuhu);
		return ActionSupport.SUCCESS;
	}
	
	public String zhuhuEdit()
	{
		TZhuhu zhuhu=zhuhuDAO.findById(zhuhuId);
		zhuhu.setZhuhuName(zhuhuName);
		zhuhu.setZhuhuName(zhuhuName);         
		zhuhu.setZhuhuIdcard(zhuhuIdcard);       
		zhuhu.setZhuhuTel(zhuhuTel);          
		zhuhu.setZhuhuFangxing(zhuhuFangxing);     
		zhuhu.setZhuhuMianji(zhuhuMianji);       
		zhuhu.setZhuhuShiyongmianj(zhuhuShiyongmianj); 
		zhuhu.setZhuhuRuzhushijian(zhuhuRuzhushijian); 
		zhuhu.setZhuhuCheliangxinxi(zhuhuCheliangxinxi);
		zhuhu.setUserName(userName);          
		zhuhu.setUserPw(userPw); 
		zhuhu.setDel("no");
		zhuhu.setFangwuno(fangwuno);
		zhuhuDAO.attachDirty(zhuhu);
		this.setMessage("保存成功!");
		this.setPath("zhuhuMana.action");
		return "succeed";
	}

	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	public int getZhuhuId() {
		return zhuhuId;
	}

	public void setZhuhuId(int zhuhuId) {
		this.zhuhuId = zhuhuId;
	}

	public String getZhuhuName() {
		return zhuhuName;
	}

	public void setZhuhuName(String zhuhuName) {
		this.zhuhuName = zhuhuName;
	}

	public String getZhuhuIdcard() {
		return zhuhuIdcard;
	}

	public void setZhuhuIdcard(String zhuhuIdcard) {
		this.zhuhuIdcard = zhuhuIdcard;
	}

	public String getZhuhuTel() {
		return zhuhuTel;
	}

	public void setZhuhuTel(String zhuhuTel) {
		this.zhuhuTel = zhuhuTel;
	}

	public String getZhuhuFangxing() {
		return zhuhuFangxing;
	}

	public void setZhuhuFangxing(String zhuhuFangxing) {
		this.zhuhuFangxing = zhuhuFangxing;
	}

	public String getZhuhuMianji() {
		return zhuhuMianji;
	}

	public void setZhuhuMianji(String zhuhuMianji) {
		this.zhuhuMianji = zhuhuMianji;
	}

	public String getZhuhuShiyongmianj() {
		return zhuhuShiyongmianj;
	}

	public void setZhuhuShiyongmianj(String zhuhuShiyongmianj) {
		this.zhuhuShiyongmianj = zhuhuShiyongmianj;
	}

	public String getZhuhuRuzhushijian() {
		return zhuhuRuzhushijian;
	}

	public void setZhuhuRuzhushijian(String zhuhuRuzhushijian) {
		this.zhuhuRuzhushijian = zhuhuRuzhushijian;
	}

	public String getZhuhuCheliangxinxi() {
		return zhuhuCheliangxinxi;
	}

	public void setZhuhuCheliangxinxi(String zhuhuCheliangxinxi) {
		this.zhuhuCheliangxinxi = zhuhuCheliangxinxi;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getUserPw() {
		return userPw;
	}

	public void setUserPw(String userPw) {
		this.userPw = userPw;
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

	public TZhuhuDAO getZhuhuDAO() {
		return zhuhuDAO;
	}

	public void setZhuhuDAO(TZhuhuDAO zhuhuDAO) {
		this.zhuhuDAO = zhuhuDAO;
	}

	public String getFangwuno() {
		return fangwuno;
	}

	public void setFangwuno(String fangwuno) {
		this.fangwuno = fangwuno;
	}
}
