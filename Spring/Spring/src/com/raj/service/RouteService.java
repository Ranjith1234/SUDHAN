package com.raj.service;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.raj.dao.CommonDao;
import com.raj.entity.Module;
import com.raj.entity.RoleRights;

@Service
public class RouteService {

	@Autowired
	private CommonDao commonDao;

	@Transactional
	public List<Module> getModules() {
		return commonDao.getModules();
	}

	@Transactional
	public List<RoleRights> getAuthorizedRolesForModule(Long moduleCode) {
		return commonDao.getAuthorizedRolesForModule(moduleCode);
	}
}
