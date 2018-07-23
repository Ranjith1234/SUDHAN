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

import com.raj.entity.Role;

/**
 *
 * @author rajkumar.s
 */
@Repository
@Scope(BeanDefinition.SCOPE_PROTOTYPE)
public class RoleDao extends AbstractHibernateDao<Role> {

	public RoleDao() {
		setClazz(Role.class);
	}

	public Role getRoleByName(String roleName) {
		Session session = getCurrentSession();
		Criteria criteria = session.createCriteria(Role.class);
		criteria.add(Restrictions.eq("roleName", roleName));
		return (Role) criteria.uniqueResult();
	}

	@Override
	protected PagingAndSortingRepository<Role, Long> getDao() {
		// TODO Auto-generated method stub
		return null;
	}

}
