package com.demo_bank.demo.controllers;

import com.demo_bank.demo.helpers.HTML;
import com.demo_bank.demo.helpers.Token;
import com.demo_bank.demo.mailMessenger.MailMessenger;
import com.demo_bank.demo.models.User;
import com.demo_bank.demo.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCrypt;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import jakarta.mail.MessagingException; // Updated from javax to jakarta
import jakarta.validation.Valid; // Updated from javax to jakarta
import java.util.Random;

@Controller
public class RegisterController {

    @Autowired
    private UserRepository userRepository;

    @Autowired
    private MailMessenger mailMessenger; // Inject MailMessenger

    @GetMapping("/register")
    public ModelAndView getRegister() {
        ModelAndView getRegisterPage = new ModelAndView("register");
        System.out.println("In Register Page Controller");
        getRegisterPage.addObject("PageTitle", "Register");
        return getRegisterPage;
    }

    @PostMapping("/register")
    public ModelAndView register(@Valid @ModelAttribute("registerUser") User user,
                                 BindingResult result,
                                 @RequestParam("first_name") String first_name,
                                 @RequestParam("last_name") String last_name,
                                 @RequestParam("email") String email,
                                 @RequestParam("password") String password,
                                 @RequestParam("confirm_password") String confirm_password) throws MessagingException {

        ModelAndView registrationPage = new ModelAndView("register");

        // Check For Errors:
        if (result.hasErrors() && confirm_password.isEmpty()) {
            registrationPage.addObject("confirm_pass", "The confirm Field is required");
            return registrationPage;
        }

        // Check for Password Match:
        if (!password.equals(confirm_password)) {
            registrationPage.addObject("passwordMisMatch", "Passwords do not match");
            return registrationPage;
        }

        // Generate Token:
        String token = Token.generateToken();

        // Generate Random Code:
        Random rand = new Random();
        int bound = 123;
        int code = bound * rand.nextInt(bound);

        // Get Email HTML Body:
        String emailBody = HTML.htmlEmailTemplate(token, code);

        // Hash Password:
        String hashed_password = BCrypt.hashpw(password, BCrypt.gensalt());

        // Register User:
        userRepository.registerUser(first_name, last_name, email, hashed_password, token, code);

        // Send Email Notification:
        mailMessenger.htmlEmailMessenger("mohamedsameerazad8@gmail.com", email, "Verify Account", emailBody);

        // Set flag to hide the form
        registrationPage.addObject("isRegistered", true); // Flag to indicate registration success

        // Return to Register Page:
        String successMessage = "Account Registered Successfully, Please Check your Email and Verify Account!";
        registrationPage.addObject("success", successMessage);
        return registrationPage;
    }
}
