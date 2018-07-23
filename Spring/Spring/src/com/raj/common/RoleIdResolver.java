package com.raj.common;

import com.raj.entity.Role;

public class RoleIdResolver extends AbstractIdResolver {

	@Override
	protected Class<?> getType() {
		return Role.class;
	}

}
