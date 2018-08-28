package com.dao;

import java.util.List;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.hibernate.LockMode;
import org.springframework.context.ApplicationContext;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.model.TTingchechang;

public class TTingchechangDAO extends HibernateDaoSupport
{
	private static final Log log = LogFactory.getLog(TTingchechangDAO.class);

	protected void initDao()
	{
		
	}

	public void save(TTingchechang transientInstance)
	{
		log.debug("saving TTingchechang instance");
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

	public void delete(TTingchechang persistentInstance)
	{
		log.debug("deleting TTingchechang instance");
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

	public TTingchechang findById(java.lang.Integer id)
	{
		log.debug("getting TTingchechang instance with id: " + id);
		try
		{
			TTingchechang instance = (TTingchechang) getHibernateTemplate().get(
					"com.model.TTingchechang", id);
			return instance;
		} catch (RuntimeException re)
		{
			log.error("get failed", re);
			throw re;
		}
	}

	public List findByExample(TTingchechang instance)
	{
		log.debug("finding TTingchechang instance by example");
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
		log.debug("finding TTingchechang instance with property: " + propertyName
				+ ", value: " + value);
		try
		{
			String queryString = "from TTingchechang as model where model."
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
		log.debug("finding all TTingchechang instances");
		try
		{
			String queryString = "from TTingchechang";
			return getHibernateTemplate().find(queryString);
		} catch (RuntimeException re)
		{
			log.error("find all failed", re);
			throw re;
		}
	}

	public TTingchechang merge(TTingchechang detachedInstance)
	{
		log.debug("merging TTingchechang instance");
		try
		{
			TTingchechang result = (TTingchechang) getHibernateTemplate().merge(
					detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re)
		{
			log.error("merge failed", re);
			throw re;
		}
	}

	public void attachDirty(TTingchechang instance)
	{
		log.debug("attaching dirty TTingchechang instance");
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

	public void attachClean(TTingchechang instance)
	{
		log.debug("attaching clean TTingchechang instance");
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