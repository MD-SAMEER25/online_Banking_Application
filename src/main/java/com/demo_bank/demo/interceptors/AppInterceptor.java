package com.demo_bank.demo.interceptors;

import com.demo_bank.demo.models.User;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@Component
public class AppInterceptor implements HandlerInterceptor {

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        System.out.println("In Pre Handle Interceptor Method");

        // Check if the request is for the /app URI
        if (request.getRequestURI().startsWith("/app")) {
            HttpSession session = request.getSession();

            // Retrieve the token and user from the session
            String token = (String) session.getAttribute("token");
            User user = (User) session.getAttribute("user");

            // Log token and user information
            System.out.println("Token: " + token);
            System.out.println("User: " + (user != null ? user.getUser_id() : "null"));

            // Validate session attributes
            if (token == null || user == null) {
                // Log redirect action
                System.out.println("Redirecting to /index due to missing user or token.");

                // Redirect to login page if token or user is not found
                response.sendRedirect("/index");
                return false; // Stop further handling of this request
            }
        }
        return true; // Allow the request to proceed
    }

    @Override
    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception {
        System.out.println("In Post Handle Interceptor Method");
        // You can modify the model and view here if needed
    }

    @Override
    public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex) throws Exception {
        System.out.println("In After Completion Interceptor Method");
    }
}
