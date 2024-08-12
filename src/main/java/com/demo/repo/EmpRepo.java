package com.demo.repo;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.demo.beans.Emp;

@Repository
public class EmpRepo {

    @Autowired
    private SessionFactory sessionFactory;

    @Transactional
    public int save(Emp emp) {
        Session session = sessionFactory.getCurrentSession();
        session.save(emp);
        return emp.getId();  // Return the generated ID after save
    }

    @Transactional
    public int update(Emp emp) {
        Session session = sessionFactory.getCurrentSession();
        session.update(emp);
        return emp.getId();
    }

    @Transactional
    public int delete(int id, int user_id) {
        Session session = sessionFactory.getCurrentSession();
        Emp emp = session.get(Emp.class, id);
        if (emp != null && emp.getUser_id() == user_id) {
            session.delete(emp);
            return id;
        }
        return 0;  // Return 0 if the employee wasn't found or user_id didn't match
    }

    @Transactional
    public Emp getEmpById(int id, int user_id) {
        Session session = sessionFactory.getCurrentSession();
        Emp emp = session.get(Emp.class, id);
        return (emp != null && emp.getUser_id() == user_id) ? emp : null;
    }

    @Transactional
    public List<Emp> getEmployees(int user_id) {
        Session session = sessionFactory.getCurrentSession();
        String hql = "FROM Emp WHERE user_id = :userId";
        return session.createQuery(hql, Emp.class)
                .setParameter("userId", user_id)
                .getResultList();
    }
//
//    @Autowired
//    private JdbcTemplate template;
//
//    public int save(Emp p) {
//        String sql = "INSERT INTO Emp99 (name, salary, designation, user_id) VALUES (?, ?, ?, ?)";
//        return template.update(sql, p.getName(), p.getSalary(), p.getDesignation(), p.getUser_id());
//    }
//
//    public int update(Emp p) {
//        String sql = "UPDATE Emp99 SET name = ?, salary = ?, designation = ? WHERE id = ? AND user_id = ?";
//        return template.update(sql, p.getName(), p.getSalary(), p.getDesignation(), p.getId(), p.getUser_id());
//    }
//
//    public int delete(int id, int user_id) {
//        String sql = "DELETE FROM Emp99 WHERE id = ? AND user_id = ?";
//        return template.update(sql, id, user_id);
//    }
//
//    public Emp getEmpById(int id, int user_id) {
//        String sql = "SELECT * FROM Emp99 WHERE id = ? AND user_id = ?";
//        return template.queryForObject(sql, new Object[]{id, user_id}, new BeanPropertyRowMapper<Emp>(Emp.class));
//    }
//
//    public List<Emp> getEmployees(int user_id) {
//        String sql = "SELECT * FROM Emp99 WHERE user_id = ?";
//        return template.query(sql, new Object[]{user_id}, new RowMapper<Emp>() {
//            public Emp mapRow(ResultSet rs, int row) throws SQLException {
//                Emp e = new Emp();
//                e.setId(rs.getInt("id"));
//                e.setName(rs.getString("name"));
//                e.setSalary(rs.getFloat("salary"));
//                e.setDesignation(rs.getString("designation"));
//                e.setUser_id(rs.getInt("user_id"));
//                return e;
//            }
//        });
//    }
//
//    public void setTemplate(JdbcTemplate template) {}
}