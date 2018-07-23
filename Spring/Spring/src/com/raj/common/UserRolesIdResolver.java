package com.raj.common;

import com.raj.entity.UserRoles;

public class UserRolesIdResolver extends AbstractIdResolver {

	@Override
	protected Class<?> getType() {
		return UserRoles.class;
	}

}
