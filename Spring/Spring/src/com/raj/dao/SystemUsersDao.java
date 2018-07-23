/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.raj.dao;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.config.BeanDefinition;
import org.springframework.context.annotation.Scope;
import org.springframework.data.repository.PagingAndSortingRepository;
import org.springframework.stereotype.Repository;

import com.raj.entity.SystemUsers;

/**
 *
 * @author rajkumar.s
 */
@Repository
@Scope(BeanDefinition.SCOPE_PROTOTYPE)
public class SystemUsersDao extends AbstractHibernateDao<SystemUsers> {

	public SystemUsersDao() {
		setClazz(SystemUsers.class);
	}

	public SystemUsers createUser(SystemUsers user) {
		create(user);
		flush();
		return user;
	}

	public SystemUsers getUserByName(String username) {
		Session session = getCurrentSession();
		Criteria criteria = session.createCriteria(SystemUsers.class);
		criteria.add(Restrictions.eq("userName", username));
		return (SystemUsers) criteria.uniqueResult();
	}

	@Override
	protected PagingAndSortingRepository<SystemUsers, Long> getDao() {
		// TODO Auto-generated method stub
		return null;
	}

}
