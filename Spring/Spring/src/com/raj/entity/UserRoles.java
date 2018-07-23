/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.raj.entity;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.UniqueConstraint;

import com.fasterxml.jackson.annotation.JsonIdentityReference;

/**
 *
 * @author rajkumar.s
 */

@Entity
@Table(name = "user_roles", catalog = "spring", uniqueConstraints = {
		@UniqueConstraint(columnNames = { "ur_userid", "ur_rolecode" }) })
// @JsonIdentityInfo(generator = ObjectIdGenerators.PropertyGenerator.class,
// property = "urid", scope = UserRoles.class)
public class UserRoles implements Serializable {

	private static final long serialVersionUID = -2266717605892269135L;
	private Long urid;
	private SystemUsers userId;
	private Role role;

	public UserRoles() {
	}

	public UserRoles(Role role) {
		this.role = role;
	}

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "ur_id", nullable = false, unique = true)
	public Long getUrid() {
		return urid;
	}

	public void setUrid(Long urid) {
		this.urid = urid;
	}

	@JsonIdentityReference(alwaysAsId = true)
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "ur_userid")
	public SystemUsers getUserId() {
		return userId;
	}

	public void setUserId(SystemUsers userId) {
		this.userId = userId;
	}

	@JsonIdentityReference(alwaysAsId = true)
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "ur_rolecode")
	public Role getRole() {
		return role;
	}

	public void setRole(Role role) {
		this.role = role;
	}

}
