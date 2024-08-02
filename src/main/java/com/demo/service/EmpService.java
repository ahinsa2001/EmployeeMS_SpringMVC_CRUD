package com.demo.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.demo.beans.Emp;
import com.demo.repo.EmpRepo;

@Service
public class EmpService {

    @Autowired
    private EmpRepo repository;

    public boolean save(Emp emp) {
        List<Emp> existingEmployees = repository.getEmployees(emp.getUser_id());
        for (Emp existingEmp : existingEmployees) {
            if (existingEmp.getName().equalsIgnoreCase(emp.getName())) {
                return false; // Employee with the same name exists
            }
        }
        repository.save(emp);
        return true; // Employee saved successfully
    }

    public void update(Emp emp) {
        repository.update(emp);
    }

    public void delete(int id, int user_id) {
        repository.delete(id, user_id);
    }

    public Emp getEmpById(int id, int user_id) {
        return repository.getEmpById(id, user_id);
    }

    public List<Emp> getEmployees(int user_id) {
        return repository.getEmployees(user_id);
    }
}


//package com.demo.service;
//
//import java.util.List;
//
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.stereotype.Service;
//
//import com.demo.beans.Emp;
//import com.demo.repo.EmpRepo;
//
//@Service
//public class EmpService {
//
//    @Autowired
//    private EmpRepo repository;
//
////    public void save(Emp emp) {
////        repository.save(emp);
////    }
//
//    public boolean save(Emp emp) {
//        // Check if employee with the same name already exists
//        List<Emp> existingEmployees = repository.getEmployees();
//        for (Emp existingEmp : existingEmployees) {
//            if (existingEmp.getName().equalsIgnoreCase(emp.getName())) {
//                return false; // Employee with the same name exists
//            }
//        }
//        repository.save(emp);
//        return true; // Employee saved successfully
//    }
//
//
//    public void update(Emp emp) {
//        repository.update(emp);
//    }
//
//    public void delete(int id) {
//        repository.delete(id);
//    }
//
//    public Emp getEmpById(int id) {
//        return repository.getEmpById(id);
//    }
//
//    public List<Emp> getEmployees() {
//        return repository.getEmployees();
//    }
//
//}
