package com.demo.repo;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import com.demo.beans.Emp;

@Repository
public class EmpRepo {

    @Autowired
    private JdbcTemplate template;

    public int save(Emp p) {
        String sql = "INSERT INTO Emp99 (name, salary, designation, user_id) VALUES (?, ?, ?, ?)";
        return template.update(sql, p.getName(), p.getSalary(), p.getDesignation(), p.getUser_id());
    }

    public int update(Emp p) {
        String sql = "UPDATE Emp99 SET name = ?, salary = ?, designation = ? WHERE id = ? AND user_id = ?";
        return template.update(sql, p.getName(), p.getSalary(), p.getDesignation(), p.getId(), p.getUser_id());
    }

    public int delete(int id, int user_id) {
        String sql = "DELETE FROM Emp99 WHERE id = ? AND user_id = ?";
        return template.update(sql, id, user_id);
    }

    public Emp getEmpById(int id, int user_id) {
        String sql = "SELECT * FROM Emp99 WHERE id = ? AND user_id = ?";
        return template.queryForObject(sql, new Object[]{id, user_id}, new BeanPropertyRowMapper<Emp>(Emp.class));
    }

    public List<Emp> getEmployees(int user_id) {
        String sql = "SELECT * FROM Emp99 WHERE user_id = ?";
        return template.query(sql, new Object[]{user_id}, new RowMapper<Emp>() {
            public Emp mapRow(ResultSet rs, int row) throws SQLException {
                Emp e = new Emp();
                e.setId(rs.getInt("id"));
                e.setName(rs.getString("name"));
                e.setSalary(rs.getFloat("salary"));
                e.setDesignation(rs.getString("designation"));
                e.setUser_id(rs.getInt("user_id"));
                return e;
            }
        });
    }

    public void setTemplate(JdbcTemplate template) {}
}

//package com.demo.repo;
//
//import java.sql.ResultSet;
//import java.sql.SQLException;
//import java.util.List;
//
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.jdbc.core.BeanPropertyRowMapper;
//import org.springframework.jdbc.core.JdbcTemplate;
//import org.springframework.jdbc.core.RowMapper;
//import org.springframework.stereotype.Repository;
//
//import com.demo.beans.Emp;
//
//@Repository
//public class EmpRepo {
//
//    @Autowired
//    private JdbcTemplate template;
//
//    public int save(Emp p) {
//        String sql = "INSERT INTO Emp99 (name, salary, designation) VALUES (?, ?, ?)";
//        return template.update(sql, p.getName(), p.getSalary(), p.getDesignation());
//    }
//
//    public int update(Emp p) {
//        String sql = "UPDATE Emp99 SET name = ?, salary = ?, designation = ? WHERE id = ?";
//        return template.update(sql, p.getName(), p.getSalary(), p.getDesignation(), p.getId());
//    }
//
//    public int delete(int id) {
//        String sql = "DELETE FROM Emp99 WHERE id = ?";
//        return template.update(sql, id);
//    }
//
//    public Emp getEmpById(int id) {
//        String sql = "SELECT * FROM Emp99 WHERE id = ?";
//        return template.queryForObject(sql, new Object[]{id}, new BeanPropertyRowMapper<Emp>(Emp.class));
//    }
//
//    public List<Emp> getEmployees() {
//        String sql = "SELECT * FROM Emp99";
//        return template.query(sql, new RowMapper<Emp>() {
//            public Emp mapRow(ResultSet rs, int row) throws SQLException {
//                Emp e = new Emp();
//                e.setId(rs.getInt("id"));
//                e.setName(rs.getString("name"));
//                e.setSalary(rs.getFloat("salary"));
//                e.setDesignation(rs.getString("designation"));
//                return e;
//            }
//        });
//    }
//
//    public void setTemplate(JdbcTemplate template) {}
//}
