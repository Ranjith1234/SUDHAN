package com.raj.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.util.UriComponentsBuilder;

import com.raj.entity.SystemUsers;
import com.raj.service.AccountMgmtService;

@RestController
@RequestMapping("/api")
public class AccountMgmtController {

	@Autowired
	private AccountMgmtService accMgmtService;

	private static final Logger LOGGER = LoggerFactory.getLogger(AccountMgmtController.class);

	// =================== Retrive all the users ========================//
	@RequestMapping(value = "/user", method = RequestMethod.GET)
	public ResponseEntity<List<SystemUsers>> listAllUsers() {
		List<SystemUsers> users = accMgmtService.findAllUsers();
		if (users.isEmpty()) {
			return new ResponseEntity<>(HttpStatus.NO_CONTENT);
		}
		return new ResponseEntity<>(users, HttpStatus.OK);
	}

	// =================== Retriveing single user ========================//
	@RequestMapping(value = "/{id}/user", method = RequestMethod.GET, produces = MediaType.APPLICATION_JSON_VALUE)
	public ResponseEntity<SystemUsers> getUser(@PathVariable("id") long id) {
		LOGGER.debug("Fetching User with id {}", id);
		SystemUsers user = accMgmtService.findUserById(id);
		if (user == null) {
			LOGGER.error("User with id {} not found", id);
			return new ResponseEntity<>(HttpStatus.NOT_FOUND);
		}
		return new ResponseEntity<>(user, HttpStatus.OK);
	}

	// =================== Create a user ========================//
	@RequestMapping(value = "/user", method = RequestMethod.POST)
	public ResponseEntity<Void> createUser(@RequestBody SystemUsers user, UriComponentsBuilder ucBuilder) {
		LOGGER.debug("Creating User " + user.getUserName());

		if (accMgmtService.isUserNameExist(user.getUserName())) {
			LOGGER.error("A User with name " + user.getUserName() + " already exist");
			return new ResponseEntity<>(HttpStatus.CONFLICT);
		}

		accMgmtService.saveUser(user);
		HttpHeaders headers = new HttpHeaders();
		headers.setLocation(ucBuilder.path("/{id}/user").buildAndExpand(user.getUserId()).toUri());
		return new ResponseEntity<>(headers, HttpStatus.CREATED);
	}

	// =================== Update a user ========================//
	@RequestMapping(value = "/{id}/user", method = RequestMethod.PUT)
	public ResponseEntity<SystemUsers> updateUser(@PathVariable("id") long id, @RequestBody SystemUsers user) {
		LOGGER.debug("Updating User {}", id);

		SystemUsers currentUser = accMgmtService.findUserById(id);

		if (currentUser == null) {
			LOGGER.error("User with id {} not found", id);
			return new ResponseEntity<>(HttpStatus.NOT_FOUND);
		}
		accMgmtService.updateUser(user);
		return new ResponseEntity<>(user, HttpStatus.OK);
	}

	// =================== Delete a user ========================//
	@RequestMapping(value = "/{id}/user", method = RequestMethod.DELETE)
	public ResponseEntity<SystemUsers> deleteUser(@PathVariable("id") long id) {
		LOGGER.debug("Fetching & Deleting User with id {}", id);

		SystemUsers user = accMgmtService.findUserById(id);
		if (user == null) {
			LOGGER.error("Unable to delete. User with id {} not found", id);
			return new ResponseEntity<>(HttpStatus.NOT_FOUND);
		}

		accMgmtService.deleteUserById(id);
		return new ResponseEntity<>(HttpStatus.NO_CONTENT);
	}

	@RequestMapping(value = "/{username}/checkusername", method = RequestMethod.GET)
	public ResponseEntity<Boolean> isUserNameExists(@PathVariable("username") String username) {
		boolean exists = accMgmtService.isUserNameExist(username);
		return new ResponseEntity<>(exists, HttpStatus.OK);
	}

}
