package com.raj.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.web.authentication.logout.SecurityContextLogoutHandler;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.raj.entity.Country;
import com.raj.entity.Module;
import com.raj.entity.State;
import com.raj.service.CommonService;

/**
 *
 * @author rajkumar.s
 */
@Controller
public class HomeController {

	static final Logger LOGGER = LoggerFactory.getLogger(HomeController.class);

	public HashMap<Long, Module> moduleMap;
	public List<Module> moduleList;

	@Autowired
	private CommonService commonService;

	@RequestMapping(value = { "/", "/home.do" })
	public String index() {
		return "index";
	}

	@RequestMapping("/load_menu.do")
	public ModelAndView generateMenu() {
		Map<String, Object> map = new HashMap<>();
		moduleList = commonService.loadMenu();
		map.put("moduleList", moduleList);
		return new ModelAndView("/common/menu", map);
	}

	@RequestMapping("/menu_json.do")
	public ResponseEntity<List<Module>> getMenu() {
		moduleList = commonService.loadMenu();
		return new ResponseEntity<>(moduleList, HttpStatus.OK);
	}

	@RequestMapping("/dashboard.do")
	public String dashboard() {
		return "dashboard";
	}

	@RequestMapping("/chat.do")
	public String chat() {
		return "/common/chat";
	}

	@RequestMapping("/blank.do")
	public String blank() {
		return "blank";
	}

	@RequestMapping("/newcustomer.do")
	public ModelAndView newCustomer() {
		List<Country> countryList = commonService.getCountries();
		Map<String, Object> model = new HashMap<>();
		model.put("countryList", countryList);
		model.put("test", "Hello Raj..");
		return new ModelAndView("Customer_Master", model);
	}

	@RequestMapping(value = "/country.do", method = RequestMethod.GET)
	public ResponseEntity<List<Country>> getCountries() {
		List<Country> countryList = commonService.getCountries();
		return new ResponseEntity<>(countryList, HttpStatus.OK);
	}

	@RequestMapping(value = "/{countryId}/states.do", method = RequestMethod.GET)
	public ResponseEntity<List<State>> getStates(@PathVariable("countryId") long countryId) {
		List<State> stateList = commonService.getStates(countryId);
		return new ResponseEntity<>(stateList, HttpStatus.OK);
	}

	@RequestMapping("/accountmgmt.do")
	public ModelAndView newuser() {
		return new ModelAndView("AccountMgmt");
	}

	@RequestMapping(value = "/getStates.do", headers = "Accept=application/json")
	public ResponseEntity<List<State>> getStatesOption(@RequestParam("cid") Long CID) {
		List<State> stateList;
		stateList = commonService.getStates(CID);
		return new ResponseEntity<>(stateList, HttpStatus.OK);
	}

	@RequestMapping("/access_denied.do")
	public String accessDenied() {
		return "access_denied";
	}

	@RequestMapping(value = "/login.do")
	public String login() {
		return "login";
	}

	@RequestMapping("/adminLogin.do")
	public String adminLogin() {
		return "login";
	}

	@RequestMapping("/userLogin.do")
	public String userLogin() {
		return "login";
	}

	@RequestMapping(value = "/logout.do")
	public String logoutPage(HttpServletRequest request, HttpServletResponse response) {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		if (auth != null) {
			new SecurityContextLogoutHandler().logout(request, response, auth);
		}
		return "redirect:/login.do?logout";
	}

}
