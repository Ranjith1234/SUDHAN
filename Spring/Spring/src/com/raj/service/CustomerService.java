package com.raj.service;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Service;

import com.raj.dao.CustomerDao;
import com.raj.entity.CustomerMaster;

@Service
@Transactional
public class CustomerService {

	@Autowired
	private CustomerDao customerDao;

	public Long createCustomer(CustomerMaster customer) {
		return customerDao.createCustomer(customer);
	}

	public CustomerMaster updateCustomer(CustomerMaster customer) {
		return customerDao.update(customer);
	}

	public List<CustomerMaster> fetchAllCustomers() {
		return customerDao.findAll();
	}

	public Page<CustomerMaster> findPaginated(final int page, final int size) {
		return customerDao.findPaginated(page, size);
	}

	public CustomerMaster findCustomer(long id) {
		return customerDao.findOne(id);
	}

	public void deleteCustomer(CustomerMaster customer) {
		customerDao.delete(customer);
	}

	public void deleteCustomerById(long id) {
		customerDao.deleteById(id);
	}

}
