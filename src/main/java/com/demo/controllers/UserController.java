package com.demo.controllers;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import com.demo.beans.User;
import com.demo.service.UserService;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;

@Controller
public class UserController {

    @Autowired
    private UserService userService;

    @GetMapping("/")
    public String index() {
        return "redirect:/login";
    }

    @RequestMapping("/register")
    public String showRegistrationForm(Model model) {
        model.addAttribute("user", new User());
        return "register";
    }

    @PostMapping("/register")
    public String register(@ModelAttribute("user") User user,
                           @RequestParam("profileImage") MultipartFile file,
                           Model model) {
        if (!file.isEmpty()) {
            try {
                // Set the directory where you want to save the uploaded files
                String uploadDirectory = "F:/test/test/myproject/uploads/profileImages";

                String fileName = file.getOriginalFilename();
                Path filePath = Paths.get(uploadDirectory, fileName);

                // Create directories if they do not exist
                if (!Files.exists(filePath.getParent())) {
                    Files.createDirectories(filePath.getParent());
                }

                // Save the file locally
                System.out.println("Uploading file to: " + filePath.toString());
                Files.copy(file.getInputStream(), filePath, StandardCopyOption.REPLACE_EXISTING);
                System.out.println("File uploaded successfully.");

                // Set the profile image path in the user model
                user.setProfileImagePath(fileName); // Save only the filename

            } catch (IOException e) {
                model.addAttribute("message", "Failed to upload image!");
                return "register";
            }
        }

        if (userService.register(user)) {
            System.out.println("User registered successfully.");
            model.addAttribute("message", "Registration successful!");
            return "redirect:/login";
        } else {
            System.out.println("Registration failed. Username may already exist.");
            model.addAttribute("message", "Username already exists!");
            return "register";
        }
    }


    @RequestMapping("/login")
    public String showLoginForm(Model model) {
        model.addAttribute("user", new User());
        return "login";
    }

    @PostMapping("/login")
    public String login(@ModelAttribute("user") User user, Model model, HttpSession session) {
        User authenticatedUser = userService.login(user.getUsername(), user.getPassword());
        if (authenticatedUser != null) {
            session.setAttribute("user", authenticatedUser);
            session.setAttribute("username", authenticatedUser.getUsername());
            session.setAttribute("user_id", authenticatedUser.getId());
            session.setAttribute("profileImageUrl", "./uploads/profileImages/" + authenticatedUser.getProfileImagePath());
            return "redirect:/home";
        } else {
            model.addAttribute("message", "Invalid username or password!");
            return "login";
        }
    }

    @RequestMapping("/logout")
    public String logout(HttpSession session) {
        session.invalidate();
        return "redirect:/login";
    }

    @RequestMapping("/home")
    public String home(HttpSession session, Model model) {
        User user = (User) session.getAttribute("user");
        if (user != null) {
            model.addAttribute("username", user.getUsername());
            model.addAttribute("user_id", user.getId());
            model.addAttribute("profileImageUrl", "./uploads/profileImages/" + user.getProfileImagePath());
            return "home";
        }
        return "redirect:/login";
    }
}
