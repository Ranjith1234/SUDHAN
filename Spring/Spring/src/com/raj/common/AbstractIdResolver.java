package com.raj.common;

import java.lang.reflect.InvocationTargetException;
import java.util.HashMap;
import java.util.Map;

import com.fasterxml.jackson.annotation.ObjectIdGenerator;
import com.fasterxml.jackson.annotation.ObjectIdGenerator.IdKey;
import com.fasterxml.jackson.annotation.ObjectIdResolver;

public abstract class AbstractIdResolver implements ObjectIdResolver {

	private Map<ObjectIdGenerator.IdKey, Object> _items = new HashMap<>();

	@Override
	public void bindItem(IdKey id, Object pojo) {
		if (_items.containsKey(id)) {
			throw new IllegalStateException(
					"Already had POJO for id (" + id.key.getClass().getName() + ") [" + id + "]");
		}
		_items.put(id, pojo);
	}

	@Override
	public Object resolveId(IdKey id) {
		Object obj = _items.get(id);
		if (obj == null) {
			obj = create(id);
			_items.put(id, obj);
		}
		return obj;
	}

	public Object create(ObjectIdGenerator.IdKey id) {
		try {
			System.out.println("Creating empty " + getType().getName() + " with id " + id.key.toString());
			return getType().getConstructor(id.key.getClass()).newInstance(id.key);
		} catch (NoSuchMethodException | IllegalAccessException | InvocationTargetException
				| InstantiationException ex) {
			ex.printStackTrace();
			return null;
		}
	}

	protected abstract Class<?> getType();

	@Override
	public ObjectIdResolver newForDeserialization(Object context) {
		return this;
	}

	@Override
	public boolean canUseFor(ObjectIdResolver resolverType) {
		return getClass().isAssignableFrom(resolverType.getClass());
	}

}
