package com.springboot.dev_spring_boot_demo.security;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configurers.AuthorizeHttpRequestsConfigurer;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.provisioning.InMemoryUserDetailsManager;
import org.springframework.security.web.SecurityFilterChain;

@Configuration
public class SecurityConfig {
    @Bean
    public InMemoryUserDetailsManager inMemoryUserDetailsManager() {
        UserDetails user = User.builder()
                .username("khanh")
                .password("{noop}khanh")
                .roles("STUDENT")
                .build();

        UserDetails user2 = User.builder()
                .username("khanh1")
                .password("{noop}khanh1")
                .roles("STUDENT", "MANAGER")
                .build();

        UserDetails user3 = User.builder()
                .username("khanh2")
                .password("{noop}khanh2")
                .roles("STUDENT","ADMIN", "MANAGER")
                .build();
        return new InMemoryUserDetailsManager(user, user2, user3);
    }

    @Bean
    public SecurityFilterChain securityFilterChain(HttpSecurity http) throws Exception {
        http.authorizeHttpRequests(configurer ->
            configurer
                    .requestMatchers("/").hasRole("STUDENT")
                    .requestMatchers("/admin").hasRole("MANAGER")
                    .requestMatchers("/system").hasRole("ADMIN")
                    .anyRequest().authenticated()
        )
                .formLogin(form ->
                        form.loginPage("/login")
                .loginProcessingUrl("/authenticateTheUser")
                                .permitAll()
                )
                .logout(logout ->
                        logout.logoutUrl("/logout")
                ).exceptionHandling(configurer ->
                        configurer.accessDeniedPage("/accessDenied"));

        return http.build();
    }

}
