/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.raj.entity;

import java.io.Serializable;
import java.util.Objects;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

/**
 *
 * @author rajkumar.s
 */

@Entity
@Table(name = "role_rights", catalog = "spring")
public class RoleRights implements Serializable {

	private static final long serialVersionUID = -3015274852779679896L;
	private Long roleRightsId;
	private Module module;
	private Role role;
	private boolean create;
	private boolean edit;
	private boolean del;
	private boolean view;

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "RRID", nullable = false, unique = true)
	public Long getRoleRightsId() {
		return roleRightsId;
	}

	public void setRoleRightsId(Long roleRightsId) {
		this.roleRightsId = roleRightsId;
	}

	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "rr_modulecode")
	public Module getModule() {
		return module;
	}

	public void setModule(Module module) {
		this.module = module;
	}

	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "rr_rolecode")
	public Role getRole() {
		return role;
	}

	public void setRole(Role role) {
		this.role = role;
	}

	@Column(name = "rr_create")
	public boolean getCreate() {
		return create;
	}

	public void setCreate(boolean create) {
		this.create = create;
	}

	@Column(name = "rr_edit")
	public boolean getEdit() {
		return edit;
	}

	public void setEdit(boolean edit) {
		this.edit = edit;
	}

	@Column(name = "rr_delete")
	public boolean getDelete() {
		return del;
	}

	public void setDelete(boolean delete) {
		this.del = delete;
	}

	@Column(name = "rr_view")
	public boolean getView() {
		return view;
	}

	public void setView(boolean view) {
		this.view = view;
	}

	@Override
	public boolean equals(Object obj) {
		if (obj instanceof RoleRights) {
			RoleRights rr = (RoleRights) obj;
			if (this.roleRightsId == rr.getRoleRightsId()
					&& this.module.getModuleCode() == rr.getModule().getModuleCode()
					&& this.role.getRoleCode() == rr.getRole().getRoleCode()) {
				return true;
			}
		}
		return false;
	}

	@Override
	public int hashCode() {
		return Objects.hash(this.roleRightsId, this.create, this.edit, this.del, this.view);
	}

}
