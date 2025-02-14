package com.firstDemo.pring_boot_demo.controller;

import jakarta.servlet.http.HttpServletRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import java.util.Date;

@Controller
public class HelloController {
    @GetMapping("/hello-form")
    public String xinChao(){
        return "hello-form";
    }

    @GetMapping("/processHelloForm")
    public String processHelloForm(HttpServletRequest request, Model model){
        // doc du lieu tu form
        String theName = request.getParameter("theName");

        theName = theName.toUpperCase();
        
        model.addAttribute("theName", theName);
        return "processHelloForm";
    }
}