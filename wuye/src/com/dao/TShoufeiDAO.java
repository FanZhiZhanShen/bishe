package com.dao;

import java.util.List;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.hibernate.LockMode;
import org.springframework.context.ApplicationContext;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.model.TShoufei;

public class TShoufeiDAO extends HibernateDaoSupport
{
	private static final Log log = LogFactory.getLog(TShoufeiDAO.class);

	protected void initDao()
	{
		
	}

	public void save(TShoufei transientInstance)
	{
		log.debug("saving TShoufei instance");
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

	public void delete(TShoufei persistentInstance)
	{
		log.debug("deleting TShoufei instance");
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

	public TShoufei findById(java.lang.Integer id)
	{
		log.debug("getting TShoufei instance with id: " + id);
		try
		{
			TShoufei instance = (TShoufei) getHibernateTemplate().get(
					"com.model.TShoufei", id);
			return instance;
		} catch (RuntimeException re)
		{
			log.error("get failed", re);
			throw re;
		}
	}

	public List findByExample(TShoufei instance)
	{
		log.debug("finding TShoufei instance by example");
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
		log.debug("finding TShoufei instance with property: " + propertyName
				+ ", value: " + value);
		try
		{
			String queryString = "from TShoufei as model where model."
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
		log.debug("finding all TShoufei instances");
		try
		{
			String queryString = "from TShoufei";
			return getHibernateTemplate().find(queryString);
		} catch (RuntimeException re)
		{
			log.error("find all failed", re);
			throw re;
		}
	}

	public TShoufei merge(TShoufei detachedInstance)
	{
		log.debug("merging TShoufei instance");
		try
		{
			TShoufei result = (TShoufei) getHibernateTemplate().merge(
					detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re)
		{
			log.error("merge failed", re);
			throw re;
		}
	}

	public void attachDirty(TShoufei instance)
	{
		log.debug("attaching dirty TShoufei instance");
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

	public void attachClean(TShoufei instance)
	{
		log.debug("attaching clean TShoufei instance");
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