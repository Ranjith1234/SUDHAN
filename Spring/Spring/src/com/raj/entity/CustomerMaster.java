/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.raj.entity;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import com.fasterxml.jackson.annotation.JsonIdentityReference;
import com.fasterxml.jackson.databind.annotation.JsonDeserialize;
import com.raj.common.DateDeserializer;

/**
 *
 * @author rajkumar.s
 */
@Entity
@Table(name = "customermaster")
public class CustomerMaster implements Serializable {

	private static final long serialVersionUID = 749445657705423117L;
	private Long customerId;
	private String customerName;
	private String address;
	private String city;
	private State state;
	private String postalCode;
	private Country country;
	private String tin;
	private String cstno;
	private Date cstdate;
	private String phone;
	private String fax;
	private String emailId;
	private String website;
	private String contact;
	private String contactPhone;
	private String recordStatus;
	private Date cDate;
	private String createdBy;
	private Date createdDateTime;

	public CustomerMaster() {
		customerId = null;
		recordStatus = null;
		cDate = null;
		createdBy = null;
		createdDateTime = null;
	}

	public CustomerMaster(Long customerId, String customerName, String address, String city, State state,
			String postalCode, Country country, String tin, String cstno, Date cstdate, String phone, String fax,
			String emailId, String website, String contact, String contactPhone, String recordStatus, Date cDate,
			String createdBy, Date createdDateTime) {
		super();
		this.customerId = customerId;
		this.customerName = customerName;
		this.address = address;
		this.city = city;
		this.state = state;
		this.postalCode = postalCode;
		this.country = country;
		this.tin = tin;
		this.cstno = cstno;
		this.cstdate = cstdate;
		this.phone = phone;
		this.fax = fax;
		this.emailId = emailId;
		this.website = website;
		this.contact = contact;
		this.contactPhone = contactPhone;
		this.recordStatus = recordStatus;
		this.cDate = cDate;
		this.createdBy = createdBy;
		this.createdDateTime = createdDateTime;
	}

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "CID")
	public Long getCustomerId() {
		return customerId;
	}

	public void setCustomerId(Long customerId) {
		this.customerId = customerId;
	}

	@Column(name = "CustomerName")
	public String getCustomerName() {
		return customerName;
	}

	public void setCustomerName(String customerName) {
		this.customerName = customerName;
	}

	@Column(name = "Address")
	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	@Column(name = "City")
	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	@JsonIdentityReference(alwaysAsId = true)
	@ManyToOne
	@JoinColumn(name = "StateId")
	public State getState() {
		return state;
	}

	public void setState(State state) {
		this.state = state;
	}

	@Column(name = "PostalCode")
	public String getPostalCode() {
		return postalCode;
	}

	public void setPostalCode(String postalCode) {
		this.postalCode = postalCode;
	}

	@JsonIdentityReference(alwaysAsId = true)
	@ManyToOne
	@JoinColumn(name = "CountryId")
	public Country getCountry() {
		return country;
	}

	public void setCountry(Country country) {
		this.country = country;
	}

	@Column(name = "TIN")
	public String getTin() {
		return tin;
	}

	public void setTin(String tin) {
		this.tin = tin;
	}

	@Column(name = "CSTNo")
	public String getCstno() {
		return cstno;
	}

	public void setCstno(String cstno) {
		this.cstno = cstno;
	}

	@Column(name = "CSTDate")
	@JsonDeserialize(using = DateDeserializer.class)
	public Date getCstdate() {
		return cstdate;
	}

	public void setCstdate(Date cstdate) {
		this.cstdate = cstdate;
	}

	@Column(name = "Phone")
	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	@Column(name = "Fax")
	public String getFax() {
		return fax;
	}

	public void setFax(String fax) {
		this.fax = fax;
	}

	@Column(name = "EmailId")
	public String getEmailId() {
		return emailId;
	}

	public void setEmailId(String emailId) {
		this.emailId = emailId;
	}

	@Column(name = "Website")
	public String getWebsite() {
		return website;
	}

	public void setWebsite(String website) {
		this.website = website;
	}

	@Column(name = "Contact")
	public String getContact() {
		return contact;
	}

	public void setContact(String contact) {
		this.contact = contact;
	}

	@Column(name = "ContactPhoneNo")
	public String getContactPhone() {
		return contactPhone;
	}

	public void setContactPhone(String contactPhone) {
		this.contactPhone = contactPhone;
	}

	@Column(name = "RecordStatus", columnDefinition = "varchar(30) default 'Active'")
	public String getRecordStatus() {
		return recordStatus;
	}

	public void setRecordStatus(String recordStatus) {
		this.recordStatus = recordStatus;
	}

	@Column(name = "CDate")
	@Temporal(TemporalType.DATE)
	public Date getcDate() {
		return cDate;
	}

	public void setcDate(Date cDate) {
		this.cDate = cDate;
	}

	@Column(name = "CreatedBy")
	public String getCreatedBy() {
		return createdBy;
	}

	public void setCreatedBy(String createdBy) {
		this.createdBy = createdBy;
	}

	@Column(name = "CreatedDateTime")
	@Temporal(TemporalType.TIMESTAMP)
	public Date getCreatedDateTime() {
		return createdDateTime;
	}

	public void setCreatedDateTime(Date createdDateTime) {
		this.createdDateTime = createdDateTime;
	}

}
