package com.raj.service;

import java.util.List;

import com.raj.entity.SystemUsers;

public interface AccountMgmtService {

	SystemUsers findUserById(long id);

	SystemUsers findUserByName(String name);

	void saveUser(SystemUsers user);

	void updateUser(SystemUsers user);

	void deleteUserById(long id);

	List<SystemUsers> findAllUsers();

	void deleteAllUsers() throws Exception;

	public boolean isUserNameExist(String username);

}
