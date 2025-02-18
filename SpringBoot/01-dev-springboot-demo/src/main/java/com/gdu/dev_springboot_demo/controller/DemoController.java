package com.gdu.dev_springboot_demo.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class DemoController {
    @GetMapping("/xin-chao")
    public String xinChao(Model model) {
        model.addAttribute("message","Toi la giang vien");
        model.addAttribute("time",java.time.LocalDate.now());
        return "xin-chao";
    }
}
