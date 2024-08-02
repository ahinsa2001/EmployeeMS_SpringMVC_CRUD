package com.demo.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.demo.beans.User;
import com.demo.repo.UserRepo;

@Service
public class UserService {

    @Autowired
    private UserRepo userRepo;

    public boolean register(User user) {
        if (userRepo.findByUsername(user.getUsername()) != null) {
            return false; // Username already exists
        }
        userRepo.save(user);
        return true;
    }

    public User login(String username, String password) {
        User user = userRepo.findByUsername(username);
        if (user != null && user.getPassword().equals(password)) {
            return user; // Login successful
        }
        return null; // Login failed
    }

    public List<User> getAllUsers() {
        return userRepo.findAll();
    }
}
