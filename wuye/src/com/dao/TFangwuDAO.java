package com.dao;

import java.util.List;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.hibernate.LockMode;
import org.springframework.context.ApplicationContext;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.model.TFangwu;
import com.model.TFangwu;

public class TFangwuDAO extends HibernateDaoSupport
{
	private static final Log log = LogFactory.getLog(TFangwuDAO.class);

	protected void initDao()
	{
		
	}

	public void save(TFangwu transientInstance)
	{
		log.debug("saving TFangwu instance");
		try
		{
			getHibernateTemplate().save(transientInstance);
			log.debug("save successful");
		} catch (RuntimeException re)
		{
			log.error("save failed", re);
			throw re;
		}
	}

	public void delete(TFangwu persistentInstance)
	{
		log.debug("deleting TFangwu instance");
		try
		{
			getHibernateTemplate().delete(persistentInstance);
			log.debug("delete successful");
		} catch (RuntimeException re)
		{
			log.error("delete failed", re);
			throw re;
		}
	}

	public TFangwu findById(java.lang.Integer id)
	{
		log.debug("getting TFangwu instance with id: " + id);
		try
		{
			TFangwu instance = (TFangwu) getHibernateTemplate().get(
					"com.model.TFangwu", id);
			return instance;
		} catch (RuntimeException re)
		{
			log.error("get failed", re);
			throw re;
		}
	}

	public List findByExample(TFangwu instance)
	{
		log.debug("finding TFangwu instance by example");
		try
		{
			List results = getHibernateTemplate().findByExample(instance);
			log.debug("find by example successful, result size: "
					+ results.size());
			return results;
		} catch (RuntimeException re)
		{
			log.error("find by example failed", re);
			throw re;
		}
	}

	public List findByProperty(String propertyName, Object value)
	{
		log.debug("finding TFangwu instance with property: " + propertyName
				+ ", value: " + value);
		try
		{
			String queryString = "from TFangwu as model where model."
					+ propertyName + "= ?";
			return getHibernateTemplate().find(queryString, value);
		} catch (RuntimeException re)
		{
			log.error("find by property name failed", re);
			throw re;
		}
	}

	public List findAll()
	{
		log.debug("finding all TFangwu instances");
		try
		{
			String queryString = "from TFangwu";
			return getHibernateTemplate().find(queryString);
		} catch (RuntimeException re)
		{
			log.error("find all failed", re);
			throw re;
		}
	}

	public TFangwu merge(TFangwu detachedInstance)
	{
		log.debug("merging TFangwu instance");
		try
		{
			TFangwu result = (TFangwu) getHibernateTemplate().merge(
					detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re)
		{
			log.error("merge failed", re);
			throw re;
		}
	}

	public void attachDirty(TFangwu instance)
	{
		log.debug("attaching dirty TFangwu instance");
		try
		{
			getHibernateTemplate().saveOrUpdate(instance);
			log.debug("attach successful");
		} catch (RuntimeException re)
		{
			log.error("attach failed", re);
			throw re;
		}
	}

	public void attachClean(TFangwu instance)
	{
		log.debug("attaching clean TFangwu instance");
		try
		{
			getHibernateTemplate().lock(instance, LockMode.NONE);
			log.debug("attach successful");
		} catch (RuntimeException re)
		{
			log.error("attach failed", re);
			throw re;
		}
	}


}