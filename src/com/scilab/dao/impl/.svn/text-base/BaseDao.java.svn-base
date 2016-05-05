package com.scilab.dao.impl;

import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.exception.DataException;

import com.scilab.dao.IBaseDao;
import com.scilab.hibernate.HibernateSessionFactory;

public class BaseDao implements IBaseDao {

	public List getAllItems(String query) throws DataException {
		Session session = null;
		List list = null;
		try {
			session = HibernateSessionFactory.getSession();
			list = session.createQuery(query).list();

		} catch (HibernateException e) {
			e.printStackTrace();
		} finally {
			HibernateSessionFactory.closeSession();
		}
		return list;
	}
	public Object findById(Class claxx, long id) {
		Session session = null;
		Object obj = null;
		try {
			session = HibernateSessionFactory.getSession();
			obj = session.get(claxx, id);
		} catch (HibernateException e) {
			e.printStackTrace();
		} finally {
			HibernateSessionFactory.closeSession();
		}
		return obj;
	}

	public boolean deleObj(Object obj) {
		Session session = null;
		Transaction tx = null;
		boolean b = true;
		try {
			session = HibernateSessionFactory.getSession();
			tx = session.beginTransaction();
			session.delete(obj);
			tx.commit();
		} catch (HibernateException e) {
			if (tx != null)
				tx.rollback();
			b = false;
			e.printStackTrace();
		} finally {
			HibernateSessionFactory.closeSession();
		}
		return b;
	}

	public boolean saveObj(Object obj) {
		Session session = null;
		Transaction tx = null;
		boolean b = true;
		try {
			session = HibernateSessionFactory.getSession();
			tx = session.beginTransaction();
			session.save(obj);
			tx.commit();
		} catch (HibernateException e) {
			if (tx != null)
				tx.rollback();
			b = false;
			e.printStackTrace();
		} finally {
			HibernateSessionFactory.closeSession();
		}
		return b;
	}

	public boolean saveOrUpdateObj(Object obj) {
		Session session = null;
		Transaction tx = null;
		boolean b = true;
		try {
			session = HibernateSessionFactory.getSession();
			tx = session.beginTransaction();
			session.saveOrUpdate(obj);
			tx.commit();
		} catch (HibernateException e) {
			if (tx != null)
				tx.rollback();
			b = false;
			e.printStackTrace();
		} finally {
			HibernateSessionFactory.closeSession();
		}
		return b;
	}

	public boolean updateObj(Object obj) {
		Session session = null;
		Transaction tx = null;
		boolean b = true;
		try {
			session = HibernateSessionFactory.getSession();
			tx = session.beginTransaction();
			session.update(obj);
			tx.commit();
		} catch (HibernateException e) {
			if (tx != null)
				tx.rollback();
			b = false;
			e.printStackTrace();
		} finally {
			HibernateSessionFactory.closeSession();
		}
		return b;
	}
	public List findByHql(String hql, Object[] obj) {
		Session session = null;
		Transaction tx = null;
		List list = null;
		try {
			session = HibernateSessionFactory.getSession();
			tx = session.beginTransaction();
			Query query = session.createQuery(hql);
			if(obj!=null){
				for(int i=0; i<obj.length; i++){
					query.setParameter(i, obj[i]);
				}
			}
			list = query.list();
			tx.commit();
		} catch (HibernateException e) {
			if (tx != null)
				tx.rollback();
			e.printStackTrace();
		} finally {
			HibernateSessionFactory.closeSession();
		}
		return list;
	}

}
