package com.raj.dao;

import java.io.Serializable;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.repository.PagingAndSortingRepository;

public abstract class AbstractHibernateDao<T extends Serializable> implements IGenericDao<T> {

	private Class<T> clazz;

	@Autowired
	private SessionFactory sessionFactory;

	public final void setClazz(Class<T> clazzToSet) {
		this.clazz = clazzToSet;
	}

	@Override
	@SuppressWarnings("unchecked")
	public T findOne(long id) {
		return (T) getCurrentSession().get(clazz, id);
	}

	@Override
	@SuppressWarnings("unchecked")
	public List<T> findAll() {
		return getCurrentSession().createQuery("FROM " + clazz.getName()).list();
	}

	@Override
	public void create(T entity) {
		getCurrentSession().persist(entity);
	}

	@Override
	@SuppressWarnings("unchecked")
	public T update(T entity) {
		return (T) getCurrentSession().merge(entity);
	}

	@Override
	public Page<T> findPaginated(final int page, final int size) {
		return getDao().findAll(new PageRequest(page, size));
	}

	@Override
	public void delete(T entity) {
		getCurrentSession().delete(entity);
	}

	@Override
	public void deleteById(long id) {
		T entity = findOne(id);
		delete(entity);
	}

	public void flush() {
		getCurrentSession().flush();
	}

	public void clear() {
		getCurrentSession().clear();
	}

	protected final Session getCurrentSession() {
		return sessionFactory.getCurrentSession();
	}

	protected abstract PagingAndSortingRepository<T, Long> getDao();
}
