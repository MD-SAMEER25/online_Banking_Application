package com.demo_bank.demo.controllers;

import com.demo_bank.demo.helpers.Token;
import com.demo_bank.demo.models.User;
import com.demo_bank.demo.repository.UserRepository;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCrypt;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class AuthController {
    @Autowired
    private UserRepository userRepository;

    @GetMapping("/home")  // Root mapping
    public ModelAndView getIndex() {
        System.out.println("in index page controller");
        ModelAndView indexPage = new ModelAndView("index");
        String token = Token.generateToken();
        indexPage.addObject("token", token);
        indexPage.addObject("PageTitle", "Home");
        return indexPage;
    }

    @PostMapping("/index")
    public String index(@RequestParam("email") String email,
                        @RequestParam("password") String password,
                        Model model,
                        RedirectAttributes redirectAttributes, HttpSession session) {

        // Validate input fields
        if (email.isEmpty()) {
            model.addAttribute("error", "Username cannot be empty");
            return "index";
        } else if (password.isEmpty()) {
            model.addAttribute("error", "Password cannot be empty");
            return "index";
        }

        // Check if email exists
        String getEmailInDatabase = userRepository.getUserEmail(email);

        if (getEmailInDatabase != null) {
            // Get password from database
            String getPasswordInDatabase = userRepository.getUserPassword(getEmailInDatabase);

            // Validate password
            if (!BCrypt.checkpw(password, getPasswordInDatabase)) {
                model.addAttribute("error", "Incorrect Username or Password");
                return "index";
            }

            // Check if user account is verified
            int verified = userRepository.isVerified(getEmailInDatabase);

            if (verified != 1) {
                model.addAttribute("error", "This account is not yet verified, please check your email and verify your account.");
                return "index";
            }

            // Generate token
            String token = Token.generateToken();



            // Get user details and set session attributes
            User user = userRepository.getUserDetails(getEmailInDatabase);
            session.setAttribute("user", user);
            session.setAttribute("token", token);
            session.setAttribute("authenticated", true);

            return "redirect:/app/dashboard";

        } else {
            model.addAttribute("error", "Something went wrong, please contact support");
            return "index";
        }
    }
    @GetMapping("/logout")
    public String logout(HttpSession session, RedirectAttributes redirectAttributes){
        session.invalidate();
        redirectAttributes.addFlashAttribute("logged_out", "Logged out successfully");
        return "redirect:/index";
    }
}
