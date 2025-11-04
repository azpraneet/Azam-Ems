package com.emsApp.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configurers.AbstractHttpConfigurer;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.provisioning.InMemoryUserDetailsManager;
import org.springframework.security.web.SecurityFilterChain;

@Configuration
@EnableWebSecurity
public class WebConfig {

    @Bean
    public SecurityFilterChain securityFilterChain(HttpSecurity http) throws Exception {
        http
                .authorizeHttpRequests(auth -> auth
                        // ✅ Publicly accessible endpoints
                        .requestMatchers("/", "/persons", "/saves", "/savesPerson", "/uploads/**").permitAll()
                        // 🔐 Require login for update endpoints only
                        .requestMatchers("/update/**", "/updatePerson").authenticated()
                        .anyRequest().permitAll()
                )
                // ✅ Use Spring's default login form
                .formLogin(form -> form
                        .defaultSuccessUrl("/persons", true)
                        .permitAll()
                )
                // ✅ Logout configuration
                .logout(logout -> logout
                        .logoutUrl("/logout")
                        .logoutSuccessUrl("/persons")
                        .invalidateHttpSession(true)
                        .deleteCookies("JSESSIONID")
                        .permitAll()
                )
                // ✅ Disable CSRF for dev/testing
                .csrf(AbstractHttpConfigurer::disable)
                // ✅ Make session end when browser/app closes
                .sessionManagement(session -> session
                        .maximumSessions(1) // only 1 login at a time
                        .maxSessionsPreventsLogin(false)
                )
                .rememberMe(remember -> remember.disable()); // ensures no persistent login

        System.out.println("✅ Spring Security active: login required for /update/** only");
        return http.build();
    }

    @Bean
    public InMemoryUserDetailsManager userDetailsService() {
        UserDetails admin = User.withUsername("azam")
                .password("{noop}12345") // {noop} = no encoding
                .roles("ADMIN")
                .build();
        return new InMemoryUserDetailsManager(admin);
    }
}
