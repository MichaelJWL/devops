package com.test;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@SpringBootApplication
@Controller
public class StartApplication {
    @Value("${param.name}")
    String myName;

    @Value("${param.homework.name}")
    String homeworkName;

    @Value("${param.homework.due}")
    String dateString;

    @GetMapping("/")
    public String index(final Model model) {
        model.addAttribute("title", "Docker 활용");
        model.addAttribute("msg", "Docker 빌드 테스트 입니다.");
        return "index";
    }

    @GetMapping("/homework")
    public String homeworkPage(final Model model) {
        StringBuilder sb = new StringBuilder();
        sb.append(homeworkName);
        sb.append("/");
        sb.append(dateString);
        sb.append("까지임.");

        model.addAttribute("title", myName + " Homework");
        model.addAttribute("msg", sb.toString());
        return "homework";
    }
    public static void main(String[] args) {
        SpringApplication.run(StartApplication.class, args);
    }

}
