package com.raj.dao;

import java.io.Serializable;
import java.util.List;

import org.springframework.data.domain.Page;

public interface IGenericDao<T extends Serializable> {

	T findOne(final long id);

	List<T> findAll();

	void create(final T entity);

	T update(final T entity);

	Page<T> findPaginated(int page, int size);

	void delete(final T entity);

	void deleteById(final long id);
}
