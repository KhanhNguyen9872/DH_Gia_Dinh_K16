package com.gdu_springboot.springboot_demo.security;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.http.HttpMethod;
import org.springframework.security.config.Customizer;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.provisioning.InMemoryUserDetailsManager;
import org.springframework.security.provisioning.JdbcUserDetailsManager;
import org.springframework.security.provisioning.UserDetailsManager;
import org.springframework.security.web.SecurityFilterChain;

import javax.sql.DataSource;

@Configuration
public class SecurityConfig {
    @Bean
    public UserDetailsManager userDetailsManager(DataSource dataSource) {
        JdbcUserDetailsManager userDetailsManager = new JdbcUserDetailsManager(dataSource);
        return userDetailsManager;
    }
    /*@Bean
    public InMemoryUserDetailsManager inMemoryUserDetailsManager() {
        UserDetails lan= User.builder().username("lan").password("{noop}lan").roles("STUDENT").build();
        UserDetails binh=User.builder().username("binh").password("{noop}binh").roles("STUDENT","MANAGER").build();
        UserDetails phuong=User.builder().username("phuong").password("{noop}phuong").roles("MANAGER","ADMIN").build();
        return new InMemoryUserDetailsManager(lan,binh,phuong);
    }*/
    @Bean
    public SecurityFilterChain securityFilterChain(HttpSecurity http) throws Exception {
        http.authorizeHttpRequests(configurer->configurer
                .requestMatchers(HttpMethod.GET,"/api/students").hasRole("STUDENT")
                .requestMatchers(HttpMethod.GET,"/api/students/**").hasRole("STUDENT")
                .requestMatchers(HttpMethod.POST,"/api/students").hasRole("MANAGER")
                .requestMatchers(HttpMethod.PUT,"/api/students").hasRole("MANAGER")
                .requestMatchers(HttpMethod.DELETE,"/api/students/**").hasRole("ADMIN")
        );
        http.httpBasic(Customizer.withDefaults());
        http.csrf(csrf->csrf.disable());
        return http.build();
    }
}
