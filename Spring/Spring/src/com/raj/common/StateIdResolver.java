package com.raj.common;

import com.raj.entity.State;

public class StateIdResolver extends AbstractIdResolver {

	@Override
	protected Class<?> getType() {
		return State.class;
	}

}
