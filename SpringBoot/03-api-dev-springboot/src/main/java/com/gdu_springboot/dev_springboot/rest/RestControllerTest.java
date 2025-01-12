package com.gdu_springboot.dev_springboot.rest;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/api")
public class RestControllerTest {
    @GetMapping("/hello")
    public String hello() {
        return "Hello World";
    }
}
