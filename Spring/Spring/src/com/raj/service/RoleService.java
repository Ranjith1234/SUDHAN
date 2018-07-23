/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.raj.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.raj.dao.RoleDao;
import com.raj.entity.Role;

/**
 *
 * @author rajkumar.s
 */
@Service
@Transactional
public class RoleService {

	@Autowired
	private RoleDao roleDao;

	public void createRole(Role role) {
		roleDao.create(role);
	}

	public Role update(Role role) {
		return roleDao.update(role);
	}

	public Role fetchRoleById(Long id) {
		return roleDao.findOne(id);
	}

	public List<Role> fetchAllRole() {
		return roleDao.findAll();
	}

	public void deleteRoleById(Long id) {
		roleDao.deleteById(id);
	}

}
