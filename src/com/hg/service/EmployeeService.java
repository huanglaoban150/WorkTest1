package com.hg.service;

import com.hg.pojo.Employee;
import com.hg.pojo.UsersPage;

import java.util.List;

public interface EmployeeService {
    List<Employee> findByEmpolyee(UsersPage usersPage);
}
