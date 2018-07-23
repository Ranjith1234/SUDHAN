package com.raj.common;

import com.raj.entity.Country;

public class CountryIdResolver extends AbstractIdResolver {

	@Override
	protected Class<?> getType() {
		return Country.class;
	}

}
