package com.demo.interceptors;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.HandlerInterceptor;

public class AuthenticationInterceptor implements HandlerInterceptor {

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {

        // Exclude the login page and register page from interception
        String uri = request.getRequestURI();
        if (uri.endsWith("/login") || uri.endsWith("/register")) {
            return true;
        }

        // Logging the request details
        System.out.println("Request URL: " + request.getRequestURL());
        System.out.println("Request Method: " + request.getMethod());
        System.out.println("Request IP: " + request.getRemoteAddr());

        // Check if the user is authenticated
        HttpSession session = request.getSession(false); // Don't create a new session if it doesn't exist
        if (session != null && session.getAttribute("username") != null) {
            // User is authenticated, continue processing the request
            return true;
        } else {
            // User is not authenticated, redirect to login page
            response.sendRedirect(request.getContextPath() + "/login");
            return false; // Prevent the controller from handling the request
        }
    }
}
