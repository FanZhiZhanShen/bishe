package com.dao;

import java.util.List;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.hibernate.LockMode;
import org.springframework.context.ApplicationContext;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.model.TAdmin;

//HibernageDaoSupport提供了一个getHibernateTemplate方法，返回的是HibernateTemplate实例
//其实很多方法都跟HibernateTemplate中的方法一模一样，之所以重写的原因是：为了自己写日志，第二是具体化方法的名字
public class TAdminDAO extends HibernateDaoSupport {
	//final成员可以被继承，final类不能被继承，final方法可以被继承不能重写
	private static final Log log = LogFactory.getLog(TAdminDAO.class);

	public static final String USER_NAME = "userName";

	public static final String USER_PW = "userPw";

	protected void initDao() {
		
	}

	/*
	 * Hibernate的三种状态：transient，persistent，detached
	 * transient：临时状态：用new创建的对象，它没有持久化，没有处于Session中，处于此状态的对象叫临时对象；
	 * persistent：已经持久化，加入到了Session缓存中。如通过hibernate语句保存的对象。处于此状态的对象叫持久对象；
	 * detached：持久化对象脱离了Session的对象。如Session缓存被清空的对象。已经持久化，但不在Session缓存中。处于此状态的对象叫游离对象。
	 * */
	public void save(TAdmin transientInstance) {
		log.debug("saving TAdmin instance");
		try {
			getHibernateTemplate().save(transientInstance);
			log.debug("save successful");
		} catch (RuntimeException re) {
			log.error("save failed", re);
			throw re;
		}
	}

	public void delete(TAdmin persistentInstance) {
		log.debug("deleting TAdmin instance");
		try {
			getHibernateTemplate().delete(persistentInstance);
			log.debug("delete successful");
		} catch (RuntimeException re) {
			log.error("delete failed", re);
			throw re;
		}
	}

	public TAdmin findById(java.lang.Integer id) {
		log.debug("getting TAdmin instance with id: " + id);
		try {
			//根据id值查询
			TAdmin instance = (TAdmin) getHibernateTemplate().get(
					"com.model.TAdmin", id);
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}

	public List findByExample(TAdmin instance) {
		log.debug("finding TAdmin instance by example");
		try {
			List results = getHibernateTemplate().findByExample(instance);
			log.debug("find by example successful, result size: "
					+ results.size());
			return results;
		} catch (RuntimeException re) {
			log.error("find by example failed", re);
			throw re;
		}
	}

	public List findByProperty(String propertyName, Object value) {
		log.debug("finding TAdmin instance with property: " + propertyName
				+ ", value: " + value);
		try {
			//查询语句应是hql语句，查询全表就是from 表名
			String queryString = "from TAdmin as model where model."
					+ propertyName + "= ?";
			//value就是那个传入？的值
			return getHibernateTemplate().find(queryString, value);
		} catch (RuntimeException re) {
			log.error("find by property name failed", re);
			throw re;
		}
	}

	public List findByUserName(Object userName) {
		return findByProperty(USER_NAME, userName);
	}

	public List findByUserPw(Object userPw) {
		return findByProperty(USER_PW, userPw);
	}

	public List findAll() {
		log.debug("finding all TAdmin instances");
		try {
			String queryString = "from TAdmin";
			return getHibernateTemplate().find(queryString);
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}
	/*
	 * 	首先会查看TAdmin的id是否为空，
    	1.要是为空的话那就直接执行insert语句将TAdmin持久化，结束。
    	2.要是不为空，那么先执行select的语句查询t_admin表中id为这个t_admin.id的记录是否存在
              A:存在，那好执行update语句，结束。
              B:不存在，那么执行insert语句，结束。
     */
	public TAdmin merge(TAdmin detachedInstance) {
		log.debug("merging TAdmin instance");
		try {
			TAdmin result = (TAdmin) getHibernateTemplate().merge(
					detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public void attachDirty(TAdmin instance) {
		log.debug("attaching dirty TAdmin instance");
		try {
			getHibernateTemplate().saveOrUpdate(instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}
	
	//将传入的对象设置为transient态
	public void attachClean(TAdmin instance) {
		log.debug("attaching clean TAdmin instance");
		try {
			//获得在给定对象指定的锁定级别，隐式检查相应的数据库条目是否仍然存在。
			getHibernateTemplate().lock(instance, LockMode.NONE);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}


}