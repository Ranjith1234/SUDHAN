package com.raj.controller;

import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.raj.entity.Module;
import com.raj.entity.RoleRights;
import com.raj.service.RouteService;

@Controller
public class RouteController {

	@Autowired
	private RouteService routeService;

	@RequestMapping("/routeJson.do")
	public ResponseEntity<List<Object>> routeJson() {
		List<Object> routeList = new ArrayList<>();
		List<Module> moduleList = routeService.getModules();

		for (Module module : moduleList) {
			final Long moduleCode = module.getModuleCode();
			final String pageName = module.getPageName().trim().replaceAll("#", "");
			if (!pageName.isEmpty()) {
				Set<RoleRights> rrList = module.getRoleRights();
				Set<RoleRights> roleRightsList = new HashSet<>(routeService.getAuthorizedRolesForModule(moduleCode));
				if (!Collections.disjoint(rrList, roleRightsList)) {
					Map<String, Object> route = new HashMap<>();

					route.put("name", "/" + pageName);
					route.put("templateUrl", pageName);
					route.put("title", module.getModuleName());
					routeList.add(route);
				}
			}
		}

		return new ResponseEntity<>(routeList, HttpStatus.OK);
	}

}
