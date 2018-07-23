package com.raj.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.raj.entity.CustomerMaster;

public interface CustomerPaginatedDao
		extends JpaRepository<CustomerMaster, Long>, JpaSpecificationExecutor<CustomerMaster> {

	@Query("SELECT f FROM CustomerMaster f WHERE LOWER(f.customerName) = LOWER(:name)")
	CustomerMaster retrieveByName(@Param("name") String name);
}
