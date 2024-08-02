package com.demo.repo;

import java.util.List;

import com.demo.beans.User;

public interface UserRepo {
    void save(User user);
    User findByUsername(String username);
    List<User> findAll();
}


