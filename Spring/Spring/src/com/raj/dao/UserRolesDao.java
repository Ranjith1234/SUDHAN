package com.raj.dao;

import java.util.List;

import org.hibernate.Session;
import org.springframework.beans.factory.config.BeanDefinition;
import org.springframework.context.annotation.Scope;
import org.springframework.data.repository.PagingAndSortingRepository;
import org.springframework.stereotype.Repository;

import com.raj.entity.SystemUsers;
import com.raj.entity.UserRoles;

@Repository
@Scope(BeanDefinition.SCOPE_PROTOTYPE)
public class UserRolesDao extends AbstractHibernateDao<UserRoles> {

	public UserRolesDao() {
		setClazz(UserRoles.class);
	}

	@SuppressWarnings("unchecked")
	public List<UserRoles> getUserRolesByUserId(SystemUsers userId) {
		Session session = getCurrentSession();
		String hql = "FROM UserRoles WHERE userId = :userId";
		return session.createQuery(hql).setParameter("userId", userId).list();
	}

	@Override
	protected PagingAndSortingRepository<UserRoles, Long> getDao() {
		// TODO Auto-generated method stub
		return null;
	}
}
