/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.raj.dao;

import java.io.Serializable;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.config.BeanDefinition;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Repository;

import com.raj.entity.Country;
import com.raj.entity.Module;
import com.raj.entity.RoleRights;
import com.raj.entity.State;

/**
 *
 * @author rajkumar.s
 */
@Repository
@SuppressWarnings("unchecked")
@Scope(BeanDefinition.SCOPE_PROTOTYPE)
public class CommonDao {

	@Autowired
	private SessionFactory sessionFactory;

	public CommonDao() {
		// empty constructor
	}

	public CommonDao(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	public List<Module> loadMenu() {
		Session session = sessionFactory.getCurrentSession();
		final String hql = "FROM Module WHERE parent is null ORDER BY moduleOrder";
		return session.createQuery(hql).list();
	}

	public List<Country> getCountries() {
		Session session = sessionFactory.getCurrentSession();
		final String hql = "FROM Country WHERE RecordStatus='Active' ORDER BY countryName";
		return session.createQuery(hql).list();
	}

	public List<State> getStates(Long cid) {
		Session session = sessionFactory.getCurrentSession();
		final String hql = "FROM State WHERE RecordStatus='Active' AND CID = :cid ORDER BY stateName";
		return session.createQuery(hql).setParameter("cid", cid).list();
	}

	public List<Module> getModules() {
		Session session = sessionFactory.getCurrentSession();
		final String hql = "FROM Module WHERE active=true ORDER BY moduleCode";
		return session.createQuery(hql).list();
	}

	public List<RoleRights> getAuthorizedRolesForModule(Long moduleCode) {
		Session session = sessionFactory.getCurrentSession();
		final String hql = "FROM RoleRights WHERE rr_modulecode = :moduleCode";
		return session.createQuery(hql).setParameter("moduleCode", moduleCode).list();
	}

	public Serializable insert(Object obj) {
		Session session = sessionFactory.getCurrentSession();
		return session.save(obj);
	}
}
