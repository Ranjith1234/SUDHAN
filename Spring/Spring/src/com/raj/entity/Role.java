/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.raj.entity;

import java.io.Serializable;
import java.util.HashSet;
import java.util.Objects;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import com.fasterxml.jackson.annotation.JsonIdentityInfo;
import com.fasterxml.jackson.annotation.JsonIdentityReference;
import com.fasterxml.jackson.annotation.ObjectIdGenerators;
import com.raj.common.RoleIdResolver;

/**
 *
 * @author rajkumar.s
 */
@Entity
@Table(name = "role")
@JsonIdentityInfo(generator = ObjectIdGenerators.PropertyGenerator.class, property = "roleName", resolver = RoleIdResolver.class, scope = Role.class)
public class Role implements Serializable {

	private static final long serialVersionUID = -404028293905115924L;
	private Long roleCode;
	private String roleName;
	private Set<UserRoles> usersRole = new HashSet<>(0);
	private Set<RoleRights> roleRights = new HashSet<>(0);

	public Role() {
	}

	public Role(String roleName) {
		this.roleName = roleName;
	}

	public Role(Long roleCode) {
		this.roleCode = roleCode;
	}

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "role_rolecode")
	public Long getRoleCode() {
		return roleCode;
	}

	public void setRoleCode(Long roleCode) {
		this.roleCode = roleCode;
	}

	@Column(name = "role_rolename", unique = true)
	public String getRoleName() {
		return roleName;
	}

	public void setRoleName(String roleName) {
		this.roleName = roleName;
	}

	@JsonIdentityReference(alwaysAsId = true)
	@JsonIdentityInfo(generator = ObjectIdGenerators.PropertyGenerator.class, property = "urid", scope = UserRoles.class)
	@OneToMany(mappedBy = "role", fetch = FetchType.EAGER)
	public Set<UserRoles> getUsersRole() {
		return usersRole;
	}

	public void setUsersRole(Set<UserRoles> usersRole) {
		this.usersRole = usersRole;
	}

	@OneToMany(mappedBy = "role", fetch = FetchType.EAGER, cascade = CascadeType.ALL)
	public Set<RoleRights> getRoleRights() {
		return roleRights;
	}

	public void setRoleRights(Set<RoleRights> roleRights) {
		this.roleRights = roleRights;
	}

	@Override
	public boolean equals(Object obj) {
		if (obj instanceof Role) {
			Role role = (Role) obj;
			if (this.roleCode == role.getRoleCode() && this.roleName.equals(role.getRoleName())) {
				return true;
			}
		}
		return false;
	}

	@Override
	public int hashCode() {
		return Objects.hash(this.roleCode, this.roleName);
	}

}
