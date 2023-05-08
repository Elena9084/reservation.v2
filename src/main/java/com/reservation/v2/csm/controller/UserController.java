package com.reservation.v2.csm.controller;

import com.reservation.v2.csm.model.UserModel;
import com.reservation.v2.csm.service.UserService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpSession;

@Controller
@Slf4j
public class UserController {

    @Autowired
    private UserService userService;

    @GetMapping("/login")
    public String login() {
        log.info("login 컨트롤러 화면 전달");

        return "/user/login";
    }

    @PostMapping("/login")
    public String loginExec(@RequestParam("userId") String userId, @RequestParam("password") String password, HttpSession session
                , Model model){
        log.info("loginExec 컨트롤러 userId : {}, password : {}", userId, password);
        UserModel login = userService.getUserOne(userId, password);

        if(login != null){
            log.info("loginExec 컨트롤러 로그인 성공 login : {}", login);
            session.setAttribute("loginUser", login);
            return "redirect:/home";
        }else {
            log.info("loginExec 컨트롤러 로그인 실패");
            model.addAttribute("error", "올바른 정보를 입력해주세요.");
            return "/user/login";
        }

    }

    @GetMapping("/logout")
    public String logout(HttpSession session){
        log.info("logout 컨트롤러");
        session.invalidate();
        return "redirect:/home";
    }




}
