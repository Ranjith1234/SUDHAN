package com.raj.dao;

import org.springframework.beans.factory.config.BeanDefinition;
import org.springframework.context.annotation.Scope;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.repository.PagingAndSortingRepository;
import org.springframework.stereotype.Repository;

import com.raj.entity.CustomerMaster;

@Repository
@Scope(BeanDefinition.SCOPE_PROTOTYPE)
public class CustomerDao extends AbstractHibernateDao<CustomerMaster> {

	// @Autowired
	// private CustomerPaginatedDao dao;

	public CustomerDao() {
		setClazz(CustomerMaster.class);
	}

	public Long createCustomer(CustomerMaster customer) {
		create(customer);
		flush();
		return customer.getCustomerId();
	}

	@Override
	protected PagingAndSortingRepository<CustomerMaster, Long> getDao() {
		// return dao;
		return null;
	}

	public Page<CustomerMaster> findPaginated(Pageable pageable) {
		// return dao.findAll(pageable);
		return null;
	}

}
