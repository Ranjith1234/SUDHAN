package com.raj.service;

import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.raj.dao.RoleDao;
import com.raj.dao.SystemUsersDao;
import com.raj.dao.UserRolesDao;
import com.raj.entity.Role;
import com.raj.entity.SystemUsers;
import com.raj.entity.UserRoles;

@Service
@Transactional
public class AccountMgmtServiceImpl implements AccountMgmtService {

	@Autowired
	private SystemUsersDao userDao;

	@Autowired
	private UserRolesDao userRolesDao;

	@Autowired
	private RoleDao roleDao;

	@Override
	public SystemUsers findUserById(long id) {
		return userDao.findOne(id);
	}

	@Override
	public SystemUsers findUserByName(String username) {
		return userDao.getUserByName(username);
	}

	@Override
	public void saveUser(SystemUsers user) {
		SystemUsers userWithUserId = userDao.createUser(user);

		Set<UserRoles> userRoles = userWithUserId.getUserRoles();
		if (userWithUserId.getUserId() != null && userRoles != null) {
			for (UserRoles entity : userRoles) {
				Role role = roleDao.getRoleByName(entity.getRole().getRoleName());
				entity.setRole(role);
				entity.setUserId(userWithUserId);
				userRolesDao.create(entity);
			}
		}
	}

	@Override
	public void updateUser(SystemUsers user) {
		userDao.update(user);
		List<UserRoles> existingUserRoles = userRolesDao.getUserRolesByUserId(user);
		Set<UserRoles> newUserRoles = user.getUserRoles();

		Set<String> newRoleSet = new HashSet<>();
		Set<String> existingRoleSet = new HashSet<>();

		for (UserRoles newUr : newUserRoles) {
			newRoleSet.add(newUr.getRole().getRoleName());
		}

		for (UserRoles ur : existingUserRoles) {
			String roleName = ur.getRole().getRoleName();
			existingRoleSet.add(roleName);

			if (!newRoleSet.contains(roleName)) {
				userRolesDao.deleteById(ur.getUrid());
			}
		}

		for (UserRoles entity : newUserRoles) {
			String roleName = entity.getRole().getRoleName();
			if (!existingRoleSet.contains(roleName)) {
				Role role = roleDao.getRoleByName(roleName);
				entity.setRole(role);
				entity.setUserId(user);
				userRolesDao.create(entity);
			}
		}

	}

	@Override
	public void deleteUserById(long id) {
		userDao.deleteById(id);
	}

	@Override
	public List<SystemUsers> findAllUsers() {
		return userDao.findAll();
	}

	@Override
	public void deleteAllUsers() throws Exception {
		throw new Exception("Unsupported");
	}

	@Override
	public boolean isUserNameExist(String username) {
		return findUserByName(username) != null;
	}

}
