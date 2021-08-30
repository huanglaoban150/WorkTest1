package com.hg.service;

import com.hg.mapper.UserMapper;
import com.hg.mapper.UsersPageMapper;
import com.hg.pojo.Employee;
import com.hg.pojo.UsersPage;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class EmployeeImpI implements  EmployeeService{
    @Autowired
    private UsersPageMapper usersPageMapper;
    @Override
    public List<Employee> findByEmpolyee(UsersPage usersPage) {
        List<Employee> list = usersPageMapper.selectEmployee(usersPage);
        return list;
    }
}
