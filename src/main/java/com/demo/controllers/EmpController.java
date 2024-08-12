package com.demo.controllers;

import java.util.List;

import com.demo.service.EmpService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import com.demo.beans.Emp;

import javax.servlet.http.HttpSession;

@Controller
public class EmpController {

    @Autowired
    private EmpService service;

    @GetMapping("/empform")
    public String showform(Model m, HttpSession session) {
        m.addAttribute("command", new Emp());
        m.addAttribute("username", session.getAttribute("username"));
        m.addAttribute("profileImageUrl", session.getAttribute("profileImageUrl"));
        return "empform";
    }

    @PostMapping("/save")
    public String save(@ModelAttribute("emp") Emp emp, Model model, HttpSession session) {
        int userId = (int) session.getAttribute("user_id");
        emp.setUser_id(userId);
        boolean isSaved = service.save(emp);
        String message;
        if (isSaved) {
            message = "Employee added successfully.";
        } else {
            message = "Employee with this name already exists.";
        }
        model.addAttribute("username", session.getAttribute("username"));
        return "redirect:/viewemp?message=" + message;
    }

    @RequestMapping("/viewemp")
    public String viewEmp(Model model, @RequestParam(value = "message", required = false) String message, HttpSession session) {
        int userId = (int) session.getAttribute("user_id");
        List<Emp> list = service.getEmployees(userId);
        model.addAttribute("lists", list);
        model.addAttribute("message", message);
        model.addAttribute("username", session.getAttribute("username"));
        model.addAttribute("profileImageUrl", session.getAttribute("profileImageUrl"));
        return "viewemp";
    }

    @GetMapping("/editemp/{id}")
    public String edit(@PathVariable int id, Model m, HttpSession session) {
        m.addAttribute("profileImageUrl", session.getAttribute("profileImageUrl"));
        int userId = (int) session.getAttribute("user_id");
        Emp emp = service.getEmpById(id, userId);
        m.addAttribute("command", emp);
        m.addAttribute("username", session.getAttribute("username"));
        return "empeditform";
    }

    @PostMapping("/editsave")
    public String editsave(@ModelAttribute("command") Emp emp, HttpSession session) {
        int userId = (int) session.getAttribute("user_id");
        emp.setUser_id(userId);
        service.update(emp);
        return "redirect:/viewemp";
    }

    @GetMapping("/deleteemp/{id}")
    public String delete(@PathVariable int id, HttpSession session) {
        int userId = (int) session.getAttribute("user_id");
        service.delete(id, userId);
        return "redirect:/viewemp";
    }
}

