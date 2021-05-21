package edu.vinaenter;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.core.annotation.Order;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.authentication.SimpleUrlAuthenticationFailureHandler;

@Configuration
@EnableWebSecurity
public  class SecurityConfig {
		
	@Configuration
	@Order(1)
	public static class SecurityConfigAdmin  extends WebSecurityConfigurerAdapter{
		
		public SecurityConfigAdmin() {
			super();
		}
		
		@Autowired
		DataSource dataSource;
		
		@Autowired
		public void configAuthentication(AuthenticationManagerBuilder auth) throws Exception {
			auth.jdbcAuthentication().dataSource(dataSource).passwordEncoder(passwordEncoder())
					.usersByUsernameQuery("select username,password, enabled from users where username=?")
					.authoritiesByUsernameQuery(
							"select username,name from users u inner join role r on u.role_id = r.id where username= ?");
		}
		
		@Bean
		public PasswordEncoder passwordEncoder() {
			return new BCryptPasswordEncoder();
		}
		
		@Override
		protected void configure(HttpSecurity http) throws Exception {
			http
			.antMatcher("/admin/**")
			.authorizeRequests()
			.antMatchers("/admin/cat/edit/**").access("hasAnyRole('ROLE_ADMIN','ROLE_MODIFIER')")
			.antMatchers("/admin/cat/add/**").access("hasAnyRole('ROLE_ADMIN','ROLE_MODIFIER')")
			.antMatchers("/admin/cat/del/**").access("hasRole('ROLE_ADMIN')")
			.antMatchers("/admin/product/add/**").access("hasAnyRole('ROLE_ADMIN','ROLE_MODIFIER')")
			.antMatchers("/admin/product/del/**").access("hasRole('ROLE_ADMIN')")
			.antMatchers("/admin/product/edit/**").access("hasAnyRole('ROLE_ADMIN','ROLE_MODIFIER')")
			.antMatchers("/admin/user/add/**").access("hasAnyRole('ROLE_ADMIN','ROLE_MODIFIER')")
			.antMatchers("/admin/user/del/**").access("hasRole('ROLE_ADMIN')")
			.antMatchers("/admin/user/edit/**").access("hasAnyRole('ROLE_ADMIN','ROLE_MODIFIER','ROLE_USER')")
			.antMatchers("/admin/order/add/**").access("hasAnyRole('ROLE_ADMIN','ROLE_MODIFIER')")
			.antMatchers("/admin/order/del/**").access("hasRole('ROLE_ADMIN')")
			.antMatchers("/admin/order/edit/**").access("hasAnyRole('ROLE_ADMIN','ROLE_MODIFIER')")
			.antMatchers("/admin/order/view/**").access("hasAnyRole('ROLE_ADMIN','ROLE_ADMIN','ROLE_MODIFIER')")
			.antMatchers("/admin/cart/add/**").access("hasAnyRole('ROLE_ADMIN','ROLE_MODIFIER')")
			.antMatchers("/admin/cart/del/**").access("hasRole('ROLE_ADMIN')")
			.antMatchers("/admin/cart/edit/**").access("hasAnyRole('ROLE_ADMIN','ROLE_MODIFIER')")
			.antMatchers("/admin/cart/view/**").access("hasAnyRole('ROLE_ADMIN','ROLE_ADMIN','ROLE_MODIFIER')")
			.antMatchers("/admin/color/add/**").access("hasAnyRole('ROLE_ADMIN','ROLE_MODIFIER')")
			.antMatchers("/admin/color/del/**").access("hasRole('ROLE_ADMIN')")
			.antMatchers("/admin/color/edit/**").access("hasAnyRole('ROLE_ADMIN','ROLE_MODIFIER')")
			.antMatchers("/admin/size/add/**").access("hasAnyRole('ROLE_ADMIN','ROLE_MODIFIER')")
			.antMatchers("/admin/size/del/**").access("hasRole('ROLE_ADMIN')")
			.antMatchers("/admin/size/edit/**").access("hasAnyRole('ROLE_ADMIN','ROLE_MODIFIER')")
			.antMatchers("/admin/**").access("hasAnyRole('ROLE_ADMIN','ROLE_USER','ROLE_MODIFIER')")
			.antMatchers("/admin/auth/login").permitAll()
			.anyRequest().authenticated()
			.and()
			.formLogin()
			.loginPage("/admin/auth/login")
			.permitAll()
			.usernameParameter("username")
			.passwordParameter("password")
			.failureHandler(new SimpleUrlAuthenticationFailureHandler() {
		        @Override
		        public void onAuthenticationFailure(HttpServletRequest request, HttpServletResponse response,
		                AuthenticationException exception) throws IOException, ServletException {
		            String username = request.getParameter("username");
		            String error = exception.getMessage();
		            System.out.println("A failed login attempt with email: "
		                                + username + ". Reason: " + error);
		             
		            super.setDefaultFailureUrl("/admin/auth/login?msg=error");
		        }
		    })
			.successForwardUrl("/admin/user/index")
			.loginProcessingUrl("/admin/auth/login")
			.defaultSuccessUrl("/admin/index",true)
			.and()
			.logout()
			.logoutUrl("admin/auth/login")
			.logoutSuccessUrl("/admin/auth/login")
			.and()
			.exceptionHandling()
			.accessDeniedPage("/errors")
			.and()
			.csrf().disable();		
		}
	}
		
	@Configuration
	@Order(2)
	public static class SecurityConfigPublic extends WebSecurityConfigurerAdapter{
		
		public SecurityConfigPublic() {
			super();
		}
		
		@Autowired
		DataSource dataSource;
		
		@Autowired
		public void configAuthentication(AuthenticationManagerBuilder auth) throws Exception {
			auth.jdbcAuthentication().dataSource(dataSource).passwordEncoder(passwordEncoder())
					.usersByUsernameQuery("select username,password, enabled from users where username=?")
					.authoritiesByUsernameQuery(
							"select username,name from users u inner join role r on u.role_id = r.id where username= ?");
		}
		
		@Bean
		public PasswordEncoder passwordEncoder() {
			return new BCryptPasswordEncoder();
		}
		
		
		@Override
		protected void configure(HttpSecurity http) throws Exception {
			http
			.antMatcher("/**")
			.authorizeRequests()
			.antMatchers("/**").permitAll()
			.and()
			.formLogin()
			.loginPage("/login")
			.permitAll()
			.usernameParameter("username")
			.passwordParameter("password")
			.failureHandler(new SimpleUrlAuthenticationFailureHandler() {
		        @Override
		        public void onAuthenticationFailure(HttpServletRequest request, HttpServletResponse response,
		                AuthenticationException exception) throws IOException, ServletException {
		            String username = request.getParameter("username");
		            String error = exception.getMessage();
		            System.out.println("A failed login attempt with email: "
		                                + username + ". Reason: " + error);
		             
		            super.setDefaultFailureUrl("/login?msg=error");
		        }
		    })
			.successForwardUrl("/")
			.loginProcessingUrl("/login")
			.defaultSuccessUrl("/",true)
			.and()
			.logout()
			.logoutUrl("/logout")
			.logoutSuccessUrl("/login")
			.and()
			.exceptionHandling()
			.accessDeniedPage("/errors")
			.and()
			.csrf().disable();
			
		}

	}
	
}
	

