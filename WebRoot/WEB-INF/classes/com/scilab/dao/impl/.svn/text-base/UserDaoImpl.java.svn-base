package com.scilab.dao.impl;

import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Session;

import com.scilab.dao.UserDao;
import com.scilab.hibernate.HibernateSessionFactory;
import com.scilab.pojo.UserInfo;

public class UserDaoImpl extends BaseDao implements UserDao{

	public UserInfo getUserInfo(long id) {
		return (UserInfo)this.findById(UserInfo.class, id);
	}

	public boolean saveUser(UserInfo uinfo) {
		return this.saveObj(uinfo);
	}

	
	public UserInfo login(String userName, String password) {
		Session session = null;
		UserInfo user = null;
		try{
			session = HibernateSessionFactory.getSession();
			user = (UserInfo)session.createQuery("from UserInfo u where u.userName=:userName and u.password=:password").setString("userName", userName).setString("password", password).uniqueResult();
		}catch(HibernateException e){
			e.printStackTrace();
		}finally{
			HibernateSessionFactory.closeSession();
		}
		return user;
	}
	
	public boolean userNameisExist(String userName){
		String hql = "from UserInfo where userName=?";
		List list = this.findByHql(hql, new Object[]{userName});
		if(list.size()==0){
			return false;
		}
		return true;
	}
	
}
