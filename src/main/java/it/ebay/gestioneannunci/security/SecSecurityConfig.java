package it.ebay.gestioneannunci.security;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;

@Configuration
@EnableWebSecurity
public class SecSecurityConfig extends WebSecurityConfigurerAdapter {

	@Autowired
	private CustomUserDetailsService customUserDetailsService;

	@Bean
	public PasswordEncoder passwordEncoder() {
		return new BCryptPasswordEncoder();
	}

	@Autowired
	public void configureGlobal(AuthenticationManagerBuilder auth) throws Exception {
		auth.userDetailsService(customUserDetailsService).passwordEncoder(passwordEncoder());
	}

	@Override
	protected void configure(HttpSecurity http) throws Exception {
		// INDENTARE BENE

		http.authorizeRequests().antMatchers("/", "/home", "/assets/**")
				.permitAll().antMatchers("/login").permitAll()
				.antMatchers("/registration/**").not().hasAnyRole("ADMIN","CLASSIC_USER")
				.antMatchers("/utente/**").hasRole("ADMIN")
				.antMatchers("/areaprivata/**").hasAnyRole("CLASSIC_USER", "ADMIN")
				.antMatchers("/acquisto/**").hasAnyRole("ADMIN", "CLASSIC_USER")
				.antMatchers("/**").permitAll()


				.anyRequest().authenticated()
				.and().exceptionHandling().accessDeniedPage("/accessDenied")
				.and().formLogin().loginPage("/login").defaultSuccessUrl("/home")
				.failureUrl("/login?error=true").permitAll()
				.and().logout().logoutSuccessUrl("/login?logout=true")
				.invalidateHttpSession(true).permitAll()
				.and().csrf().disable();


	}

	/*http.authorizeRequests().antMatchers("/", "/home").permitAll()
				.antMatchers("/assets/**").permitAll()
				.antMatchers("/**").permitAll()
				.antMatchers("/login").permitAll()
				.antMatchers("/registration/**").permitAll()
				.antMatchers("/utente/**").hasRole("ADMIN")
				.antMatchers("/areaprivata/**").hasRole("CLASSIC_USER")
				.antMatchers("/acquisto/**").hasAnyRole("ADMIN", "CLASSIC_USER")



	// .antMatchers("/anonymous*").anonymous()
				.anyRequest().authenticated()
				.and().exceptionHandling().accessDeniedPage("/accessDenied")
				.and().formLogin().loginPage("/login").defaultSuccessUrl("/home")
				.failureUrl("/login?error=true").permitAll()
				.and().logout().logoutSuccessUrl("/login?logout=true")
				.invalidateHttpSession(true).permitAll()
				.and().csrf().disable();*/

}
