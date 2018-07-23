package com.raj.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.raj.entity.Role;
import com.raj.service.RoleService;

@RestController
@RequestMapping("/api")
public class RoleController {

	@Autowired
	private RoleService roleService;

	@RequestMapping(value = "role.do", method = RequestMethod.GET)
	public ResponseEntity<List<Role>> getAllRoles() {
		List<Role> roles = roleService.fetchAllRole();
		return new ResponseEntity<>(roles, HttpStatus.OK);
	}
}
