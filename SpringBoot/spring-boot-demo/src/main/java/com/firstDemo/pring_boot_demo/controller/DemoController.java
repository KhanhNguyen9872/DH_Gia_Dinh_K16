package com.firstDemo.pring_boot_demo.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import java.util.Date;

@Controller
public class DemoController {
    @GetMapping("/xin-chao")
    public String xinChao(Model model){
        model.addAttribute("message","Toi la giang vien");
        model.addAttribute("time", new Date());
        return "xin-chao";
    }
}