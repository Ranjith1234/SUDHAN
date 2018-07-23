/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.raj.configuration;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.builders.WebSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;

/**
 *
 * @author rajkumar.s
 */
@Configuration
@EnableWebSecurity
public class SecurityConfiguration extends WebSecurityConfigurerAdapter {

	@Autowired
	DataSource dataSource;

	@Autowired
	SuccessLoginHandler successLoginHandler;

	@Autowired
	RestAuthenticationEntryPoint authenticationEntryPoint;

	@Autowired
	public void configureGlobalSecurity(AuthenticationManagerBuilder auth) throws Exception {
		// auth.inMemoryAuthentication().withUser("user").password("user").roles("USER");
		// auth.inMemoryAuthentication().withUser("admin").password("admin").roles("ADMIN");
		// auth.inMemoryAuthentication().withUser("dba").password("dba").roles("ADMIN",
		// "DBA");

		auth.jdbcAuthentication().dataSource(dataSource)
				.usersByUsernameQuery("select u_username,u_password, active from system_users where u_username=?")
				.authoritiesByUsernameQuery(
						"SELECT u_username, role_rolename FROM system_users JOIN user_roles ON u_userid = ur_userid JOIN role ON role_rolecode = ur_rolecode WHERE u_username=?");

	}

	public void cofigure(WebSecurity web) throws Exception {
		web.ignoring().antMatchers("/assets/**");
	}

	@Override
	protected void configure(HttpSecurity http) throws Exception {
		http.csrf().disable().authorizeRequests().antMatchers("/login*").permitAll().antMatchers("/assets/**")
				.permitAll().antMatchers("/admin/**").access("hasRole('ADMIN')").antMatchers("/db/**")
				.access("hasRole('ADMIN') and hasRole('DBA')").antMatchers("/**").authenticated().antMatchers("/api/**")
				.authenticated().and().formLogin().loginPage("/login.do").successHandler(successLoginHandler)
				.usernameParameter("username").passwordParameter("password").and().exceptionHandling()
				.accessDeniedPage("/access_denied.do").authenticationEntryPoint(authenticationEntryPoint).and()
				.httpBasic().and().logout();

	}
}
