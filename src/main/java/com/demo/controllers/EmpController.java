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
        return "viewemp";
    }

    @GetMapping("/editemp/{id}")
    public String edit(@PathVariable int id, Model m, HttpSession session) {
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


//package com.demo.controllers;
//
//import java.util.List;
//
//import com.demo.beans.User;
//import com.demo.service.EmpService;
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.stereotype.Controller;
//import org.springframework.ui.Model;
//import org.springframework.web.bind.annotation.*;
//
//import com.demo.beans.Emp;
//
//import javax.servlet.http.HttpSession;
//
//@Controller
//public class EmpController {
//
//    @Autowired
//    private EmpService service;
//
//    @GetMapping("/empform")
//    public String showform(Model m, HttpSession session) {
//        m.addAttribute("command", new Emp());
//        m.addAttribute("username", session.getAttribute("username"));
//        return "empform";
//    }
//
////    @PostMapping("/save")
////    public String save(@ModelAttribute("command") Emp emp) {
////        service.save(emp);
////        return "redirect:/viewemp";
////    }
//
//    @PostMapping("/save")
//    public String save(@ModelAttribute("emp") Emp emp, Model model, HttpSession session) {
//        User user = (User) session.getAttribute("user");
//        boolean isSaved = service.save(emp, user);
//        String message;
//        if (isSaved) {
//            message = "Employee added successfully.";
//        } else {
//            message = "Employee with this name already exists.";
//        }
//        model.addAttribute("username", session.getAttribute("username"));
//        return "redirect:/viewemp?message=" + message;
//    }
//
//    @RequestMapping("/viewemp")
//    public String viewEmp(Model model, @RequestParam(value = "message", required = false) String message, HttpSession session) {
//        User user = (User) session.getAttribute("user");
//        List<Emp> list = service.getEmployees(user);
//        model.addAttribute("lists", list);
//        model.addAttribute("message", message);
//        model.addAttribute("username", session.getAttribute("username"));
//        return "viewemp";
//    }
//
////
////    @GetMapping("/viewemp")
////    public String viewemp(Model m) {
////        List<Emp> list = service.getEmployees();
////        m.addAttribute("lists", list);
////        return "viewemp";
////    }
//
//    @GetMapping("/editemp/{id}")
//    public String edit(@PathVariable int id, Model m, HttpSession session) {
//        User user = (User) session.getAttribute("user");
//        Emp emp = service.getEmpById(id, user);
//        m.addAttribute("command", emp);
//        m.addAttribute("username", session.getAttribute("username"));
//        return "empeditform";
//    }
//
//    @PostMapping("/editsave")
//    public String editsave(@ModelAttribute("command") Emp emp, HttpSession session) {
//        service.update(emp);
//        return "redirect:/viewemp";
//    }
//
//    @GetMapping("/deleteemp/{id}")
//    public String delete(@PathVariable int id, HttpSession session) {
//        User user = (User) session.getAttribute("user");
//        service.delete(id, user);
//        return "redirect:/viewemp";
//    }
//}
//
//
//
//
//
