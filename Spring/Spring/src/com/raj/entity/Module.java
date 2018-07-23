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
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.OrderBy;
import javax.persistence.Table;

import com.fasterxml.jackson.annotation.JsonIdentityInfo;
import com.fasterxml.jackson.annotation.JsonIdentityReference;
import com.fasterxml.jackson.annotation.ObjectIdGenerators;

/**
 *
 * @author rajkumar.s
 */
@Entity
@Table(name = "module", catalog = "spring")
public class Module implements Serializable {

	private static final long serialVersionUID = 3293409226586347172L;
	private Long moduleCode;
	private String moduleName;
	private Integer moduleOrder;
	private String pageName;
	private Module parent;
	private String moduleIcon;
	private boolean active;

	private Set<Module> subModules = new HashSet<>(0);
	private Set<RoleRights> roleRights = new HashSet<>(0);

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "mod_modulecode", nullable = false, unique = true)
	public Long getModuleCode() {
		return moduleCode;
	}

	public void setModuleCode(Long moduleCode) {
		this.moduleCode = moduleCode;
	}

	@Column(name = "mod_modulename")
	public String getModuleName() {
		return moduleName;
	}

	public void setModuleName(String moduleName) {
		this.moduleName = moduleName;
	}

	@Column(name = "mod_moduleorder")
	public Integer getModuleOrder() {
		return moduleOrder;
	}

	public void setModuleOrder(Integer moduleOrder) {
		this.moduleOrder = moduleOrder;
	}

	@Column(name = "mod_modulepagename")
	public String getPageName() {
		return pageName;
	}

	public void setPageName(String pageName) {
		this.pageName = pageName;
	}

	@Column(name = "mod_moduleicon")
	public String getModuleIcon() {
		return moduleIcon;
	}

	public void setModuleIcon(String moduleIcon) {
		this.moduleIcon = moduleIcon;
	}

	@Column(name = "active")
	public boolean isActive() {
		return active;
	}

	public void setActive(boolean active) {
		this.active = active;
	}

	@ManyToOne(fetch = FetchType.EAGER, cascade = CascadeType.ALL)
	@JoinColumn(name = "mod_parent")
	@JsonIdentityInfo(generator = ObjectIdGenerators.PropertyGenerator.class, property = "moduleCode")
	@JsonIdentityReference(alwaysAsId = true)
	public Module getParent() {
		return parent;
	}

	public void setParent(Module parent) {
		this.parent = parent;
	}

	@OneToMany(mappedBy = "parent", fetch = FetchType.EAGER, cascade = CascadeType.ALL)
	@OrderBy("moduleOrder")
	public Set<Module> getSubModules() {
		return subModules;
	}

	public void setSubModules(Set<Module> subModules) {
		this.subModules = subModules;
	}

	@OneToMany(mappedBy = "module", fetch = FetchType.EAGER, cascade = CascadeType.ALL)
	@JsonIdentityInfo(generator = ObjectIdGenerators.PropertyGenerator.class, property = "roleRightsId")
	@JsonIdentityReference(alwaysAsId = true)
	public Set<RoleRights> getRoleRights() {
		return roleRights;
	}

	public void setRoleRights(Set<RoleRights> roleRights) {
		this.roleRights = roleRights;
	}

	@Override
	public boolean equals(Object obj) {
		if (obj instanceof Module) {
			Module m = (Module) obj;
			if (this.moduleCode == m.getModuleCode() && this.moduleName.equals(m.getModuleName())) {
				return true;
			}
		}
		return false;
	}

	@Override
	public int hashCode() {
		return Objects.hash(this.moduleCode, this.moduleName);
	}

}
