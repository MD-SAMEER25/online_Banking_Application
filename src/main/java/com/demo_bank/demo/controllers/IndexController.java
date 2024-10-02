package com.demo_bank.demo.controllers;

import com.demo_bank.demo.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class IndexController {

    @Autowired
    private UserRepository userRepository;

    @GetMapping("/index")  // Root mapping
    public ModelAndView getIndex() {
        ModelAndView indexPage = new ModelAndView("index");
        indexPage.addObject("PageTitle", "Home");
        return indexPage;
    }

    @GetMapping("/error")
    public ModelAndView getError() {
        ModelAndView errorPage = new ModelAndView("error");
        errorPage.addObject("PageTitle", "Errors");
        System.out.println("In Error Page Controller");
        return errorPage;
    }

    @GetMapping("/home/register")
    public ModelAndView getRegister() {
        ModelAndView registerPage = new ModelAndView("register");
        registerPage.addObject("PageTitle", "Register");
        System.out.println("In Register Page Controller");
        return registerPage;
    }

    @GetMapping("/verify")
    public ModelAndView getVerify(@RequestParam("token") String token, @RequestParam("code") String code) {

        ModelAndView getVerifyPage;

        // Get Token In Database:
        String dbToken = userRepository.checkToken(token);

        // Check If Token Is Valid:
        if(dbToken == null){
            getVerifyPage  = new ModelAndView("error");
            getVerifyPage.addObject("error", "This Session Has Expired");
            return  getVerifyPage;
        }
        // End Of Check If Token Is Valid.
        userRepository.verifyAccount(token, code);

        getVerifyPage = new ModelAndView("index");
        getVerifyPage.addObject("success", "Account Verified Successfully, Please proceed to Log In!");
        System.out.println("In Verify Account Controller");
        return getVerifyPage;
    }

    @RequestMapping("favicon.ico")
    public void favicon() {
        // This will suppress the favicon.ico request
    }
}
