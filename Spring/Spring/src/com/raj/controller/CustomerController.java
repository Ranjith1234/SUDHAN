package com.raj.controller;

import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationEventPublisher;
import org.springframework.data.domain.Page;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.util.UriComponentsBuilder;

import com.raj.entity.CustomerMaster;
import com.raj.exception.MyResourceNotFoundException;
import com.raj.service.CustomerService;
import com.raj.web.hateoas.event.PaginatedResultsRetrievedEvent;

@RestController
@RequestMapping("/api")
public class CustomerController {

	@Autowired
	private ApplicationEventPublisher eventPublisher;

	@Autowired
	private CustomerService customerService;

	private static final Logger LOGGER = LoggerFactory.getLogger(CustomerController.class);

	@RequestMapping(value = "/customer", method = RequestMethod.POST)
	public ResponseEntity<CustomerMaster> createCustomer(@RequestBody CustomerMaster customer,
			UriComponentsBuilder ucBuilder, HttpSession session) {
		LOGGER.debug("Creating Customer {}", customer.getCustomerName());
		customer.setCreatedBy((String) session.getAttribute("user"));
		customer.setRecordStatus("Active");
		customer.setcDate(new Date());
		Long id = customerService.createCustomer(customer);
		LOGGER.debug("customer created successfully - with id : {}", id);
		return new ResponseEntity<>(customer, HttpStatus.CREATED);
	}

	@RequestMapping(value = "/customer", method = RequestMethod.GET)
	public ResponseEntity<List<CustomerMaster>> fetchAllCustomers() {
		List<CustomerMaster> customersList = customerService.fetchAllCustomers();
		if (customersList.isEmpty()) {
			return new ResponseEntity<>(HttpStatus.NO_CONTENT);
		}
		return new ResponseEntity<>(customersList, HttpStatus.OK);
	}

	@RequestMapping(value = "/cusomerPage", params = { "page", "size" }, method = RequestMethod.GET)
	public ResponseEntity<List<CustomerMaster>> findPaginated(@RequestParam("page") int page,
			@RequestParam("size") int size, UriComponentsBuilder uriBuilder, HttpServletResponse response) {

		Page<CustomerMaster> resultPage = customerService.findPaginated(page, size);
		if (page > resultPage.getTotalPages()) {
			throw new MyResourceNotFoundException();
		}
		eventPublisher.publishEvent(new PaginatedResultsRetrievedEvent<CustomerMaster>(CustomerMaster.class, uriBuilder,
				response, page, resultPage.getTotalPages(), size));
		List<CustomerMaster> customerList = resultPage.getContent();
		return new ResponseEntity<>(customerList, HttpStatus.OK);
	}

	@RequestMapping(value = "/{id}/customer", method = RequestMethod.GET)
	public ResponseEntity<CustomerMaster> findCustomerById(@PathVariable("id") long id) {
		CustomerMaster customer = customerService.findCustomer(id);
		if (customer == null) {
			LOGGER.error("User with id {} not found", id);
			return new ResponseEntity<>(HttpStatus.NOT_FOUND);
		}
		return new ResponseEntity<>(customer, HttpStatus.OK);
	}

	@RequestMapping(value = "/{id}/customer", method = RequestMethod.PUT)
	public ResponseEntity<CustomerMaster> updateCustomer(@PathVariable("id") long id,
			@RequestBody CustomerMaster customer) {
		CustomerMaster existingCustomer = customerService.findCustomer(id);
		if (existingCustomer == null) {
			LOGGER.error("User with id {} not found", id);
			return new ResponseEntity<>(HttpStatus.NOT_FOUND);
		}
		customerService.updateCustomer(customer);
		return new ResponseEntity<>(customer, HttpStatus.OK);
	}
}
